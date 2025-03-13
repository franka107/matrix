// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matrix_result_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatrixResultEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixResultEvent()';
}


}

/// @nodoc
class $MatrixResultEventCopyWith<$Res>  {
$MatrixResultEventCopyWith(MatrixResultEvent _, $Res Function(MatrixResultEvent) __);
}


/// @nodoc


class MatrixResultEventInitialized implements MatrixResultEvent {
  const MatrixResultEventInitialized({final  List<List<int>>? originalMatrix, final  List<List<int>>? rotatedMatrix}): _originalMatrix = originalMatrix,_rotatedMatrix = rotatedMatrix;
  

 final  List<List<int>>? _originalMatrix;
 List<List<int>>? get originalMatrix {
  final value = _originalMatrix;
  if (value == null) return null;
  if (_originalMatrix is EqualUnmodifiableListView) return _originalMatrix;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<List<int>>? _rotatedMatrix;
 List<List<int>>? get rotatedMatrix {
  final value = _rotatedMatrix;
  if (value == null) return null;
  if (_rotatedMatrix is EqualUnmodifiableListView) return _rotatedMatrix;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MatrixResultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixResultEventInitializedCopyWith<MatrixResultEventInitialized> get copyWith => _$MatrixResultEventInitializedCopyWithImpl<MatrixResultEventInitialized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultEventInitialized&&const DeepCollectionEquality().equals(other._originalMatrix, _originalMatrix)&&const DeepCollectionEquality().equals(other._rotatedMatrix, _rotatedMatrix));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_originalMatrix),const DeepCollectionEquality().hash(_rotatedMatrix));

@override
String toString() {
  return 'MatrixResultEvent.initialized(originalMatrix: $originalMatrix, rotatedMatrix: $rotatedMatrix)';
}


}

/// @nodoc
abstract mixin class $MatrixResultEventInitializedCopyWith<$Res> implements $MatrixResultEventCopyWith<$Res> {
  factory $MatrixResultEventInitializedCopyWith(MatrixResultEventInitialized value, $Res Function(MatrixResultEventInitialized) _then) = _$MatrixResultEventInitializedCopyWithImpl;
@useResult
$Res call({
 List<List<int>>? originalMatrix, List<List<int>>? rotatedMatrix
});




}
/// @nodoc
class _$MatrixResultEventInitializedCopyWithImpl<$Res>
    implements $MatrixResultEventInitializedCopyWith<$Res> {
  _$MatrixResultEventInitializedCopyWithImpl(this._self, this._then);

  final MatrixResultEventInitialized _self;
  final $Res Function(MatrixResultEventInitialized) _then;

/// Create a copy of MatrixResultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? originalMatrix = freezed,Object? rotatedMatrix = freezed,}) {
  return _then(MatrixResultEventInitialized(
originalMatrix: freezed == originalMatrix ? _self._originalMatrix : originalMatrix // ignore: cast_nullable_to_non_nullable
as List<List<int>>?,rotatedMatrix: freezed == rotatedMatrix ? _self._rotatedMatrix : rotatedMatrix // ignore: cast_nullable_to_non_nullable
as List<List<int>>?,
  ));
}


}

/// @nodoc


class MatrixResultEventRotateAgain implements MatrixResultEvent {
  const MatrixResultEventRotateAgain();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultEventRotateAgain);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixResultEvent.rotateAgain()';
}


}




/// @nodoc


class MatrixResultEventCopyMatrixToClipboard implements MatrixResultEvent {
  const MatrixResultEventCopyMatrixToClipboard({required this.matrix, required this.isOriginal});
  

 final  String matrix;
 final  bool isOriginal;

/// Create a copy of MatrixResultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixResultEventCopyMatrixToClipboardCopyWith<MatrixResultEventCopyMatrixToClipboard> get copyWith => _$MatrixResultEventCopyMatrixToClipboardCopyWithImpl<MatrixResultEventCopyMatrixToClipboard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultEventCopyMatrixToClipboard&&(identical(other.matrix, matrix) || other.matrix == matrix)&&(identical(other.isOriginal, isOriginal) || other.isOriginal == isOriginal));
}


@override
int get hashCode => Object.hash(runtimeType,matrix,isOriginal);

@override
String toString() {
  return 'MatrixResultEvent.copyMatrixToClipboard(matrix: $matrix, isOriginal: $isOriginal)';
}


}

