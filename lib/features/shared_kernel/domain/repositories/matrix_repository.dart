import 'package:matrix/features/shared_kernel/domain/entities/matrix_domain.dart';

abstract class MatrixRepository {
  Future<void> saveMatrix(String id, MatrixDomain matrix);
  Future<MatrixDomain?> getMatrix(String id);
  Future<List<MatrixDomain>> getAllMatrices();
  Future<void> deleteMatrix(String id);
}
