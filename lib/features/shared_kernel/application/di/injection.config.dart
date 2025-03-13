// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../domain/repositories/matrix_repository.dart' as _i58;
import '../../domain/use_case/rotate_matrix_use_case.dart' as _i1036;
import '../../infraestructure/persistence/in_memory/in_memory_matrix_repository.dart'
    as _i793;
import '../../presentation/page/matrix_input/bloc/matrix_input_bloc.dart'
    as _i817;
import '../../presentation/page/matrix_result/bloc/matrix_result_bloc.dart'
    as _i678;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i1036.RotateMatrixUseCase>(
      () => const _i1036.RotateMatrixUseCase(),
    );
    gh.factory<_i58.MatrixRepository>(() => _i793.InMemoryMatrixRepository());
    gh.factory<_i817.MatrixInputBloc>(
      () => _i817.MatrixInputBloc(
        matrixRepository: gh<_i58.MatrixRepository>(),
        rotateMatrixUseCase: gh<_i1036.RotateMatrixUseCase>(),
      ),
    );
    gh.factory<_i678.MatrixResultBloc>(
      () => _i678.MatrixResultBloc(
        matrixRepository: gh<_i58.MatrixRepository>(),
        rotateMatrixUseCase: gh<_i1036.RotateMatrixUseCase>(),
      ),
    );
    return this;
  }
}
