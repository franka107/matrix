// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matrix_result_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatrixResultStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixResultStatus()';
}


}

/// @nodoc
class $MatrixResultStatusCopyWith<$Res>  {
$MatrixResultStatusCopyWith(MatrixResultStatus _, $Res Function(MatrixResultStatus) __);
}


/// @nodoc


class MatrixResultStatusInitial implements MatrixResultStatus {
  const MatrixResultStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixResultStatus.initial()';
}


}




/// @nodoc


class MatrixResultStatusLoading implements MatrixResultStatus {
  const MatrixResultStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixResultStatus.loading()';
}


}




/// @nodoc


class MatrixResultStatusReady implements MatrixResultStatus {
  const MatrixResultStatusReady();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultStatusReady);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixResultStatus.ready()';
}


}




/// @nodoc


class MatrixResultStatusRotationSuccess implements MatrixResultStatus {
  const MatrixResultStatusRotationSuccess({required final  List<List<int>> originalMatrix, required final  List<List<int>> rotatedMatrix}): _originalMatrix = originalMatrix,_rotatedMatrix = rotatedMatrix;
  

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


/// Create a copy of MatrixResultStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixResultStatusRotationSuccessCopyWith<MatrixResultStatusRotationSuccess> get copyWith => _$MatrixResultStatusRotationSuccessCopyWithImpl<MatrixResultStatusRotationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultStatusRotationSuccess&&const DeepCollectionEquality().equals(other._originalMatrix, _originalMatrix)&&const DeepCollectionEquality().equals(other._rotatedMatrix, _rotatedMatrix));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_originalMatrix),const DeepCollectionEquality().hash(_rotatedMatrix));

@override
String toString() {
  return 'MatrixResultStatus.rotationSuccess(originalMatrix: $originalMatrix, rotatedMatrix: $rotatedMatrix)';
}


}

/// @nodoc
abstract mixin class $MatrixResultStatusRotationSuccessCopyWith<$Res> implements $MatrixResultStatusCopyWith<$Res> {
  factory $MatrixResultStatusRotationSuccessCopyWith(MatrixResultStatusRotationSuccess value, $Res Function(MatrixResultStatusRotationSuccess) _then) = _$MatrixResultStatusRotationSuccessCopyWithImpl;
@useResult
$Res call({
 List<List<int>> originalMatrix, List<List<int>> rotatedMatrix
});




}
/// @nodoc
class _$MatrixResultStatusRotationSuccessCopyWithImpl<$Res>
    implements $MatrixResultStatusRotationSuccessCopyWith<$Res> {
  _$MatrixResultStatusRotationSuccessCopyWithImpl(this._self, this._then);

  final MatrixResultStatusRotationSuccess _self;
  final $Res Function(MatrixResultStatusRotationSuccess) _then;

/// Create a copy of MatrixResultStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? originalMatrix = null,Object? rotatedMatrix = null,}) {
  return _then(MatrixResultStatusRotationSuccess(
originalMatrix: null == originalMatrix ? _self._originalMatrix : originalMatrix // ignore: cast_nullable_to_non_nullable
as List<List<int>>,rotatedMatrix: null == rotatedMatrix ? _self._rotatedMatrix : rotatedMatrix // ignore: cast_nullable_to_non_nullable
as List<List<int>>,
  ));
}


}

/// @nodoc


class MatrixResultStatusError implements MatrixResultStatus {
  const MatrixResultStatusError({required this.message});
  

 final  String message;

/// Create a copy of MatrixResultStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixResultStatusErrorCopyWith<MatrixResultStatusError> get copyWith => _$MatrixResultStatusErrorCopyWithImpl<MatrixResultStatusError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultStatusError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MatrixResultStatus.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $MatrixResultStatusErrorCopyWith<$Res> implements $MatrixResultStatusCopyWith<$Res> {
  factory $MatrixResultStatusErrorCopyWith(MatrixResultStatusError value, $Res Function(MatrixResultStatusError) _then) = _$MatrixResultStatusErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MatrixResultStatusErrorCopyWithImpl<$Res>
    implements $MatrixResultStatusErrorCopyWith<$Res> {
  _$MatrixResultStatusErrorCopyWithImpl(this._self, this._then);

  final MatrixResultStatusError _self;
  final $Res Function(MatrixResultStatusError) _then;

/// Create a copy of MatrixResultStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MatrixResultStatusError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MatrixResultStatusMatrixHistory implements MatrixResultStatus {
  const MatrixResultStatusMatrixHistory({required final  List<Map<String, dynamic>> matrices}): _matrices = matrices;
  

 final  List<Map<String, dynamic>> _matrices;
 List<Map<String, dynamic>> get matrices {
  if (_matrices is EqualUnmodifiableListView) return _matrices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matrices);
}


/// Create a copy of MatrixResultStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixResultStatusMatrixHistoryCopyWith<MatrixResultStatusMatrixHistory> get copyWith => _$MatrixResultStatusMatrixHistoryCopyWithImpl<MatrixResultStatusMatrixHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultStatusMatrixHistory&&const DeepCollectionEquality().equals(other._matrices, _matrices));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_matrices));

@override
String toString() {
  return 'MatrixResultStatus.matrixHistory(matrices: $matrices)';
}


}

/// @nodoc
abstract mixin class $MatrixResultStatusMatrixHistoryCopyWith<$Res> implements $MatrixResultStatusCopyWith<$Res> {
  factory $MatrixResultStatusMatrixHistoryCopyWith(MatrixResultStatusMatrixHistory value, $Res Function(MatrixResultStatusMatrixHistory) _then) = _$MatrixResultStatusMatrixHistoryCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> matrices
});




}
/// @nodoc
class _$MatrixResultStatusMatrixHistoryCopyWithImpl<$Res>
    implements $MatrixResultStatusMatrixHistoryCopyWith<$Res> {
  _$MatrixResultStatusMatrixHistoryCopyWithImpl(this._self, this._then);

  final MatrixResultStatusMatrixHistory _self;
  final $Res Function(MatrixResultStatusMatrixHistory) _then;

/// Create a copy of MatrixResultStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? matrices = null,}) {
  return _then(MatrixResultStatusMatrixHistory(
matrices: null == matrices ? _self._matrices : matrices // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
