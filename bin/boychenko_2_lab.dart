import 'package:boychenko_2_lab/boychenko_2_lab.dart' as funcs;
import 'dart:convert';
import 'dart:io';
import 'dart:math';

// Вариант 1
void main(List<String> arguments) {
  // оформление и создание необходимых переменных
  print('Enter n: ');
  String? n = stdin.readLineSync(
    encoding: utf8,
    retainNewlines: true,
  );

  int N = int.parse(n ?? '0');
  while (N <= 0) {
    print("Wrong n!!!");
    print('Enter n: ');
    n = stdin.readLineSync(
      encoding: utf8,
      retainNewlines: true,
    );
    N = int.parse(n ?? '0');
  }
  print(
      'Enter matrix with 1 space symbole between columns and Enter between rows: ');
  List<List<int>> matrix = [];
  String? stringRow;
  int i = 0;
  // ввод и создание матрицы
  while (i < N) {
    stdout.write("${i + 1}c: ");
    stringRow = stdin.readLineSync(
      encoding: utf8,
      retainNewlines: true,
    );
    if (stringRow == null || stringRow == "" || stringRow == " ") {
      throw 1;
    }
    // строка, разбиваем на элементы
    List<int> row = [];
    stringRow.split(" ").forEach(
      (element) {
        row.add(int.parse(element));
      },
    );
    // проверяем на размерность
    if (row.length == N) {
      matrix.add(row);
      i++;
    } else {
      print("Wrong count of elements, please repeat!");
    }
  }
  // List<List<int>> randMatrix = funcs.createRanodmMatrix(N);
  // funcs.printMatrix(randMatrix);
  // вывод тупиковых состояний
  List<int> transList = funcs.findTransientStates(matrix);
  print("Transient states: $transList. Count: ${transList.length}.");
  List<List<int>> ismphmatrix = funcs.createIsomorphicAutomation(matrix);
  print("Isomorphic automate: ");
  funcs.printMatrix(ismphmatrix);
  print("Count of isomorphic automations: ${funcs.factorial(matrix.length)}");
  List<List<int>> eqvMatrix = funcs.createClearlyMinimalMatrix(matrix);
  print("\n Сlearly a minimal automaton: ");
  funcs.printMatrix(eqvMatrix);

  // funcs.printMatrix(matrix);
  // sleep(Duration(seconds: 25));
}
