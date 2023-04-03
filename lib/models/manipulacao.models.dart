import 'package:flutter/material.dart';

class Board {
  final int id;
  String simbolo;
  Color color;
  bool enable;

  Board(
    this.id, {
    this.simbolo = '',
    this.color = Colors.black26,
    this.enable = true,
  });
}
