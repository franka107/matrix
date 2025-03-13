// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matrix_input_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatrixInputStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixInputStatus()';
}


}

/// @nodoc
class $MatrixInputStatusCopyWith<$Res>  {
$MatrixInputStatusCopyWith(MatrixInputStatus _, $Res Function(MatrixInputStatus) __);
}


/// @nodoc


class MatrixInputStatusInitial implements MatrixInputStatus {
  const MatrixInputStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixInputStatus.initial()';
}


}




/// @nodoc


class MatrixInputStatusLoading implements MatrixInputStatus {
  const MatrixInputStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixInputStatus.loading()';
}


}




/// @nodoc


class MatrixInputStatusReady implements MatrixInputStatus {
  const MatrixInputStatusReady();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputStatusReady);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixInputStatus.ready()';
}


}




/// @nodoc


class MatrixInputStatusRotationSuccess implements MatrixInputStatus {
  const MatrixInputStatusRotationSuccess({required final  List<List<int>> originalMatrix, required final  List<List<int>> rotatedMatrix}): _originalMatrix = originalMatrix,_rotatedMatrix = rotatedMatrix;
  

 final  List<List<int>> _originalMatrix;
 List<List<int>> get originalMatrix {
  if (_originalMatrix is EqualUnmodifiableListView) return _originalMatrix;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_originalMatrix);
}

 final  List<List<int>> _rotatedMatrix;
 List<List<int>> get rotatedMatrix {
  if (_rotatedMatrix is EqualUnmodifiableListView) return _rotatedMatrix;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rotatedMatrix);
}


/// Create a copy of MatrixInputStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixInputStatusRotationSuccessCopyWith<MatrixInputStatusRotationSuccess> get copyWith => _$MatrixInputStatusRotationSuccessCopyWithImpl<MatrixInputStatusRotationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputStatusRotationSuccess&&const DeepCollectionEquality().equals(other._originalMatrix, _originalMatrix)&&const DeepCollectionEquality().equals(other._rotatedMatrix, _rotatedMatrix));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_originalMatrix),const DeepCollectionEquality().hash(_rotatedMatrix));

@override
String toString() {
  return 'MatrixInputStatus.rotationSuccess(originalMatrix: $originalMatrix, rotatedMatrix: $rotatedMatrix)';
}


}

/// @nodoc
abstract mixin class $MatrixInputStatusRotationSuccessCopyWith<$Res> implements $MatrixInputStatusCopyWith<$Res> {
  factory $MatrixInputStatusRotationSuccessCopyWith(MatrixInputStatusRotationSuccess value, $Res Function(MatrixInputStatusRotationSuccess) _then) = _$MatrixInputStatusRotationSuccessCopyWithImpl;
@useResult
$Res call({
 List<List<int>> originalMatrix, List<List<int>> rotatedMatrix
});




}
/// @nodoc
class _$MatrixInputStatusRotationSuccessCopyWithImpl<$Res>
    implements $MatrixInputStatusRotationSuccessCopyWith<$Res> {
  _$MatrixInputStatusRotationSuccessCopyWithImpl(this._self, this._then);

  final MatrixInputStatusRotationSuccess _self;
  final $Res Function(MatrixInputStatusRotationSuccess) _then;

/// Create a copy of MatrixInputStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? originalMatrix = null,Object? rotatedMatrix = null,}) {
  return _then(MatrixInputStatusRotationSuccess(
originalMatrix: null == originalMatrix ? _self._originalMatrix : originalMatrix // ignore: cast_nullable_to_non_nullable
as List<List<int>>,rotatedMatrix: null == rotatedMatrix ? _self._rotatedMatrix : rotatedMatrix // ignore: cast_nullable_to_non_nullable
as List<List<int>>,
  ));
}


}

/// @nodoc


class MatrixInputStatusError implements MatrixInputStatus {
  const MatrixInputStatusError({required this.message});
  

 final  String message;

/// Create a copy of MatrixInputStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixInputStatusErrorCopyWith<MatrixInputStatusError> get copyWith => _$MatrixInputStatusErrorCopyWithImpl<MatrixInputStatusError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputStatusError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MatrixInputStatus.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $MatrixInputStatusErrorCopyWith<$Res> implements $MatrixInputStatusCopyWith<$Res> {
  factory $MatrixInputStatusErrorCopyWith(MatrixInputStatusError value, $Res Function(MatrixInputStatusError) _then) = _$MatrixInputStatusErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MatrixInputStatusErrorCopyWithImpl<$Res>
    implements $MatrixInputStatusErrorCopyWith<$Res> {
  _$MatrixInputStatusErrorCopyWithImpl(this._self, this._then);

  final MatrixInputStatusError _self;
  final $Res Function(MatrixInputStatusError) _then;

/// Create a copy of MatrixInputStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MatrixInputStatusError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
