// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matrix_input_side_effect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatrixInputSideEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixInputSideEffect()';
}


}

/// @nodoc
class $MatrixInputSideEffectCopyWith<$Res>  {
$MatrixInputSideEffectCopyWith(MatrixInputSideEffect _, $Res Function(MatrixInputSideEffect) __);
}


/// @nodoc


class MatrixInputEffectShowToast implements MatrixInputSideEffect {
  const MatrixInputEffectShowToast({required this.message});
  

 final  String message;

/// Create a copy of MatrixInputSideEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixInputEffectShowToastCopyWith<MatrixInputEffectShowToast> get copyWith => _$MatrixInputEffectShowToastCopyWithImpl<MatrixInputEffectShowToast>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputEffectShowToast&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MatrixInputSideEffect.showToast(message: $message)';
}


}

/// @nodoc
abstract mixin class $MatrixInputEffectShowToastCopyWith<$Res> implements $MatrixInputSideEffectCopyWith<$Res> {
  factory $MatrixInputEffectShowToastCopyWith(MatrixInputEffectShowToast value, $Res Function(MatrixInputEffectShowToast) _then) = _$MatrixInputEffectShowToastCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MatrixInputEffectShowToastCopyWithImpl<$Res>
    implements $MatrixInputEffectShowToastCopyWith<$Res> {
  _$MatrixInputEffectShowToastCopyWithImpl(this._self, this._then);

  final MatrixInputEffectShowToast _self;
  final $Res Function(MatrixInputEffectShowToast) _then;

/// Create a copy of MatrixInputSideEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MatrixInputEffectShowToast(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MatrixInputEffectNavigateTo implements MatrixInputSideEffect {
  const MatrixInputEffectNavigateTo({required this.route, final  Map<String, dynamic>? arguments}): _arguments = arguments;
  

 final  String route;
 final  Map<String, dynamic>? _arguments;
 Map<String, dynamic>? get arguments {
  final value = _arguments;
  if (value == null) return null;
  if (_arguments is EqualUnmodifiableMapView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MatrixInputSideEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixInputEffectNavigateToCopyWith<MatrixInputEffectNavigateTo> get copyWith => _$MatrixInputEffectNavigateToCopyWithImpl<MatrixInputEffectNavigateTo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputEffectNavigateTo&&(identical(other.route, route) || other.route == route)&&const DeepCollectionEquality().equals(other._arguments, _arguments));
}


@override
int get hashCode => Object.hash(runtimeType,route,const DeepCollectionEquality().hash(_arguments));

@override
String toString() {
  return 'MatrixInputSideEffect.navigateTo(route: $route, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class $MatrixInputEffectNavigateToCopyWith<$Res> implements $MatrixInputSideEffectCopyWith<$Res> {
  factory $MatrixInputEffectNavigateToCopyWith(MatrixInputEffectNavigateTo value, $Res Function(MatrixInputEffectNavigateTo) _then) = _$MatrixInputEffectNavigateToCopyWithImpl;
@useResult
$Res call({
 String route, Map<String, dynamic>? arguments
});




}
/// @nodoc
class _$MatrixInputEffectNavigateToCopyWithImpl<$Res>
    implements $MatrixInputEffectNavigateToCopyWith<$Res> {
  _$MatrixInputEffectNavigateToCopyWithImpl(this._self, this._then);

  final MatrixInputEffectNavigateTo _self;
  final $Res Function(MatrixInputEffectNavigateTo) _then;

/// Create a copy of MatrixInputSideEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? route = null,Object? arguments = freezed,}) {
  return _then(MatrixInputEffectNavigateTo(
route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,arguments: freezed == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class MatrixInputEffectShowError implements MatrixInputSideEffect {
  const MatrixInputEffectShowError({required this.message});
  

 final  String message;

/// Create a copy of MatrixInputSideEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixInputEffectShowErrorCopyWith<MatrixInputEffectShowError> get copyWith => _$MatrixInputEffectShowErrorCopyWithImpl<MatrixInputEffectShowError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputEffectShowError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MatrixInputSideEffect.showError(message: $message)';
}


}

/// @nodoc
abstract mixin class $MatrixInputEffectShowErrorCopyWith<$Res> implements $MatrixInputSideEffectCopyWith<$Res> {
  factory $MatrixInputEffectShowErrorCopyWith(MatrixInputEffectShowError value, $Res Function(MatrixInputEffectShowError) _then) = _$MatrixInputEffectShowErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MatrixInputEffectShowErrorCopyWithImpl<$Res>
    implements $MatrixInputEffectShowErrorCopyWith<$Res> {
  _$MatrixInputEffectShowErrorCopyWithImpl(this._self, this._then);

  final MatrixInputEffectShowError _self;
  final $Res Function(MatrixInputEffectShowError) _then;

/// Create a copy of MatrixInputSideEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MatrixInputEffectShowError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
