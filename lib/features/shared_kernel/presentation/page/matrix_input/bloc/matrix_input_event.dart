
import 'package:freezed_annotation/freezed_annotation.dart';

part 'matrix_input_event.freezed.dart';

@freezed
sealed class MatrixInputEvent with _$MatrixInputEvent {
  const factory MatrixInputEvent.initialized() = MatrixInputEventInitialized;
  
  const factory MatrixInputEvent.matrixInputChanged({
    required String input,
  }) = MatrixInputEventMatrixInputChanged;
  
  const factory MatrixInputEvent.rotateButtonPressed() = MatrixInputEventRotateButtonPressed;
  
  const factory MatrixInputEvent.clearButtonPressed() = MatrixInputEventClearButtonPressed;
  
  const factory MatrixInputEvent.inputModeToggled() = MatrixInputEventInputModeToggled;
  
  const factory MatrixInputEvent.matrixDimensionsChanged({
    required int size,
  }) = MatrixInputEventMatrixDimensionsChanged;
  
  const factory MatrixInputEvent.matrixCellChanged({
    required int row,
    required int column,
    required int value,
  }) = MatrixInputEventMatrixCellChanged;
}