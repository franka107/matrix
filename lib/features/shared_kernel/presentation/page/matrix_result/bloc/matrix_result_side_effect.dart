import 'package:freezed_annotation/freezed_annotation.dart';

part 'matrix_result_side_effect.freezed.dart';

@freezed
sealed class MatrixResultSideEffect with _$MatrixResultSideEffect {
  const factory MatrixResultSideEffect.showToast({required String message}) =
      MatrixResultEffectShowToast;

  const factory MatrixResultSideEffect.navigateTo({
    required String route,
    Map<String, dynamic>? arguments,
  }) = MatrixResultEffectNavigateTo;

  const factory MatrixResultSideEffect.showError({required String message}) =
      MatrixResultEffectShowError;

  const factory MatrixResultSideEffect.copyToClipboard({
    required String content,
    String? successMessage,
  }) = MatrixResultEffectCopyToClipboard;
}
