import 'package:freezed_annotation/freezed_annotation.dart';

part 'matrix_input_status.freezed.dart';

@freezed
sealed class MatrixInputStatus with _$MatrixInputStatus {
  const factory MatrixInputStatus.initial() = MatrixInputStatusInitial;
  const factory MatrixInputStatus.loading() = MatrixInputStatusLoading;
  const factory MatrixInputStatus.ready() = MatrixInputStatusReady;
  const factory MatrixInputStatus.rotationSuccess({
    required List<List<int>> originalMatrix,
    required List<List<int>> rotatedMatrix,
  }) = MatrixInputStatusRotationSuccess;

  const factory MatrixInputStatus.error({required String message}) =
      MatrixInputStatusError;
}
