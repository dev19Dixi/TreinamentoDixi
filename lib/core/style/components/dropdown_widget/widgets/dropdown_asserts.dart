import 'package:flutter/material.dart' show FlutterError;

bool assertValidFilter<T>(bool isFilerLocal) {
  if (isFilerLocal && T != String) {
    throw FlutterError('Filtro Local somente é válido para Tipos String (T == String).');
  }
  return true;
}

bool assertFormatter<T>(String Function(T value)? formatter) {
  if (T != String && formatter == null) {
    throw FlutterError('Para utilizar o Tipo $T, forneça o campo formatter para formatar o texto exibido no DropDown.');
  }
  return true;
}
