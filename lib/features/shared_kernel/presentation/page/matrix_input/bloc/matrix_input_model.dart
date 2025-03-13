import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_input/bloc/matrix_input_status.dart';

part 'matrix_input_model.freezed.dart';

@freezed
abstract class MatrixInputModel with _$MatrixInputModel {
  const factory MatrixInputModel({
    required MatrixInputStatus status,
    @Default('') String matrixInput,
    String? errorMessage,
    @Default(false) bool isVisualInputMode,
    @Default(2) int matrixSize,
    List<List<int>>? matrixValues,
    @Default(false) bool isValidInput,
  }) = _MatrixInputModel;
}
