import 'dart:io';
import "dart:math";

int countOfEqualStates() {
  
}
List<int> findTransientStates(List<List<String>> matrix) {
  final int len = matrix.length;
  int j;
  List<int> deadLocksPositions = [];
  for (int i = 0; i < len; i++) {
    j = 0;
    bool isZeroState = true;
    while (j < len && isZeroState) {
      try {
        if (i != j) {
          isZeroState = int.parse(matrix[j][i]) == 0;
        }
      } on Exception catch (e) {
        isZeroState = false;
      }
      j++;
    }
    if (isZeroState) {
      deadLocksPositions.add(i);
    }
  }
  return deadLocksPositions;
}

void printMatrix(List<List<int>> matrix) {
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix.length; j++) {
      stdout.write(" ${matrix[i][j]}");
    }
    stdout.write("\n");
  }
}
List<List<int>> createRanodmMatrix(int n) {
  List<List<int>> matrix = [];

  for (int i = 0; i < n; i++) {
    matrix.add([]);
    for (int j = 0; j < n; j++) {
      matrix[i].add(Random().nextInt(n));
    }
  }
  return matrix;
}
