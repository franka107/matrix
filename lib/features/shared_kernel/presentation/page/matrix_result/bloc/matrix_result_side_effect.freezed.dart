// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matrix_result_side_effect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatrixResultSideEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixResultSideEffect()';
}


}

/// @nodoc
class $MatrixResultSideEffectCopyWith<$Res>  {
$MatrixResultSideEffectCopyWith(MatrixResultSideEffect _, $Res Function(MatrixResultSideEffect) __);
}


/// @nodoc


class MatrixResultEffectShowToast implements MatrixResultSideEffect {
  const MatrixResultEffectShowToast({required this.message});
  

 final  String message;

/// Create a copy of MatrixResultSideEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixResultEffectShowToastCopyWith<MatrixResultEffectShowToast> get copyWith => _$MatrixResultEffectShowToastCopyWithImpl<MatrixResultEffectShowToast>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultEffectShowToast&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MatrixResultSideEffect.showToast(message: $message)';
}


}

/// @nodoc
abstract mixin class $MatrixResultEffectShowToastCopyWith<$Res> implements $MatrixResultSideEffectCopyWith<$Res> {
  factory $MatrixResultEffectShowToastCopyWith(MatrixResultEffectShowToast value, $Res Function(MatrixResultEffectShowToast) _then) = _$MatrixResultEffectShowToastCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MatrixResultEffectShowToastCopyWithImpl<$Res>
    implements $MatrixResultEffectShowToastCopyWith<$Res> {
  _$MatrixResultEffectShowToastCopyWithImpl(this._self, this._then);

  final MatrixResultEffectShowToast _self;
  final $Res Function(MatrixResultEffectShowToast) _then;

/// Create a copy of MatrixResultSideEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MatrixResultEffectShowToast(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MatrixResultEffectNavigateTo implements MatrixResultSideEffect {
  const MatrixResultEffectNavigateTo({required this.route, final  Map<String, dynamic>? arguments}): _arguments = arguments;
  

 final  String route;
 final  Map<String, dynamic>? _arguments;
 Map<String, dynamic>? get arguments {
  final value = _arguments;
  if (value == null) return null;
  if (_arguments is EqualUnmodifiableMapView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MatrixResultSideEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixResultEffectNavigateToCopyWith<MatrixResultEffectNavigateTo> get copyWith => _$MatrixResultEffectNavigateToCopyWithImpl<MatrixResultEffectNavigateTo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultEffectNavigateTo&&(identical(other.route, route) || other.route == route)&&const DeepCollectionEquality().equals(other._arguments, _arguments));
}


@override
int get hashCode => Object.hash(runtimeType,route,const DeepCollectionEquality().hash(_arguments));

@override
String toString() {
  return 'MatrixResultSideEffect.navigateTo(route: $route, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class $MatrixResultEffectNavigateToCopyWith<$Res> implements $MatrixResultSideEffectCopyWith<$Res> {
  factory $MatrixResultEffectNavigateToCopyWith(MatrixResultEffectNavigateTo value, $Res Function(MatrixResultEffectNavigateTo) _then) = _$MatrixResultEffectNavigateToCopyWithImpl;
@useResult
$Res call({
 String route, Map<String, dynamic>? arguments
});




}
/// @nodoc
class _$MatrixResultEffectNavigateToCopyWithImpl<$Res>
    implements $MatrixResultEffectNavigateToCopyWith<$Res> {
  _$MatrixResultEffectNavigateToCopyWithImpl(this._self, this._then);

  final MatrixResultEffectNavigateTo _self;
  final $Res Function(MatrixResultEffectNavigateTo) _then;

/// Create a copy of MatrixResultSideEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? route = null,Object? arguments = freezed,}) {
  return _then(MatrixResultEffectNavigateTo(
route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,arguments: freezed == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class MatrixResultEffectShowError implements MatrixResultSideEffect {
  const MatrixResultEffectShowError({required this.message});
  

 final  String message;

/// Create a copy of MatrixResultSideEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixResultEffectShowErrorCopyWith<MatrixResultEffectShowError> get copyWith => _$MatrixResultEffectShowErrorCopyWithImpl<MatrixResultEffectShowError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultEffectShowError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MatrixResultSideEffect.showError(message: $message)';
}


}

/// @nodoc
abstract mixin class $MatrixResultEffectShowErrorCopyWith<$Res> implements $MatrixResultSideEffectCopyWith<$Res> {
  factory $MatrixResultEffectShowErrorCopyWith(MatrixResultEffectShowError value, $Res Function(MatrixResultEffectShowError) _then) = _$MatrixResultEffectShowErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MatrixResultEffectShowErrorCopyWithImpl<$Res>
    implements $MatrixResultEffectShowErrorCopyWith<$Res> {
  _$MatrixResultEffectShowErrorCopyWithImpl(this._self, this._then);

  final MatrixResultEffectShowError _self;
  final $Res Function(MatrixResultEffectShowError) _then;

/// Create a copy of MatrixResultSideEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MatrixResultEffectShowError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MatrixResultEffectCopyToClipboard implements MatrixResultSideEffect {
  const MatrixResultEffectCopyToClipboard({required this.content, this.successMessage});
  

 final  String content;
 final  String? successMessage;

/// Create a copy of MatrixResultSideEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixResultEffectCopyToClipboardCopyWith<MatrixResultEffectCopyToClipboard> get copyWith => _$MatrixResultEffectCopyToClipboardCopyWithImpl<MatrixResultEffectCopyToClipboard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultEffectCopyToClipboard&&(identical(other.content, content) || other.content == content)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,content,successMessage);

@override
String toString() {
  return 'MatrixResultSideEffect.copyToClipboard(content: $content, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $MatrixResultEffectCopyToClipboardCopyWith<$Res> implements $MatrixResultSideEffectCopyWith<$Res> {
  factory $MatrixResultEffectCopyToClipboardCopyWith(MatrixResultEffectCopyToClipboard value, $Res Function(MatrixResultEffectCopyToClipboard) _then) = _$MatrixResultEffectCopyToClipboardCopyWithImpl;
@useResult
$Res call({
 String content, String? successMessage
});




}
/// @nodoc
class _$MatrixResultEffectCopyToClipboardCopyWithImpl<$Res>
    implements $MatrixResultEffectCopyToClipboardCopyWith<$Res> {
  _$MatrixResultEffectCopyToClipboardCopyWithImpl(this._self, this._then);

  final MatrixResultEffectCopyToClipboard _self;
  final $Res Function(MatrixResultEffectCopyToClipboard) _then;

/// Create a copy of MatrixResultSideEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,Object? successMessage = freezed,}) {
  return _then(MatrixResultEffectCopyToClipboard(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
