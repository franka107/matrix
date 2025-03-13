import 'package:freezed_annotation/freezed_annotation.dart';

part 'matrix_result_status.freezed.dart';

@freezed
sealed class MatrixResultStatus with _$MatrixResultStatus {
  const factory MatrixResultStatus.initial() = MatrixResultStatusInitial;
  const factory MatrixResultStatus.loading() = MatrixResultStatusLoading;
  const factory MatrixResultStatus.ready() = MatrixResultStatusReady;
  const factory MatrixResultStatus.rotationSuccess({
    required List<List<int>> originalMatrix,
    required List<List<int>> rotatedMatrix,
  }) = MatrixResultStatusRotationSuccess;

  const factory MatrixResultStatus.error({required String message}) =
      MatrixResultStatusError;

  const factory MatrixResultStatus.matrixHistory({
    required List<Map<String, dynamic>> matrices,
  }) = MatrixResultStatusMatrixHistory;
}
