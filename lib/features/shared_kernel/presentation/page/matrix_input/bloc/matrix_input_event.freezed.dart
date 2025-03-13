// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matrix_input_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatrixInputEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixInputEvent()';
}


}

/// @nodoc
class $MatrixInputEventCopyWith<$Res>  {
$MatrixInputEventCopyWith(MatrixInputEvent _, $Res Function(MatrixInputEvent) __);
}


/// @nodoc


class MatrixInputEventInitialized implements MatrixInputEvent {
  const MatrixInputEventInitialized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputEventInitialized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixInputEvent.initialized()';
}


}




/// @nodoc


class MatrixInputEventMatrixInputChanged implements MatrixInputEvent {
  const MatrixInputEventMatrixInputChanged({required this.input});
  

 final  String input;

/// Create a copy of MatrixInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixInputEventMatrixInputChangedCopyWith<MatrixInputEventMatrixInputChanged> get copyWith => _$MatrixInputEventMatrixInputChangedCopyWithImpl<MatrixInputEventMatrixInputChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputEventMatrixInputChanged&&(identical(other.input, input) || other.input == input));
}


@override
int get hashCode => Object.hash(runtimeType,input);

@override
String toString() {
  return 'MatrixInputEvent.matrixInputChanged(input: $input)';
}


}

/// @nodoc
abstract mixin class $MatrixInputEventMatrixInputChangedCopyWith<$Res> implements $MatrixInputEventCopyWith<$Res> {
  factory $MatrixInputEventMatrixInputChangedCopyWith(MatrixInputEventMatrixInputChanged value, $Res Function(MatrixInputEventMatrixInputChanged) _then) = _$MatrixInputEventMatrixInputChangedCopyWithImpl;
@useResult
$Res call({
 String input
});




}
/// @nodoc
class _$MatrixInputEventMatrixInputChangedCopyWithImpl<$Res>
    implements $MatrixInputEventMatrixInputChangedCopyWith<$Res> {
  _$MatrixInputEventMatrixInputChangedCopyWithImpl(this._self, this._then);

  final MatrixInputEventMatrixInputChanged _self;
  final $Res Function(MatrixInputEventMatrixInputChanged) _then;

/// Create a copy of MatrixInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? input = null,}) {
  return _then(MatrixInputEventMatrixInputChanged(
input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MatrixInputEventRotateButtonPressed implements MatrixInputEvent {
  const MatrixInputEventRotateButtonPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputEventRotateButtonPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixInputEvent.rotateButtonPressed()';
}


}




/// @nodoc


class MatrixInputEventClearButtonPressed implements MatrixInputEvent {
  const MatrixInputEventClearButtonPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputEventClearButtonPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixInputEvent.clearButtonPressed()';
}


}




/// @nodoc


class MatrixInputEventInputModeToggled implements MatrixInputEvent {
  const MatrixInputEventInputModeToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputEventInputModeToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatrixInputEvent.inputModeToggled()';
}


}




/// @nodoc


class MatrixInputEventMatrixDimensionsChanged implements MatrixInputEvent {
  const MatrixInputEventMatrixDimensionsChanged({required this.size});
  

 final  int size;

/// Create a copy of MatrixInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixInputEventMatrixDimensionsChangedCopyWith<MatrixInputEventMatrixDimensionsChanged> get copyWith => _$MatrixInputEventMatrixDimensionsChangedCopyWithImpl<MatrixInputEventMatrixDimensionsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputEventMatrixDimensionsChanged&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,size);

@override
String toString() {
  return 'MatrixInputEvent.matrixDimensionsChanged(size: $size)';
}


}

/// @nodoc
abstract mixin class $MatrixInputEventMatrixDimensionsChangedCopyWith<$Res> implements $MatrixInputEventCopyWith<$Res> {
  factory $MatrixInputEventMatrixDimensionsChangedCopyWith(MatrixInputEventMatrixDimensionsChanged value, $Res Function(MatrixInputEventMatrixDimensionsChanged) _then) = _$MatrixInputEventMatrixDimensionsChangedCopyWithImpl;
@useResult
$Res call({
 int size
});




}
/// @nodoc
class _$MatrixInputEventMatrixDimensionsChangedCopyWithImpl<$Res>
    implements $MatrixInputEventMatrixDimensionsChangedCopyWith<$Res> {
  _$MatrixInputEventMatrixDimensionsChangedCopyWithImpl(this._self, this._then);

  final MatrixInputEventMatrixDimensionsChanged _self;
  final $Res Function(MatrixInputEventMatrixDimensionsChanged) _then;

/// Create a copy of MatrixInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? size = null,}) {
  return _then(MatrixInputEventMatrixDimensionsChanged(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MatrixInputEventMatrixCellChanged implements MatrixInputEvent {
  const MatrixInputEventMatrixCellChanged({required this.row, required this.column, required this.value});
  

 final  int row;
 final  int column;
 final  int value;

/// Create a copy of MatrixInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixInputEventMatrixCellChangedCopyWith<MatrixInputEventMatrixCellChanged> get copyWith => _$MatrixInputEventMatrixCellChangedCopyWithImpl<MatrixInputEventMatrixCellChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputEventMatrixCellChanged&&(identical(other.row, row) || other.row == row)&&(identical(other.column, column) || other.column == column)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,row,column,value);

@override
String toString() {
  return 'MatrixInputEvent.matrixCellChanged(row: $row, column: $column, value: $value)';
}


}

/// @nodoc
abstract mixin class $MatrixInputEventMatrixCellChangedCopyWith<$Res> implements $MatrixInputEventCopyWith<$Res> {
  factory $MatrixInputEventMatrixCellChangedCopyWith(MatrixInputEventMatrixCellChanged value, $Res Function(MatrixInputEventMatrixCellChanged) _then) = _$MatrixInputEventMatrixCellChangedCopyWithImpl;
@useResult
$Res call({
 int row, int column, int value
});




}
/// @nodoc
class _$MatrixInputEventMatrixCellChangedCopyWithImpl<$Res>
    implements $MatrixInputEventMatrixCellChangedCopyWith<$Res> {
  _$MatrixInputEventMatrixCellChangedCopyWithImpl(this._self, this._then);

  final MatrixInputEventMatrixCellChanged _self;
  final $Res Function(MatrixInputEventMatrixCellChanged) _then;

/// Create a copy of MatrixInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? row = null,Object? column = null,Object? value = null,}) {
  return _then(MatrixInputEventMatrixCellChanged(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,column: null == column ? _self.column : column // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
