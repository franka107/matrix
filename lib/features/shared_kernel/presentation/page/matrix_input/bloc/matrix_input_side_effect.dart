import 'package:freezed_annotation/freezed_annotation.dart';

part 'matrix_input_side_effect.freezed.dart';


@freezed
sealed class MatrixInputSideEffect with _$MatrixInputSideEffect {
  const factory MatrixInputSideEffect.showToast({
    required String message,
  }) = MatrixInputEffectShowToast;
  
  const factory MatrixInputSideEffect.navigateTo({
    required String route,
    Map<String, dynamic>? arguments,
  }) = MatrixInputEffectNavigateTo;
  
  const factory MatrixInputSideEffect.showError({
    required String message,
  }) = MatrixInputEffectShowError;
  
  
}