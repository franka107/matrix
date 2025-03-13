import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_result/bloc/matrix_result_status.dart';

part 'matrix_result_model.freezed.dart';

@freezed
abstract class MatrixResultModel with _$MatrixResultModel {
  const factory MatrixResultModel({
    required MatrixResultStatus status,
    List<List<int>>? originalMatrix,
    List<List<int>>? rotatedMatrix,
    @Default(true) bool showAnimation,
    @Default('') String errorMessage,
    @Default([]) List<Map<String, dynamic>> matrixHistory,
  }) = _MatrixResultModel;
}
