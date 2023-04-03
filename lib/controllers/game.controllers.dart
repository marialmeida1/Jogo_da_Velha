import 'dart:math';

import 'package:jogo_da_velha/controllers/enumsPlayers.controllers.dart';
import 'package:jogo_da_velha/controllers/constantes.controllers.dart';
import 'package:jogo_da_velha/controllers/enumsWinner.controllers.dart';
import 'package:jogo_da_velha/models/manipulacao.models.dart';

class GameController {
  List<Board> tiles = [];
  List<int> movesPlayer1 = [];
  List<int> movesPlayer2 = [];
  late Player currentPlayer;
  late bool isSinglePlayer;

  bool get hasMove => (movesPlayer1.length + movesPlayer2.length) != BOARD_SIZE;

  GameController() {
    _initialize();
  }

  void _initialize() {
    movesPlayer1.clear();
    movesPlayer2.clear();
    currentPlayer = Player.player1;
    isSinglePlayer = false;
    tiles = List<Board>.generate(
      BOARD_SIZE,
      (index) => Board(index + 1),
    );
  }

  void reset() {
    _initialize();
  }

  void markBoardByIndex(index) {
    final tile = tiles[index];
    if (currentPlayer == Player.player1) {
      _markBoardWithPlayer1(tile);
    } else {
      _markBoardWithPlayer2(tile);
    }

    tile.enable = false;
  }

  void _markBoardWithPlayer1(Board tile) {
    tile.simbolo = PLAYER1_SIMBOL;
    tile.color = PLAYER1_COLOR;
    movesPlayer1.add(tile.id);
    currentPlayer = Player.player2;
  }

  void _markBoardWithPlayer2(Board tile) {
    tile.simbolo = PLAYER2_SIMBOL;
    tile.color = PLAYER2_COLOR;
    movesPlayer2.add(tile.id);
    currentPlayer = Player.player1;
  }

  bool _checkPlayerWiner(List<int> moves) {
    return winnerRules.any(
      (rule) =>
          moves.contains(rule[0]) &&
          moves.contains(rule[1]) &&
          moves.contains(rule[2]),
    );
  }

  Winner checkWinner() {
    if (_checkPlayerWiner(movesPlayer1)) return Winner.player1;
    if (_checkPlayerWiner(movesPlayer2)) return Winner.player2;
    return Winner.nome;
  }

  static const winnerRules = {
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7],
  };

  int botGame() {
    var list = new List.generate(9, (i) => i + 1);
    list.removeWhere((element) => movesPlayer1.contains(element));
    list.removeWhere((element) => movesPlayer2.contains(element));

    var random = new Random();
    var index = random.nextInt(list.length - 1);
    return tiles.indexWhere((tile) => tile.id == list[index]);
  }
}
