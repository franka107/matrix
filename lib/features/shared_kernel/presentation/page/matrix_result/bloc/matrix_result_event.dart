import 'package:freezed_annotation/freezed_annotation.dart';

part 'matrix_result_event.freezed.dart';

@freezed
sealed class MatrixResultEvent with _$MatrixResultEvent {
  const factory MatrixResultEvent.initialized({
    List<List<int>>? originalMatrix,
    List<List<int>>? rotatedMatrix,
  }) = MatrixResultEventInitialized;

  const factory MatrixResultEvent.rotateAgain() = MatrixResultEventRotateAgain;

  const factory MatrixResultEvent.copyMatrixToClipboard({
    required String matrix,
    required bool isOriginal,
  }) = MatrixResultEventCopyMatrixToClipboard;

  const factory MatrixResultEvent.viewMatrixHistory() =
      MatrixResultEventViewMatrixHistory;

  const factory MatrixResultEvent.loadMatrixFromHistory({
    required List<List<int>> originalMatrix,
    required List<List<int>> rotatedMatrix,
  }) = MatrixResultEventLoadMatrixFromHistory;
}
