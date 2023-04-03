import 'package:flutter/material.dart';
import 'package:jogo_da_velha/views/game.views.dart';
import 'package:jogo_da_velha/views/themes/dark.themes.dart';
import 'package:jogo_da_velha/views/widgets/board.widgets.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Hello",
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
    ),
  );
}
