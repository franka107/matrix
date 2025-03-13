// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matrix_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatrixResultModel {

 MatrixResultStatus get status; List<List<int>>? get originalMatrix; List<List<int>>? get rotatedMatrix; bool get showAnimation; String get errorMessage; List<Map<String, dynamic>> get matrixHistory;
/// Create a copy of MatrixResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixResultModelCopyWith<MatrixResultModel> get copyWith => _$MatrixResultModelCopyWithImpl<MatrixResultModel>(this as MatrixResultModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixResultModel&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.originalMatrix, originalMatrix)&&const DeepCollectionEquality().equals(other.rotatedMatrix, rotatedMatrix)&&(identical(other.showAnimation, showAnimation) || other.showAnimation == showAnimation)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.matrixHistory, matrixHistory));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(originalMatrix),const DeepCollectionEquality().hash(rotatedMatrix),showAnimation,errorMessage,const DeepCollectionEquality().hash(matrixHistory));

@override
String toString() {
  return 'MatrixResultModel(status: $status, originalMatrix: $originalMatrix, rotatedMatrix: $rotatedMatrix, showAnimation: $showAnimation, errorMessage: $errorMessage, matrixHistory: $matrixHistory)';
}


}

/// @nodoc
abstract mixin class $MatrixResultModelCopyWith<$Res>  {
  factory $MatrixResultModelCopyWith(MatrixResultModel value, $Res Function(MatrixResultModel) _then) = _$MatrixResultModelCopyWithImpl;
@useResult
$Res call({
 MatrixResultStatus status, List<List<int>>? originalMatrix, List<List<int>>? rotatedMatrix, bool showAnimation, String errorMessage, List<Map<String, dynamic>> matrixHistory
});


$MatrixResultStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$MatrixResultModelCopyWithImpl<$Res>
    implements $MatrixResultModelCopyWith<$Res> {
  _$MatrixResultModelCopyWithImpl(this._self, this._then);

  final MatrixResultModel _self;
  final $Res Function(MatrixResultModel) _then;

/// Create a copy of MatrixResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? originalMatrix = freezed,Object? rotatedMatrix = freezed,Object? showAnimation = null,Object? errorMessage = null,Object? matrixHistory = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatrixResultStatus,originalMatrix: freezed == originalMatrix ? _self.originalMatrix : originalMatrix // ignore: cast_nullable_to_non_nullable
as List<List<int>>?,rotatedMatrix: freezed == rotatedMatrix ? _self.rotatedMatrix : rotatedMatrix // ignore: cast_nullable_to_non_nullable
as List<List<int>>?,showAnimation: null == showAnimation ? _self.showAnimation : showAnimation // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,matrixHistory: null == matrixHistory ? _self.matrixHistory : matrixHistory // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}
/// Create a copy of MatrixResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatrixResultStatusCopyWith<$Res> get status {
  
  return $MatrixResultStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc


class _MatrixResultModel implements MatrixResultModel {
  const _MatrixResultModel({required this.status, final  List<List<int>>? originalMatrix, final  List<List<int>>? rotatedMatrix, this.showAnimation = true, this.errorMessage = '', final  List<Map<String, dynamic>> matrixHistory = const []}): _originalMatrix = originalMatrix,_rotatedMatrix = rotatedMatrix,_matrixHistory = matrixHistory;
  

@override final  MatrixResultStatus status;
 final  List<List<int>>? _originalMatrix;
@override List<List<int>>? get originalMatrix {
  final value = _originalMatrix;
  if (value == null) return null;
  if (_originalMatrix is EqualUnmodifiableListView) return _originalMatrix;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<List<int>>? _rotatedMatrix;
@override List<List<int>>? get rotatedMatrix {
  final value = _rotatedMatrix;
  if (value == null) return null;
  if (_rotatedMatrix is EqualUnmodifiableListView) return _rotatedMatrix;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool showAnimation;
@override@JsonKey() final  String errorMessage;
 final  List<Map<String, dynamic>> _matrixHistory;
@override@JsonKey() List<Map<String, dynamic>> get matrixHistory {
  if (_matrixHistory is EqualUnmodifiableListView) return _matrixHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matrixHistory);
}


/// Create a copy of MatrixResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatrixResultModelCopyWith<_MatrixResultModel> get copyWith => __$MatrixResultModelCopyWithImpl<_MatrixResultModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatrixResultModel&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._originalMatrix, _originalMatrix)&&const DeepCollectionEquality().equals(other._rotatedMatrix, _rotatedMatrix)&&(identical(other.showAnimation, showAnimation) || other.showAnimation == showAnimation)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._matrixHistory, _matrixHistory));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_originalMatrix),const DeepCollectionEquality().hash(_rotatedMatrix),showAnimation,errorMessage,const DeepCollectionEquality().hash(_matrixHistory));

@override
String toString() {
  return 'MatrixResultModel(status: $status, originalMatrix: $originalMatrix, rotatedMatrix: $rotatedMatrix, showAnimation: $showAnimation, errorMessage: $errorMessage, matrixHistory: $matrixHistory)';
}


}

/// @nodoc
abstract mixin class _$MatrixResultModelCopyWith<$Res> implements $MatrixResultModelCopyWith<$Res> {
  factory _$MatrixResultModelCopyWith(_MatrixResultModel value, $Res Function(_MatrixResultModel) _then) = __$MatrixResultModelCopyWithImpl;
@override @useResult
$Res call({
 MatrixResultStatus status, List<List<int>>? originalMatrix, List<List<int>>? rotatedMatrix, bool showAnimation, String errorMessage, List<Map<String, dynamic>> matrixHistory
});


@override $MatrixResultStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$MatrixResultModelCopyWithImpl<$Res>
    implements _$MatrixResultModelCopyWith<$Res> {
  __$MatrixResultModelCopyWithImpl(this._self, this._then);

  final _MatrixResultModel _self;
  final $Res Function(_MatrixResultModel) _then;

/// Create a copy of MatrixResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? originalMatrix = freezed,Object? rotatedMatrix = freezed,Object? showAnimation = null,Object? errorMessage = null,Object? matrixHistory = null,}) {
  return _then(_MatrixResultModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatrixResultStatus,originalMatrix: freezed == originalMatrix ? _self._originalMatrix : originalMatrix // ignore: cast_nullable_to_non_nullable
as List<List<int>>?,rotatedMatrix: freezed == rotatedMatrix ? _self._rotatedMatrix : rotatedMatrix // ignore: cast_nullable_to_non_nullable
as List<List<int>>?,showAnimation: null == showAnimation ? _self.showAnimation : showAnimation // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,matrixHistory: null == matrixHistory ? _self._matrixHistory : matrixHistory // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

/// Create a copy of MatrixResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatrixResultStatusCopyWith<$Res> get status {
  
  return $MatrixResultStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
