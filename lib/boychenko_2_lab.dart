import 'dart:io';
import "dart:math";

/// Нахождение минимальных автоматов
List<List<int>> createClearlyMinimalMatrix(List<List<int>> matrix) {
  List<List<int>> eqvMatrix = List.from(matrix);
  int i = 0; // строка состояния, которое мы проверяем
  int j = 0;
  bool isNotEqualRow;
  while (i < eqvMatrix.length) {
    List<int> tempRow = eqvMatrix[i];
    j = i + 1;
    isNotEqualRow = true;
    while (isNotEqualRow & (j < eqvMatrix.length)) {
      isNotEqualRow = !isEqualLists(tempRow, eqvMatrix[j]);
      j++;
    }
    if ((j == eqvMatrix.length) & isNotEqualRow) {
      // если прошли полностью и последняя строка не идентична, значит состояние не изоморфно
      i++;
    } else {
      // если изоморфно, то удаляем второе, переименовываем и проходимся заново
      int row = 0, column = 0;
      j--;
      eqvMatrix.remove(eqvMatrix[j]); // удаляем строку состояния

      while (row < eqvMatrix.length) {
        column = 0;
        while (column < eqvMatrix[row].length) {
          if ((column == j)) {
            eqvMatrix[row].remove(eqvMatrix[row][column]); // удаляем элемент
          } else if (eqvMatrix[row][column] == (j + 1)) {
            eqvMatrix[row][column] = i + 1;
          }
          column++;
        }
        row++;
      }
      i = 0; // чтобы пройтись с начала обнуляем счетчик
    }
  }
  return eqvMatrix;
}

/// Нахождение изоморфных автоматов
List<List<int>> createIsomorphicAutomation(List<List<int>> matrix) {
  // получаем случайные строчки для смены
  int row1 = Random().nextInt(matrix.length);
  int row2 = Random().nextInt(matrix.length) + 1;
  if (row1 > matrix.length - 1) {
    row1 -= 1;
  }
  if (row2 > matrix.length - 1) {
    row2 -= 1;
  }
  // проверяем на идентичность
  while (row1 == row2) {
    row1 = Random().nextInt(matrix.length);
    row2 = Random().nextInt(matrix.length) + 1;
    if (row1 > matrix.length - 1) {
      row1 -= 1;
    }
    if (row2 > matrix.length - 1) {
      row2 -= 1;
    }
  }
  // меняем местами
  final List<int> firstRow = matrix[row1];
  matrix[row1] = matrix[row2];
  matrix[row2] = firstRow;
  // меняем все вхождения состояний
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix.length; j++) {
      if (matrix[i][j] == (row1 + 1)) {
        matrix[i][j] == (row2 + 1);
      }
      if (matrix[i][j] == row2 + 1) {
        matrix[i][j] == (row1 + 1);
      }
    }
  }

  return matrix;
}

/// Проверка списков на идентичность
bool isEqualLists(List<int> listA, List<int> listB) {
  if (listA.length != listB.length) {
    return false;
  }
  int i = 0;

  while (i < listA.length) {
    if (listA[i] != listB[i]) {
      break;
    }
    i++;
  }
  return i == listA.length;
}

/// Находит проходящие состояния
List<int> findTransientStates(List<List<int>> matrix) {
  final int len = matrix.length;
  int j;
  List<int> deadLocksPositions = [];
  for (int i = 0; i < len; i++) {
    j = 0;
    bool isZeroState = true;
    while (j < len && isZeroState) {
      if (i != j) {
        isZeroState = matrix[j][i] == 0;
      }
      isZeroState = false;
      j++;
    }
    if (isZeroState) {
      deadLocksPositions.add(i);
    }
  }
  return deadLocksPositions;
}

/// Печать матрицы
void printMatrix(List<List<int>> matrix) {
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix.length; j++) {
      stdout.write(" ${matrix[i][j]}");
    }
    stdout.write("\n");
  }
}

/// Создание случайной матрицы
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

/// Вычисление факториала рекурсивно
int factorial(int n) {
  return n == 1 ? 1 : n * factorial(n - 1);
}

// List<int> uniqueElements(List<List<int>> matrix) {
//   // возвращает уникальные ненулевые элементы матрицы
//   List<int> res = [];
//   int element;
//   for (int i = 0; i < matrix.length; i++) {
//     for (int j = 0; j < matrix.length; j++) {
//       element = matrix[i][j];
//       if ((element != 0) & res.contains(element)) {
//         res.add(element);
//       }
//     }
//   }
//   res.sort();
//   return res;
// }
