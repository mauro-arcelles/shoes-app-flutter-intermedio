import 'package:flutter/material.dart';

class ZapatoModel extends ChangeNotifier {
  String _assetImage = 'assets/imgs/azul.png';
  String _talla = '9';

  String get assetImage => _assetImage;

  set assetImage(String valor) {
    _assetImage = valor;
    notifyListeners();
  }

  String get talla => _talla;

  set talla(String valor) {
    _talla = valor;
    notifyListeners();
  }
}
