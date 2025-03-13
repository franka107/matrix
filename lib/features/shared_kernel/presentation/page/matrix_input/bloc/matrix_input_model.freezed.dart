// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matrix_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatrixInputModel {

 MatrixInputStatus get status; String get matrixInput; String? get errorMessage; bool get isVisualInputMode; int get matrixSize; List<List<int>>? get matrixValues; bool get isValidInput;
/// Create a copy of MatrixInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixInputModelCopyWith<MatrixInputModel> get copyWith => _$MatrixInputModelCopyWithImpl<MatrixInputModel>(this as MatrixInputModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixInputModel&&(identical(other.status, status) || other.status == status)&&(identical(other.matrixInput, matrixInput) || other.matrixInput == matrixInput)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isVisualInputMode, isVisualInputMode) || other.isVisualInputMode == isVisualInputMode)&&(identical(other.matrixSize, matrixSize) || other.matrixSize == matrixSize)&&const DeepCollectionEquality().equals(other.matrixValues, matrixValues)&&(identical(other.isValidInput, isValidInput) || other.isValidInput == isValidInput));
}


@override
int get hashCode => Object.hash(runtimeType,status,matrixInput,errorMessage,isVisualInputMode,matrixSize,const DeepCollectionEquality().hash(matrixValues),isValidInput);

@override
String toString() {
  return 'MatrixInputModel(status: $status, matrixInput: $matrixInput, errorMessage: $errorMessage, isVisualInputMode: $isVisualInputMode, matrixSize: $matrixSize, matrixValues: $matrixValues, isValidInput: $isValidInput)';
}


}

/// @nodoc
abstract mixin class $MatrixInputModelCopyWith<$Res>  {
  factory $MatrixInputModelCopyWith(MatrixInputModel value, $Res Function(MatrixInputModel) _then) = _$MatrixInputModelCopyWithImpl;
@useResult
$Res call({
 MatrixInputStatus status, String matrixInput, String? errorMessage, bool isVisualInputMode, int matrixSize, List<List<int>>? matrixValues, bool isValidInput
});


$MatrixInputStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$MatrixInputModelCopyWithImpl<$Res>
    implements $MatrixInputModelCopyWith<$Res> {
  _$MatrixInputModelCopyWithImpl(this._self, this._then);

  final MatrixInputModel _self;
  final $Res Function(MatrixInputModel) _then;

/// Create a copy of MatrixInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? matrixInput = null,Object? errorMessage = freezed,Object? isVisualInputMode = null,Object? matrixSize = null,Object? matrixValues = freezed,Object? isValidInput = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatrixInputStatus,matrixInput: null == matrixInput ? _self.matrixInput : matrixInput // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isVisualInputMode: null == isVisualInputMode ? _self.isVisualInputMode : isVisualInputMode // ignore: cast_nullable_to_non_nullable
as bool,matrixSize: null == matrixSize ? _self.matrixSize : matrixSize // ignore: cast_nullable_to_non_nullable
as int,matrixValues: freezed == matrixValues ? _self.matrixValues : matrixValues // ignore: cast_nullable_to_non_nullable
as List<List<int>>?,isValidInput: null == isValidInput ? _self.isValidInput : isValidInput // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MatrixInputModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatrixInputStatusCopyWith<$Res> get status {
  
  return $MatrixInputStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc


class _MatrixInputModel implements MatrixInputModel {
  const _MatrixInputModel({required this.status, this.matrixInput = '', this.errorMessage, this.isVisualInputMode = false, this.matrixSize = 2, final  List<List<int>>? matrixValues, this.isValidInput = false}): _matrixValues = matrixValues;
  

@override final  MatrixInputStatus status;
@override@JsonKey() final  String matrixInput;
@override final  String? errorMessage;
@override@JsonKey() final  bool isVisualInputMode;
@override@JsonKey() final  int matrixSize;
 final  List<List<int>>? _matrixValues;
@override List<List<int>>? get matrixValues {
  final value = _matrixValues;
  if (value == null) return null;
  if (_matrixValues is EqualUnmodifiableListView) return _matrixValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool isValidInput;

/// Create a copy of MatrixInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatrixInputModelCopyWith<_MatrixInputModel> get copyWith => __$MatrixInputModelCopyWithImpl<_MatrixInputModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatrixInputModel&&(identical(other.status, status) || other.status == status)&&(identical(other.matrixInput, matrixInput) || other.matrixInput == matrixInput)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isVisualInputMode, isVisualInputMode) || other.isVisualInputMode == isVisualInputMode)&&(identical(other.matrixSize, matrixSize) || other.matrixSize == matrixSize)&&const DeepCollectionEquality().equals(other._matrixValues, _matrixValues)&&(identical(other.isValidInput, isValidInput) || other.isValidInput == isValidInput));
}


@override
int get hashCode => Object.hash(runtimeType,status,matrixInput,errorMessage,isVisualInputMode,matrixSize,const DeepCollectionEquality().hash(_matrixValues),isValidInput);

@override
String toString() {
  return 'MatrixInputModel(status: $status, matrixInput: $matrixInput, errorMessage: $errorMessage, isVisualInputMode: $isVisualInputMode, matrixSize: $matrixSize, matrixValues: $matrixValues, isValidInput: $isValidInput)';
}


}

/// @nodoc
abstract mixin class _$MatrixInputModelCopyWith<$Res> implements $MatrixInputModelCopyWith<$Res> {
  factory _$MatrixInputModelCopyWith(_MatrixInputModel value, $Res Function(_MatrixInputModel) _then) = __$MatrixInputModelCopyWithImpl;
@override @useResult
$Res call({
 MatrixInputStatus status, String matrixInput, String? errorMessage, bool isVisualInputMode, int matrixSize, List<List<int>>? matrixValues, bool isValidInput
});


@override $MatrixInputStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$MatrixInputModelCopyWithImpl<$Res>
    implements _$MatrixInputModelCopyWith<$Res> {
  __$MatrixInputModelCopyWithImpl(this._self, this._then);

  final _MatrixInputModel _self;
  final $Res Function(_MatrixInputModel) _then;

/// Create a copy of MatrixInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? matrixInput = null,Object? errorMessage = freezed,Object? isVisualInputMode = null,Object? matrixSize = null,Object? matrixValues = freezed,Object? isValidInput = null,}) {
  return _then(_MatrixInputModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatrixInputStatus,matrixInput: null == matrixInput ? _self.matrixInput : matrixInput // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isVisualInputMode: null == isVisualInputMode ? _self.isVisualInputMode : isVisualInputMode // ignore: cast_nullable_to_non_nullable
as bool,matrixSize: null == matrixSize ? _self.matrixSize : matrixSize // ignore: cast_nullable_to_non_nullable
as int,matrixValues: freezed == matrixValues ? _self._matrixValues : matrixValues // ignore: cast_nullable_to_non_nullable
as List<List<int>>?,isValidInput: null == isValidInput ? _self.isValidInput : isValidInput // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MatrixInputModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatrixInputStatusCopyWith<$Res> get status {
  
  return $MatrixInputStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
