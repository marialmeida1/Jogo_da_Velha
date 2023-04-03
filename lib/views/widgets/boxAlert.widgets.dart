import 'package:flutter/material.dart';
import 'package:jogo_da_velha/controllers/constantes.controllers.dart';

class boxAlert extends StatelessWidget {
  final String? title;
  final String? message;
  final VoidCallback? onPressed;

  const boxAlert({
    this.title,
    this.message,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title!),
      content: Text(message!),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (onPressed != null) {
              onPressed!();
            }
          },
          child: Text(BUTTON_RESET),
        ),
      ],
    );
  }
}