/// @nodoc
abstract mixin class $MatrixResultEventCopyMatrixToClipboardCopyWith<$Res> implements $MatrixResultEventCopyWith<$Res> {
  factory $MatrixResultEventCopyMatrixToClipboardCopyWith(MatrixResultEventCopyMatrixToClipboard value, $Res Function(MatrixResultEventCopyMatrixToClipboard) _then) = _$MatrixResultEventCopyMatrixToClipboardCopyWithImpl;
@useResult
$Res call({
 String matrix, bool isOriginal
});




}
/// @nodoc
class _$MatrixResultEventCopyMatrixToClipboardCopyWithImpl<$Res>
    implements $MatrixResultEventCopyMatrixToClipboardCopyWith<$Res> {
  _$MatrixResultEventCopyMatrixToClipboardCopyWithImpl(this._self, this._then);

  final MatrixResultEventCopyMatrixToClipboard _self;
  final $Res Function(MatrixResultEventCopyMatrixToClipboard) _then;

/// Create a copy of MatrixResultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? matrix = null,Object? isOriginal = null,}) {
  return _then(MatrixResultEventCopyMatrixToClipboard(
matrix: null == matrix ? _self.matrix : matrix // ignore: cast_nullable_to_non_nullable
as String,isOriginal: null == isOriginal ? _self.isOriginal : isOriginal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class MatrixResultEventViewMatrixHistory implements MatrixResultEvent {
  const MatrixResultEventViewMatrixHistory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultEventViewMatrixHistory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixResultEvent.viewMatrixHistory()';
}


}




/// @nodoc


class MatrixResultEventLoadMatrixFromHistory implements MatrixResultEvent {
  const MatrixResultEventLoadMatrixFromHistory({required final  List<List<int>> originalMatrix, required final  List<List<int>> rotatedMatrix}): _originalMatrix = originalMatrix,_rotatedMatrix = rotatedMatrix;
  

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


/// Create a copy of MatrixResultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixResultEventLoadMatrixFromHistoryCopyWith<MatrixResultEventLoadMatrixFromHistory> get copyWith => _$MatrixResultEventLoadMatrixFromHistoryCopyWithImpl<MatrixResultEventLoadMatrixFromHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultEventLoadMatrixFromHistory&&const DeepCollectionEquality().equals(other._originalMatrix, _originalMatrix)&&const DeepCollectionEquality().equals(other._rotatedMatrix, _rotatedMatrix));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_originalMatrix),const DeepCollectionEquality().hash(_rotatedMatrix));

@override
String toString() {
  return 'MatrixResultEvent.loadMatrixFromHistory(originalMatrix: $originalMatrix, rotatedMatrix: $rotatedMatrix)';
}


}

/// @nodoc
abstract mixin class $MatrixResultEventLoadMatrixFromHistoryCopyWith<$Res> implements $MatrixResultEventCopyWith<$Res> {
  factory $MatrixResultEventLoadMatrixFromHistoryCopyWith(MatrixResultEventLoadMatrixFromHistory value, $Res Function(MatrixResultEventLoadMatrixFromHistory) _then) = _$MatrixResultEventLoadMatrixFromHistoryCopyWithImpl;
@useResult
$Res call({
 List<List<int>> originalMatrix, List<List<int>> rotatedMatrix
});




}
/// @nodoc
class _$MatrixResultEventLoadMatrixFromHistoryCopyWithImpl<$Res>
    implements $MatrixResultEventLoadMatrixFromHistoryCopyWith<$Res> {
  _$MatrixResultEventLoadMatrixFromHistoryCopyWithImpl(this._self, this._then);

  final MatrixResultEventLoadMatrixFromHistory _self;
  final $Res Function(MatrixResultEventLoadMatrixFromHistory) _then;

/// Create a copy of MatrixResultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? originalMatrix = null,Object? rotatedMatrix = null,}) {
  return _then(MatrixResultEventLoadMatrixFromHistory(
originalMatrix: null == originalMatrix ? _self._originalMatrix : originalMatrix // ignore: cast_nullable_to_non_nullable
as List<List<int>>,rotatedMatrix: null == rotatedMatrix ? _self._rotatedMatrix : rotatedMatrix // ignore: cast_nullable_to_non_nullable
as List<List<int>>,
  ));
}


}

// dart format on
