import 'package:boychenko_2_lab/boychenko_2_lab.dart' as funcs;
import 'dart:convert';
import 'dart:io';

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
  print(funcs.createRanodmMatrix(N));
  sleep(Duration(seconds: 45));
  funcs.printMatrix(funcs.createRanodmMatrix(N));
  

  // print(
  //     'Enter matrix with 1 space symbole between columns and Enter between rows: ');
  // List<List<String>> matrix = [];
  // String? stringRow;
  // int i = 0;
  // // ввод и создание матрицы
  // while (i < N) {
  //   stdout.write("${i + 1}c: ");
  //   stringRow = stdin.readLineSync(
  //     encoding: utf8,
  //     retainNewlines: true,
  //   );
  //   if (stringRow == null || stringRow == "" || stringRow == " ") {
  //     throw 1;
  //   }
  //   // строка, разбиваем на элементы
  //   List<String> row = [];
  //   stringRow.split(" ").forEach(
  //     (element) {
  //       row.add(element);
  //     },
  //   );
  //   // проверяем на размерность
  //   if (row.length == N) {
  //     matrix.add(row);
  //     i++;
  //   } else {
  //     print("Wrong count of elements, please repeat!");
  //   }
  // }
  // // вывод матрицы
  // stdout.write("Your matrix: \n");
  // funcs.printMatrix(matrix);
  // // вывод тупиковых состояний

  sleep(Duration(seconds: 25));
}
