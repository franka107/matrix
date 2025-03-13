import 'dart:convert';
import 'dart:math';

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
        case MatrixInputEventGenerateRandomMatrix():
          await emit.forEach<MatrixInputModel>(
            _onGenerateRandomMatrix(event),
            onData: (data) => data,
          );
          break;
      }
    });
  }

  int _getRandomInt(int min, int max) {
    return (min + Random().nextInt(max - min + 1)).toInt();
  }

  Stream<MatrixInputModel> _onGenerateRandomMatrix(
    MatrixInputEventGenerateRandomMatrix event,
  ) async* {
    // Generar valores aleatorios entre -9 y 9
    final randomMatrix = List.generate(
      state.matrixSize,
      (_) => List.generate(state.matrixSize, (_) => _getRandomInt(-9, 9)),
    );

    final randomMatrixJson = jsonEncode(randomMatrix);

    if (state.isVisualInputMode) {
      yield state.copyWith(
        matrixValues: randomMatrix,
        isValidInput: true,
        errorMessage: null,
      );
    } else {
      yield state.copyWith(
        matrixInput: randomMatrixJson,
        matrixValues: randomMatrix,
        isValidInput: true,
        errorMessage: null,
      );
    }

    // Mostrar un mensaje de éxito
    produceSideEffect(
      MatrixInputSideEffect.showToast(
        message:
            'Matriz aleatoria ${state.matrixSize}x${state.matrixSize} generada',
      ),
    );
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
      // Convertir el error técnico a un mensaje amigable
      String userFriendlyMessage = _getUserFriendlyErrorMessage(e.toString());
      yield state.copyWith(
        isValidInput: false,
        errorMessage: userFriendlyMessage,
      );
    }
  }

  // Método para convertir errores técnicos en mensajes comprensibles
  String _getUserFriendlyErrorMessage(String errorMessage) {
    if (errorMessage.contains('FormatException')) {
      if (errorMessage.contains('Each row must be an array')) {
        return 'Formato inválido: cada fila debe ser un array. Ejemplo: [[1,2],[3,4]]';
      } else if (errorMessage.contains('Each value must be a number')) {
        return 'Formato inválido: todos los valores deben ser números.';
      } else {
        return 'Formato de matriz inválido. Asegúrate de usar la estructura JSON correcta: [[1,2],[3,4]]';
      }
    } else if (errorMessage.contains('Unexpected')) {
      return 'Formato JSON inválido. Revisa que los corchetes y comas estén correctos.';
    } else if (errorMessage.contains('Empty')) {
      return 'La matriz no puede estar vacía.';
    } else {
      // Si no reconocemos el error, damos un mensaje genérico
      return 'Formato inválido. Verifica que la matriz esté en formato correcto: [[1,2],[3,4]]';
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
      yield state.copyWith(status: const MatrixInputStatus.ready());
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
            List.generate(
              state.matrixSize,
              (_) => List.filled(state.matrixSize, 0),
            ),
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
        yield state.copyWith(isVisualInputMode: false);
      }
    }
  }

  Stream<MatrixInputModel> _onMatrixDimensionsChanged(
    MatrixInputEventMatrixDimensionsChanged event,
  ) async* {
    if (event.size < 1 || event.size > 10) {
      yield state.copyWith(
        status: const MatrixInputStatus.error(
          message: 'El tamaño de la matriz debe estar entre 1 y 10',
        ),
      );
      return;
    }

    final emptyMatrix = List.generate(
      event.size,
      (_) => List.filled(event.size, 0),
    );

    final matrixJson = jsonEncode(emptyMatrix);

    yield state.copyWith(
      matrixSize: event.size,
      matrixValues: emptyMatrix,
      matrixInput: matrixJson, // Importante: actualiza siempre el texto
      isValidInput: true, // La matriz vacía generada es válida
      errorMessage: null, // Limpia cualquier error
      status: const MatrixInputStatus.ready(),
    );

    produceSideEffect(
      MatrixInputSideEffect.showToast(
        message: 'Matriz ${event.size}x${event.size} creada',
      ),
    );
  }

  Stream<MatrixInputModel> _onMatrixCellChanged(
    MatrixInputEventMatrixCellChanged event,
  ) async* {
    if (state.matrixValues == null) return;

    final List<List<int>> updatedMatrix = List.generate(
      state.matrixValues!.length,
      (i) => List<int>.from(state.matrixValues![i]),
    );

    if (event.row >= 0 &&
        event.row < updatedMatrix.length &&
        event.column >= 0 &&
        event.column < updatedMatrix[event.row].length) {
      updatedMatrix[event.row][event.column] = event.value;
    }

    yield state.copyWith(matrixValues: updatedMatrix, isValidInput: true);
  }
}
