import 'package:flutter/material.dart';
import 'package:jogo_da_velha/views/widgets/board.widgets.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GamePage(),
    );
  }
}
