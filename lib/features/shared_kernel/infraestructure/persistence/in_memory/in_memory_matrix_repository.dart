import 'package:injectable/injectable.dart';
import 'package:matrix/features/shared_kernel/domain/entities/matrix_domain.dart';
import 'package:matrix/features/shared_kernel/domain/repositories/matrix_repository.dart';

@Injectable(as: MatrixRepository)
class InMemoryMatrixRepository implements MatrixRepository {
  InMemoryMatrixRepository();

  final Map<String, MatrixDomain> _matrices = {};

  @override
  Future<void> saveMatrix(String id, MatrixDomain matrix) async {
    _matrices[id] = matrix.copy();
  }

  @override
  Future<MatrixDomain?> getMatrix(String id) async {
    final matrix = _matrices[id];
    return matrix?.copy();
  }

  @override
  Future<List<MatrixDomain>> getAllMatrices() async {
    return _matrices.values.map((matrix) => matrix.copy()).toList();
  }

  @override
  Future<void> deleteMatrix(String id) async {
    _matrices.remove(id);
  }

  Future<void> clear() async {
    _matrices.clear();
  }

  int get count => _matrices.length;
}
