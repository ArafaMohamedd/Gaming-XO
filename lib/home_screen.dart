import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac/game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String activeplayer = 'x';
  bool gameOver = false;
  int turn = 0;
  String result = '';
  Game game = Game();

  bool isSwitched = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: MediaQuery.of(context).orientation == Orientation.portrait? Column(
          children: [
            ...firstBlock(),
            _expanded(context),
            ...lastBlock(),
          ],
        ):Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...firstBlock(),
                  const SizedBox(height: 20,),
                  ...lastBlock(),
                ],
              ),
            ),
            _expanded(context),
          ],
        )
      ),
    );
  }

  List<Widget> firstBlock(){
    return[
      SwitchListTile.adaptive(
        title: const Text('Turn on/off two playr',
          style: TextStyle(color: Colors.white,fontSize: 28),
          textAlign: TextAlign.center,
        ),
        value: isSwitched,
        onChanged: (bool newValue) {
          setState(() {
            isSwitched = newValue;
          });
        },
      ),

      Text(
        'It\'s $activeplayer turn'.toUpperCase(),
        style: const TextStyle(color: Colors.white,fontSize: 52),
        textAlign: TextAlign.center,
      ),
    ];
  }

  List<Widget> lastBlock(){
    return[
      Text(
        result,
        style: const TextStyle(color: Colors.white,fontSize: 52),
        textAlign: TextAlign.center,
      ),
      ElevatedButton.icon(
        onPressed: (){
          setState(() {
            player.playerX = [];
            player.playerO = [];
            activeplayer = 'x';
            gameOver = false;
            turn = 0;
            result = '';
          });
        },
        icon: const Icon(Icons.replay),
        label: const Text('Repeat the game'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).splashColor),
        ),
      )
    ];
  }

  Expanded _expanded(BuildContext context) {
    return Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(16),
                  mainAxisSpacing : 8.0,
                  crossAxisSpacing : 8.0,
                  childAspectRatio : 1.0,
                  crossAxisCount: 3,
                children: List.generate(9, (index) =>  InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: gameOver? null: () => _onTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child:  Center(
                        child: Text(
                          player.playerX.contains(index)
                              ? 'X'
                              :  player.playerO .contains(index)
                                ?'O'
                                :'',
                          style: TextStyle(
                              color: player.playerX.contains(index)
                              ? Colors.blue
                              : Colors.pink,
                              fontSize: 62),
                        )
                    ),
                  ),
                )

                ),

              ));
  }

  _onTap(int index) async{
     if((player.playerX.isEmpty || !player.playerX.contains(index))&&
         (player.playerO.isEmpty || !player.playerO.contains(index))){
       game.playGame(index, activeplayer);
       updateState();

       if(isSwitched && !gameOver && turn != 9){
         await game.autoPlay(activeplayer);
         updateState();
       }
    }
  }
  void updateState() {
    setState(() {
      activeplayer = (activeplayer =='X') ? 'O':'X';
      turn++;

      String winnerPlayer = game.checkWinner();
      if(winnerPlayer != ''){
        gameOver = true;
        result = '$winnerPlayer is the winner';
      }else if(!gameOver && turn == 9){
        result = 'It\'s Draw!';
      }
    });
  }
}
