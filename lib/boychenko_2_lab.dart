import 'dart:io';
import "dart:math";

// int countOfEqualStates() {

// }
List<List<int>> createEqualMatrix(List<List<int>> matrix) {
  List<List<int>> eq_matrix = matrix;
  int i = 0; // строка состояния, которое мы проверяем
  int j = 0;
  bool isNotEqualRow;
  while (i < eq_matrix.length) {
    List<int> tempRow = eq_matrix[i];
    j = i;
    isNotEqualRow = true;
    while (isNotEqualRow | (j < eq_matrix.length)) {
      isNotEqualRow = isEqualLists(tempRow, eq_matrix[j]);
      j++;
    }
    if (j == eq_matrix.length) {
      // если прошли полностью, значит состояние не изоморфно
      i++;
    } else {
      // если изоморфно, то удаляем второе, переименовываем и проходимся заново
      int row = 0, column = 0;
      eq_matrix.remove(eq_matrix[j]); // удаляем строку состояния
      while (row < eq_matrix.length) {
        while (column < eq_matrix[row].length) {
          if ((column == j)) {
            eq_matrix[row].remove(eq_matrix[row][column]); // удаляем элемент
          }
          if (eq_matrix[row][column] == j) {
            eq_matrix[row][column] = i;
          }
          column++;
        }
        row++;
      }
      i = 0; // чтобы пройтись с начала обнуляем счетчик
    }
  }
  return eq_matrix;
}

bool isEqualLists(List<int> listA, List<int> listB) {
  if (listA.length != listB.length) {
    return false;
  }
  int i = 0;
  while ((listA[i] == listB[i]) | (i < listA.length)) {
    i++;
  }
  return i == listA.length;
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
