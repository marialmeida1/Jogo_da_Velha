import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jogo_da_velha/controllers/constantes.controllers.dart';
import 'package:jogo_da_velha/controllers/enumsPlayers.controllers.dart';
import 'package:jogo_da_velha/controllers/game.controllers.dart';
import 'package:jogo_da_velha/views/widgets/boxAlert.widgets.dart';

import '../../controllers/enumsWinner.controllers.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = GameController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        GAME_TITLE,
        style: TextStyle(
          fontSize: 32, // tamanho da fonte
          color: Colors.white, // cor da fonte
        ),
      ),
      toolbarHeight: 180,
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildBoard(),
          _buildPlayer(),
          _buildReset(),
        ],
      ),
    );
  }

  _buildReset() {
    return ElevatedButton(
      onPressed: _onResetGame,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(BUTTON_RESET),
      ),
    );
  }

  _buildBoard() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: BOARD_SIZE,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: _buildTile,
      ),
    );
  }

  Widget _buildTile(context, index) {
    return GestureDetector(
      onTap: () => _onMark(index),
      child: Container(
        color: _controller.tiles[index].color,
        child: Center(
          child: Text(
            _controller.tiles[index].simbolo,
            style: const TextStyle(
              fontSize: 72.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _onResetGame() {
    setState(() {
      _controller.reset();
    });
  }

  _onMark(index) {
    if (!_controller.tiles[index].enable) return;

    setState(() {
      _controller.markBoardByIndex(index);
    });

    _checkWinner();
  }

  _checkWinner() {
    var winner = _controller.checkWinner();

    if (winner == Winner.nome) {
      if (!_controller.hasMove) {
        _showTiedDialog();
      } else if (_controller.isSinglePlayer &&
          _controller.currentPlayer == Player.player2) {
        final index = _controller.botGame();
        _onMark(index);
      }
    } else {
      String symbol =
          winner == Winner.player1 ? PLAYER1_SIMBOL : PLAYER2_SIMBOL;
      _showWinnerDialog(symbol);
    }
  }

  _showWinnerDialog(String symbol) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return boxAlert(
          title: WIN_TITLE.replaceAll('[SYMBOL]', symbol),
          message: DIALOG_MENSAGE,
          onPressed: _onResetGame,
        );
      },
    );
  }

  _showTiedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return boxAlert(
          title: TIED_TITLE,
          message: DIALOG_MENSAGE,
          onPressed: _onResetGame,
        );
      },
    );
  }

  _buildPlayer() {
    return SwitchListTile(
      activeColor: PLAYER1_COLOR,
      title: Text(_controller.isSinglePlayer ? "Single Player" : "Two Players"),
      secondary: Icon(_controller.isSinglePlayer ? Icons.person : Icons.group),
      value: _controller.isSinglePlayer,
      onChanged: (value) {
        setState(() {
          _controller.isSinglePlayer = value;
        });
      },
    );
  }
}
