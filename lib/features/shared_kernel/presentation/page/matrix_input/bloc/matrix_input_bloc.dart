import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:matrix/features/shared_kernel/domain/entities/matrix_domain.dart';
import 'package:matrix/features/shared_kernel/domain/repositories/matrix_repository.dart';
import 'package:matrix/features/shared_kernel/domain/use_case/rotate_matrix_use_case.dart';
import 'package:matrix/features/shared_kernel/presentation/navigation/routes.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_input/bloc/matrix_input_event.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_input/bloc/matrix_input_model.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_input/bloc/matrix_input_side_effect.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_input/bloc/matrix_input_status.dart';
import 'package:matrix/platform/bloc/side_effect_bloc_mixin.dart';

@injectable
class MatrixInputBloc extends Bloc<MatrixInputEvent, MatrixInputModel>
    with
        SideEffectBlocMixin<
          MatrixInputEvent,
          MatrixInputModel,
          MatrixInputSideEffect
        > {
  final MatrixRepository _matrixRepository;
  final RotateMatrixUseCase _rotateMatrixUseCase;

  MatrixInputBloc({
    required MatrixRepository matrixRepository,
    required RotateMatrixUseCase rotateMatrixUseCase,
  }) : _matrixRepository = matrixRepository,
       _rotateMatrixUseCase = rotateMatrixUseCase,
       super(const MatrixInputModel(status: MatrixInputStatus.initial())) {
    on<MatrixInputEvent>((event, emit) async {
      switch (event) {
        case MatrixInputEventInitialized():
          await emit.forEach<MatrixInputModel>(
            _onInitialized(event),
            onData: (data) => data,
          );
          break;
        case MatrixInputEventMatrixInputChanged():
          await emit.forEach<MatrixInputModel>(
            _onMatrixInputChanged(event),
            onData: (data) => data,
          );
          break;
        case MatrixInputEventRotateButtonPressed():
          await emit.forEach<MatrixInputModel>(
            _onRotateButtonPressed(event),
            onData: (data) => data,
          );
          break;
        case MatrixInputEventClearButtonPressed():
          await emit.forEach<MatrixInputModel>(
            _onClearButtonPressed(event),
            onData: (data) => data,
          );
          break;
        case MatrixInputEventInputModeToggled():
          await emit.forEach<MatrixInputModel>(
            _onInputModeToggled(event),
            onData: (data) => data,
          );
          break;
        case MatrixInputEventMatrixDimensionsChanged():
          await emit.forEach<MatrixInputModel>(
            _onMatrixDimensionsChanged(event),
            onData: (data) => data,
          );
          break;
        case MatrixInputEventMatrixCellChanged():
          await emit.forEach<MatrixInputModel>(
            _onMatrixCellChanged(event),
            onData: (data) => data,
          );
          break;
      }
    });
  }

  Stream<MatrixInputModel> _onInitialized(
    MatrixInputEventInitialized event,
  ) async* {
    yield state.copyWith(status: const MatrixInputStatus.ready());
  }

  Stream<MatrixInputModel> _onMatrixInputChanged(
    MatrixInputEventMatrixInputChanged event,
  ) async* {
    yield state.copyWith(matrixInput: event.input);

    if (event.input.isEmpty) {
      yield state.copyWith(isValidInput: false);
      return;
    }

    try {
      MatrixDomain.parseFromString(event.input);
      yield state.copyWith(isValidInput: true, errorMessage: null);
    } catch (e) {
      yield state.copyWith(isValidInput: false, errorMessage: e.toString());
    }
  }

  Stream<MatrixInputModel> _onRotateButtonPressed(
    MatrixInputEventRotateButtonPressed event,
  ) async* {
    if (!state.isValidInput) {
      yield state.copyWith(
        status: const MatrixInputStatus.error(
          message: 'Please enter a valid matrix first',
        ),
      );
      return;
    }

    yield state.copyWith(status: const MatrixInputStatus.loading());

    try {
      final originalMatrix = MatrixDomain.parseFromString(state.matrixInput);

      if (!originalMatrix.isValidSquareMatrix()) {
        yield state.copyWith(
          status: const MatrixInputStatus.error(
            message: 'Matrix must be square (NxN)',
          ),
        );
        return;
      }

      final rotatedMatrix = _rotateMatrixUseCase.call(originalMatrix);

      // Guardar en repositorio
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      await _matrixRepository.saveMatrix('original_$timestamp', originalMatrix);
      await _matrixRepository.saveMatrix('rotated_$timestamp', rotatedMatrix);

      // Mostrar un breve toast con la matriz original
      produceSideEffect(
        MatrixInputSideEffect.showToast(
          message: 'Matrix rotated successfully!',
        ),
      );

      // Navegar a la página de resultados con los datos de las matrices
      produceSideEffect(
        MatrixInputSideEffect.navigateTo(
          route: Routes.matrixResult,
          arguments: {
            'originalMatrix': originalMatrix.values,
            'rotatedMatrix': rotatedMatrix.values,
          },
        ),
      );

      // Restablecer el estado a "ready" para permitir nuevas entradas
      yield state.copyWith(
        status: const MatrixInputStatus.ready(),
      );
      
    } catch (e) {
      yield state.copyWith(
        status: MatrixInputStatus.error(message: e.toString()),
      );
    }
  }

  Stream<MatrixInputModel> _onClearButtonPressed(
    MatrixInputEventClearButtonPressed event,
  ) async* {
    yield state.copyWith(
      matrixInput: '',
      isValidInput: false,
      errorMessage: null,
      status: const MatrixInputStatus.ready(),
    );
  }

  Stream<MatrixInputModel> _onInputModeToggled(
    MatrixInputEventInputModeToggled event,
  ) async* {
    final newMode = !state.isVisualInputMode;
    
    if (newMode) {
      // Switching to visual mode - try to parse current input or create empty
      try {
        MatrixDomain matrix;
        
        if (state.matrixInput.isNotEmpty && state.isValidInput) {
          // If we have valid input, parse it
          matrix = MatrixDomain.parseFromString(state.matrixInput);
        } else {
          // Otherwise create an empty matrix of specified size
          matrix = MatrixDomain(
            List.generate(state.matrixSize, (_) => List.filled(state.matrixSize, 0)),
          );
        }
        
        yield state.copyWith(
          isVisualInputMode: true,
          matrixValues: matrix.values,
        );
      } catch (e) {
        // On error, create an empty matrix
        final emptyMatrix = List.generate(
          state.matrixSize, 
          (_) => List.filled(state.matrixSize, 0),
        );
        
        yield state.copyWith(
          isVisualInputMode: true,
          matrixValues: emptyMatrix,
        );
      }
    } else {
      // Switching to text mode - convert visual matrix to JSON
      if (state.matrixValues != null) {
        final matrixJson = jsonEncode(state.matrixValues);
        yield state.copyWith(
          isVisualInputMode: false,
          matrixInput: matrixJson,
          isValidInput: true,
        );
      } else {
        yield state.copyWith(
          isVisualInputMode: false,
        );
      }
    }
  }

  Stream<MatrixInputModel> _onMatrixDimensionsChanged(
    MatrixInputEventMatrixDimensionsChanged event,
  ) async* {
    if (event.size < 1 || event.size > 10) {
      yield state.copyWith(
        status: const MatrixInputStatus.error(message: 'Matrix size must be between 1 and 10'),
      );
      return;
    }
    
    // Create a new empty matrix with the new dimensions
    final emptyMatrix = List.generate(
      event.size, 
      (_) => List.filled(event.size, 0),
    );
    
    yield state.copyWith(
      matrixSize: event.size,
      matrixValues: emptyMatrix,
      status: const MatrixInputStatus.ready(),
    );
  }

  Stream<MatrixInputModel> _onMatrixCellChanged(
    MatrixInputEventMatrixCellChanged event,
  ) async* {
    if (state.matrixValues == null) return;
    
    // Create a deep copy of the current matrix
    final List<List<int>> updatedMatrix = List.generate(
      state.matrixValues!.length,
      (i) => List<int>.from(state.matrixValues![i]),
    );
    
    // Update the specified cell if in valid range
    if (event.row >= 0 && event.row < updatedMatrix.length &&
        event.column >= 0 && event.column < updatedMatrix[event.row].length) {
      updatedMatrix[event.row][event.column] = event.value;
    }
    
    yield state.copyWith(
      matrixValues: updatedMatrix,
      isValidInput: true,
    );
  }
}