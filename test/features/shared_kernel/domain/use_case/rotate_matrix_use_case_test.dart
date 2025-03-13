import 'package:flutter_test/flutter_test.dart';
import 'package:matrix/features/shared_kernel/domain/entities/matrix_domain.dart';
import 'package:matrix/features/shared_kernel/domain/use_case/rotate_matrix_use_case.dart';

void main() {
  late RotateMatrixUseCase rotateMatrixUseCase;

  setUp(() {
    rotateMatrixUseCase = const RotateMatrixUseCase();
  });

  group('RotateMatrixUseCase', () {
    test('should rotate a 1x1 matrix correctly', () {
      // Arrange
      final matrix = MatrixDomain([
        [5],
      ]);

      // Act
      final result = rotateMatrixUseCase.call(matrix);

      // Assert
      expect(result.values, [
        [5],
      ]);
    });

    test('should rotate a 2x2 matrix correctly', () {
      // Arrange
      final matrix = MatrixDomain([
        [1, 2],
        [3, 4],
      ]);

      // Act
      final result = rotateMatrixUseCase.call(matrix);

      // Assert
      expect(result.values, [
        [2, 4],
        [1, 3],
      ]);
    });

    test('should rotate a 3x3 matrix correctly', () {
      // Arrange
      final matrix = MatrixDomain([
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
      ]);

      // Act
      final result = rotateMatrixUseCase.call(matrix);

      // Assert
      expect(result.values, [
        [3, 6, 9],
        [2, 5, 8],
        [1, 4, 7],
      ]);
    });

    test('should rotate a 4x4 matrix correctly', () {
      // Arrange
      final matrix = MatrixDomain([
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 10, 11, 12],
        [13, 14, 15, 16],
      ]);

      // Act
      final result = rotateMatrixUseCase.call(matrix);

      // Assert
      expect(result.values, [
        [4, 8, 12, 16],
        [3, 7, 11, 15],
        [2, 6, 10, 14],
        [1, 5, 9, 13],
      ]);
    });

    test('should handle matrix with negative numbers', () {
      // Arrange
      final matrix = MatrixDomain([
        [-1, -2],
        [-3, -4],
      ]);

      // Act
      final result = rotateMatrixUseCase.call(matrix);

      // Assert
      expect(result.values, [
        [-2, -4],
        [-1, -3],
      ]);
    });

    test('should handle matrix with zeros', () {
      // Arrange
      final matrix = MatrixDomain([
        [0, 0],
        [0, 0],
      ]);

      // Act
      final result = rotateMatrixUseCase.call(matrix);

      // Assert
      expect(result.values, [
        [0, 0],
        [0, 0],
      ]);
    });

    test('should perform four rotations and get back the original matrix', () {
      // Arrange
      final originalMatrix = MatrixDomain([
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
      ]);

      // Act
      var rotated = rotateMatrixUseCase.call(originalMatrix);
      rotated = rotateMatrixUseCase.call(rotated);
      rotated = rotateMatrixUseCase.call(rotated);
      rotated = rotateMatrixUseCase.call(rotated);

      // Assert - After 4 rotations, we should get back the original matrix
      expect(rotated.values, originalMatrix.values);
    });

    test('should handle large matrix', () {
      // Arrange - Let's create a 8x8 matrix
      final largeMatrix = MatrixDomain(
        List.generate(8, (i) => List.generate(8, (j) => i * 8 + j + 1)),
      );

      // Expected result after rotation
      final expectedRotatedValues = [
        [8, 16, 24, 32, 40, 48, 56, 64],
        [7, 15, 23, 31, 39, 47, 55, 63],
        [6, 14, 22, 30, 38, 46, 54, 62],
        [5, 13, 21, 29, 37, 45, 53, 61],
        [4, 12, 20, 28, 36, 44, 52, 60],
        [3, 11, 19, 27, 35, 43, 51, 59],
        [2, 10, 18, 26, 34, 42, 50, 58],
        [1, 9, 17, 25, 33, 41, 49, 57],
      ];

      // Act
      final result = rotateMatrixUseCase.call(largeMatrix);

      // Assert
      expect(result.values, expectedRotatedValues);
    });

    test('should preserve matrix elements during rotation', () {
      // Arrange
      final matrix = MatrixDomain([
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
      ]);

      // Act
      final result = rotateMatrixUseCase.call(matrix);

      // Assert - Every element from original should be in rotated matrix
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          expect(
            result.values.expand((row) => row).contains(matrix.values[i][j]),
            true,
          );
        }
      }
    });

    test('should return a new matrix instance, not modifying the original', () {
      // Arrange
      final originalValues = [
        [1, 2],
        [3, 4],
      ];

      final deepCopy = List<List<int>>.from(
        originalValues.map((row) => List<int>.from(row)),
      );

      final matrix = MatrixDomain(deepCopy);

      // Act
      final result = rotateMatrixUseCase.call(matrix);

      originalValues[0][0] = 99;

      // Assert
      expect(result.values, [
        [2, 4],
        [1, 3],
      ]);

      expect(matrix.values[0][0], 1);
    });
  });

  group('MatrixDomain additional validations', () {
    test('rowCount and columnCount should be correct', () {
      // Arrange
      final matrix = MatrixDomain([
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
      ]);

      // Act
      final result = rotateMatrixUseCase.call(matrix);

      // Assert
      expect(result.rowCount, 3);
      expect(result.columnCount, 3);
    });

    test('isValidSquareMatrix should return true for rotated matrix', () {
      // Arrange
      final matrix = MatrixDomain([
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
      ]);

      // Act
      final result = rotateMatrixUseCase.call(matrix);

      // Assert
      expect(result.isValidSquareMatrix(), true);
    });
  });
}
