
import 'package:injectable/injectable.dart';
import 'package:matrix/features/shared_kernel/domain/entities/matrix_domain.dart';


@injectable
class RotateMatrixUseCase {
  const RotateMatrixUseCase();

  MatrixDomain call(MatrixDomain matrix) {
    final int n = matrix.rowCount;
    final List<List<int>> rotated = List.generate(
      n, 
      (_) => List.filled(n, 0),
    );
    
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        rotated[n - 1 - j][i] = matrix.values[i][j];
      }
    }
    
    return MatrixDomain(rotated);
  }
}