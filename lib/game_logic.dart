import 'dart:math';

class player{

  static const x = 'X';
  static const o = 'O';
  static const empty = '';

  static List<int> playerX = [];
  static List<int> playerO = [];
}

extension ContainsAll on List{
  bool containsAll(int x, int y, [z]){

    if(z == null)
    return contains(x) && contains(y);
    else
      return contains(x) && contains(y) && contains(z);
  }
}

class Game{
  void playGame(int index, String activeplayer) {
    if(activeplayer == 'X')
      player.playerX.add(index);
    else
    player.playerO.add(index);
  }

  String checkWinner() {
    String winner = '';

    
      if (player.playerX.containsAll(0, 1, 2) ||
          player.playerX.containsAll(3, 4, 5) ||
          player.playerX.containsAll(6, 7, 8) ||
          player.playerX.containsAll(0, 3, 6) ||
          player.playerX.containsAll(1, 4, 7) ||
          player.playerX.containsAll(2, 5, 8) ||
          player.playerX.containsAll(0, 4, 8) ||
          player.playerX.containsAll(2, 4, 6))
        winner = 'X';
    else if (player.playerO.containsAll(0, 1, 2) ||
        player.playerO.containsAll(3, 4, 5) ||
        player.playerO.containsAll(6, 7, 8) ||
        player.playerO.containsAll(0, 3, 6) ||
        player.playerO.containsAll(1, 4, 7) ||
        player.playerO.containsAll(2, 5, 8) ||
        player.playerO.containsAll(0, 4, 8) ||
        player.playerO.containsAll(2, 4, 6))
      winner = 'O';

    else
      winner = '';

    return winner;
  }

  Future<void> autoPlay(activeplayer) async{
    int index = 0;
    List<int> emptyCells = [];

    for (var i = 0; i < 9; i++){
      if(! player.playerX.contains(i) || player.playerO.contains(i))
      emptyCells.add(i);
    }

    // start-center
    if(player.playerO.containsAll(0, 1) && emptyCells.contains(2))
      index= 2;
    else if(player.playerO.containsAll(3, 4) && emptyCells.contains(5))
      index= 5;
    else if(player.playerO.containsAll(6, 7) && emptyCells.contains(8))
      index= 8;
    else if(player.playerO.containsAll(0, 3) && emptyCells.contains(6))
      index= 6;
    else if(player.playerO.containsAll(1, 4) && emptyCells.contains(7))
      index= 7;
    else if(player.playerO.containsAll(2, 5) && emptyCells.contains(8))
      index= 8;
    else if(player.playerO.containsAll(1, 4) && emptyCells.contains(8))
      index= 8;
    else if(player.playerO.containsAll(2, 4) && emptyCells.contains(6))
      index= 6;

      // start-end
    else if(player.playerO.containsAll(0, 2) && emptyCells.contains(1))
      index= 1;
    else if(player.playerO.containsAll(3, 5) && emptyCells.contains(4))
      index= 4;
    else if(player.playerO.containsAll(6, 8) && emptyCells.contains(7))
      index= 7;
    else if(player.playerO.containsAll(0, 6) && emptyCells.contains(3))
      index= 3;
    else if(player.playerO.containsAll(1, 7) && emptyCells.contains(4))
      index= 4;
    else if(player.playerO.containsAll(2, 8) && emptyCells.contains(5))
      index= 5;
    else if(player.playerO.containsAll(0, 8) && emptyCells.contains(4))
      index= 4;
    else if(player.playerO.containsAll(2, 6) && emptyCells.contains(4))
      index= 4;

    // center-end
    else if(player.playerO.containsAll(1, 2) && emptyCells.contains(0))
      index= 0;
    else if(player.playerO.containsAll(4, 5) && emptyCells.contains(3))
      index= 3;
    else if(player.playerO.containsAll(7, 8) && emptyCells.contains(6))
      index= 6;
    else if(player.playerO.containsAll(3, 6) && emptyCells.contains(0))
      index= 0;
    else if(player.playerO.containsAll(4, 7) && emptyCells.contains(1))
      index= 1;
    else if(player.playerO.containsAll(5, 8) && emptyCells.contains(2))
      index= 2;
    else if(player.playerO.containsAll(4, 8) && emptyCells.contains(0))
      index= 0;
    else if(player.playerO.containsAll(4, 6) && emptyCells.contains(2))
      index= 2;

    // start-center
    else if(player.playerX.containsAll(0, 1) && emptyCells.contains(2))
      index= 2;
    else if(player.playerX.containsAll(3, 4) && emptyCells.contains(5))
      index= 5;
    else if(player.playerX.containsAll(6, 7) && emptyCells.contains(8))
      index= 8;
    else if(player.playerX.containsAll(0, 3) && emptyCells.contains(6))
      index= 6;
    else if(player.playerX.containsAll(1, 4) && emptyCells.contains(7))
      index= 7;
    else if(player.playerX.containsAll(2, 5) && emptyCells.contains(8))
      index= 8;
    else if(player.playerX.containsAll(0, 4) && emptyCells.contains(8))
      index= 8;
    else if(player.playerX.containsAll(2, 4) && emptyCells.contains(6))
      index= 6;

    // start-end
    else if(player.playerX.containsAll(0, 2) && emptyCells.contains(1))
      index= 1;
    else if(player.playerX.containsAll(3, 5) && emptyCells.contains(4))
      index= 4;
    else if(player.playerX.containsAll(6, 8) && emptyCells.contains(7))
      index= 7;
    else if(player.playerX.containsAll(0, 6) && emptyCells.contains(3))
      index= 3;
    else if(player.playerX.containsAll(1, 7) && emptyCells.contains(4))
      index= 4;
    else if(player.playerX.containsAll(2, 8) && emptyCells.contains(5))
      index= 5;
    else if(player.playerX.containsAll(0, 8) && emptyCells.contains(4))
      index= 4;
    else if(player.playerX.containsAll(2, 6) && emptyCells.contains(4))
      index= 4;

    //center-end
    else if(player.playerX.containsAll(1, 2) && emptyCells.contains(0))
      index= 0;
    else if(player.playerX.containsAll(4, 5) && emptyCells.contains(3))
      index= 3;
    else if(player.playerX.containsAll(7, 8) && emptyCells.contains(6))
      index= 6;
    else if(player.playerX.containsAll(3, 6) && emptyCells.contains(0))
      index= 0;
    else if(player.playerX.containsAll(4, 7) && emptyCells.contains(1))
      index= 1;
    else if(player.playerX.containsAll(5, 8) && emptyCells.contains(2))
      index= 2;
    else if(player.playerX.containsAll(4, 8) && emptyCells.contains(0))
      index= 0;
    else if(player.playerX.containsAll(4, 6) && emptyCells.contains(2))
      index= 2;

    else{
      Random random = Random();
      int randomIndex = random.nextInt(emptyCells.length);

      index = emptyCells[randomIndex];
    }


    playGame(index, activeplayer);
  }
}
