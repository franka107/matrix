import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:matrix/features/shared_kernel/domain/entities/matrix_domain.dart';
import 'package:matrix/features/shared_kernel/domain/repositories/matrix_repository.dart';
import 'package:matrix/features/shared_kernel/domain/use_case/rotate_matrix_use_case.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_result/bloc/matrix_result_event.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_result/bloc/matrix_result_model.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_result/bloc/matrix_result_side_effect.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_result/bloc/matrix_result_status.dart';
import 'package:matrix/platform/bloc/side_effect_bloc_mixin.dart';

@injectable
class MatrixResultBloc extends Bloc<MatrixResultEvent, MatrixResultModel>
    with
        SideEffectBlocMixin<
          MatrixResultEvent,
          MatrixResultModel,
          MatrixResultSideEffect
        > {
  final MatrixRepository _matrixRepository;
  final RotateMatrixUseCase _rotateMatrixUseCase;

  MatrixResultBloc({
    required MatrixRepository matrixRepository,
    required RotateMatrixUseCase rotateMatrixUseCase,
  }) : _matrixRepository = matrixRepository,
       _rotateMatrixUseCase = rotateMatrixUseCase,
       super(
         const MatrixResultModel(
           status: MatrixResultStatus.initial(),
           showAnimation: true,
         ),
       ) {
    on<MatrixResultEvent>((event, emit) async {
      switch (event) {
        case MatrixResultEventInitialized():
          await emit.forEach<MatrixResultModel>(
            _onInitialized(event),
            onData: (data) => data,
          );
          break;
        case MatrixResultEventRotateAgain():
          await emit.forEach<MatrixResultModel>(
            _onRotateAgain(event),
            onData: (data) => data,
          );
          break;
        case MatrixResultEventCopyMatrixToClipboard():
          await emit.forEach<MatrixResultModel>(
            _onCopyMatrixToClipboard(event),
            onData: (data) => data,
          );
          break;
        case MatrixResultEventViewMatrixHistory():
          await emit.forEach<MatrixResultModel>(
            _onViewMatrixHistory(event),
            onData: (data) => data,
          );
          break;
        case MatrixResultEventLoadMatrixFromHistory():
          await emit.forEach<MatrixResultModel>(
            _onLoadMatrixFromHistory(event),
            onData: (data) => data,
          );
          break;
      }
    });
  }

  Stream<MatrixResultModel> _onInitialized(
    MatrixResultEventInitialized event,
  ) async* {
    if (event.originalMatrix == null || event.rotatedMatrix == null) {
      yield state.copyWith(status: const MatrixResultStatus.ready());
      return;
    }

    yield state.copyWith(
      originalMatrix: event.originalMatrix,
      rotatedMatrix: event.rotatedMatrix,
      status: MatrixResultStatus.rotationSuccess(
        originalMatrix: event.originalMatrix!,
        rotatedMatrix: event.rotatedMatrix!,
      ),
      showAnimation: true,
    );
  }

  Stream<MatrixResultModel> _onRotateAgain(
    MatrixResultEventRotateAgain event,
  ) async* {
    if (state.rotatedMatrix == null) {
      yield state.copyWith(
        status: const MatrixResultStatus.error(
          message: 'No matrix available to rotate',
        ),
      );
      return;
    }

    yield state.copyWith(status: const MatrixResultStatus.loading());

    try {
      final currentMatrix = MatrixDomain(state.rotatedMatrix!);
      final newRotatedMatrix = _rotateMatrixUseCase.call(currentMatrix);
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      await _matrixRepository.saveMatrix('original_$timestamp', currentMatrix);
      await _matrixRepository.saveMatrix(
        'rotated_$timestamp',
        newRotatedMatrix,
      );

      yield state.copyWith(
        originalMatrix: state.rotatedMatrix,
        rotatedMatrix: newRotatedMatrix.values,
        status: MatrixResultStatus.rotationSuccess(
          originalMatrix: state.rotatedMatrix!,
          rotatedMatrix: newRotatedMatrix.values,
        ),
        showAnimation: true,
      );

      produceSideEffect(
        MatrixResultSideEffect.showToast(
          message: 'Matrix rotated 90° counter-clockwise',
        ),
      );
    } catch (e) {
      yield state.copyWith(
        status: MatrixResultStatus.error(message: e.toString()),
      );
    }
  }

  Stream<MatrixResultModel> _onCopyMatrixToClipboard(
    MatrixResultEventCopyMatrixToClipboard event,
  ) async* {
    produceSideEffect(
      MatrixResultSideEffect.copyToClipboard(content: event.matrix),
    );

    yield state;
  }

  Stream<MatrixResultModel> _onViewMatrixHistory(
    MatrixResultEventViewMatrixHistory event,
  ) async* {
    yield state.copyWith(status: const MatrixResultStatus.loading());

    try {
      final allMatrices = await _matrixRepository.getAllMatrices();
      final historyItems = <Map<String, dynamic>>[];

      for (int i = 0; i < allMatrices.length; i += 2) {
        if (i + 1 < allMatrices.length) {
          final original = allMatrices[i];
          final rotated = allMatrices[i + 1];

          historyItems.add({
            'originalMatrix': original.values,
            'rotatedMatrix': rotated.values,
            'timestamp': DateTime.now(),
          });
        }
      }

      yield state.copyWith(
        status: MatrixResultStatus.matrixHistory(matrices: historyItems),
        matrixHistory: historyItems,
      );
    } catch (e) {
      yield state.copyWith(
        status: MatrixResultStatus.error(
          message: 'Failed to load matrix history: ${e.toString()}',
        ),
      );
    }
  }

  Stream<MatrixResultModel> _onLoadMatrixFromHistory(
    MatrixResultEventLoadMatrixFromHistory event,
  ) async* {
    yield state.copyWith(
      originalMatrix: event.originalMatrix,
      rotatedMatrix: event.rotatedMatrix,
      status: MatrixResultStatus.rotationSuccess(
        originalMatrix: event.originalMatrix,
        rotatedMatrix: event.rotatedMatrix,
      ),
      showAnimation: false,
    );

    produceSideEffect(
      MatrixResultSideEffect.showToast(message: 'Matrix loaded from history'),
    );
  }
}
