import 'dart:convert';

class MatrixDomain {
  const MatrixDomain(this.values);
  final List<List<int>> values;
  int get rowCount => values.length;
  int get columnCount => values.isEmpty ? 0 : values[0].length;

  static MatrixDomain parseFromString(String input) {
    try {
      final List<dynamic> parsed = jsonDecode(input);
      final List<List<int>> matrix = [];

      for (final row in parsed) {
        if (row is! List) {
          throw const FormatException('Each row must be an array');
        }

        final List<int> matrixRow = [];
        for (final value in row) {
          if (value is int) {
            matrixRow.add(value);
          } else if (value is num) {
            matrixRow.add(value.toInt());
          } else {
            throw const FormatException('Each value must be a number');
          }
        }
        matrix.add(matrixRow);
      }

      return MatrixDomain(matrix);
    } catch (e) {
      throw FormatException('Invalid matrix format: ${e.toString()}');
    }
  }

  MatrixDomain copy() {
    final newValues = values.map((row) => List<int>.from(row)).toList();
    return MatrixDomain(newValues);
  }

  bool isValidSquareMatrix() {
    if (values.isEmpty) return false;

    final size = values.length;
    for (final row in values) {
      if (row.length != size) {
        return false;
      }
    }

    return true;
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    for (var row in values) {
      buffer.writeln(row.join(' '));
    }
    return buffer.toString().trim();
  }

  /// Converts the matrix to its JSON string representation.
  String toJsonString() {
    return jsonEncode(values);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MatrixDomain) return false;
    if (other.rowCount != rowCount) return false;
    if (other.columnCount != columnCount) return false;

    for (int i = 0; i < rowCount; i++) {
      for (int j = 0; j < columnCount; j++) {
        if (values[i][j] != other.values[i][j]) return false;
      }
    }

    return true;
  }

  @override
  int get hashCode => Object.hashAll(values.expand((row) => row));
}
