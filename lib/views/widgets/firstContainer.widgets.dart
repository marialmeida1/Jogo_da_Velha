import 'package:flutter/material.dart';

class firstContainer extends StatelessWidget {
  const firstContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      child: const Text(
        "Jogo da Velha",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }
}
