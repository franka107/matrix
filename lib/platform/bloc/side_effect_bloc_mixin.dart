import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:matrix/platform/bloc/side_effect_provider.dart';

mixin SideEffectBlocMixin<EVENT, STATE, SIDE_EFFECT> on Bloc<EVENT, STATE>
    implements SideEffectProvider<SIDE_EFFECT> {
  final StreamController<SIDE_EFFECT> _sideEffectController =
      StreamController.broadcast();

  void produceSideEffect(SIDE_EFFECT sideEffect) {
    try {
      if (_sideEffectController.isClosed) {
        throw StateError('Cannot emit new states after calling close');
      }
      _sideEffectController.add(sideEffect);
    } catch (error, stackTrace) {
      onError(error, stackTrace);
      rethrow;
    }
  }

  @override
  Stream<SIDE_EFFECT> get sideEffects => _sideEffectController.stream;

  @mustCallSuper
  @override
  Future<void> close() async {
    await super.close();
    await _sideEffectController.close();
  }

  @override
  bool get isClosed => super.isClosed && _sideEffectController.isClosed;
}
