import 'package:flutter/material.dart';

class BlackJackScreen extends StatefulWidget {
  @override
  State<BlackJackScreen> createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {
  bool isGameStarted = false;

  List<Image> myCards = [];

  List<Image> dealersCards = [];

  String? playersFirstCard;
  String? playersSecondCard;

  String? dealersFirstCard;
  String? dealersSecondCard;

  int playerScore = 0;
  int dealersScore = 0;

  final Map<String, int> deckOfCards = {
    "cards/2.1.png": 2,
    "cards/2.2.png": 2,
    "cards/2.3.png": 2,
    "cards/2.4.png": 2,
    "cards/3.1.png": 3,
    "cards/3.2.png": 3,
    "cards/3.3.png": 3,
    "cards/3.4.png": 3,
    "cards/4.1.png": 4,
    "cards/4.2.png": 4,
    "cards/4.3.png": 4,
    "cards/4.4.png": 4,
    "cards/5.1.png": 5,
    "cards/5.2.png": 5,
    "cards/5.3.png": 5,
    "cards/5.4.png": 5,
    "cards/6.1.png": 6,
    "cards/6.2.png": 6,
    "cards/6.3.png": 6,
    "cards/6.4.png": 6,
    "cards/7.1.png": 7,
    "cards/7.2.png": 7,
    "cards/7.3.png": 7,
    "cards/7.4.png": 7,
    "cards/8.1.png": 8,
    "cards/8.2.png": 8,
    "cards/8.3.png": 8,
    "cards/8.4.png": 8,
    "cards/9.1.png": 9,
    "cards/9.2.png": 9,
    "cards/9.3.png": 9,
    "cards/9.4.png": 9,
    "cards/10.1.png": 10,
    "cards/10.2.png": 10,
    "cards/10.3.png": 10,
    "cards/10.4.png": 10,
    "cards/J1.png": 10,
    "cards/J2.png": 10,
    "cards/J3.png": 10,
    "cards/J4.png": 10,
    "cards/Q1.png": 10,
    "cards/Q2.png": 10,
    "cards/Q3.png": 10,
    "cards/Q4.png": 10,
    "cards/K1.png": 10,
    "cards/K2.png": 10,
    "cards/K3.png": 10,
    "cards/K4.png": 10,
    "cards/A1.png": 11,
    "cards/A2.png": 11,
    "cards/A3.png": 11,
    "cards/A4.png": 11,
  };

  Map<String, int> playingCards = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    playingCards.addAll(deckOfCards);
  }

  void changeCards() {
    setState(() {
      isGameStarted = true;
    });
  }

  void addCard() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isGameStarted
            ? SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // dealer cards
                      Column(
                        children: [
                          Text('Dealers Score $dealersScore'),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      //players Cards
                      Column(
                        children: [
                          Text('Players Score $playerScore'),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      // buttons
                      Column(
                        children: [
                          MaterialButton(
                            child: Text('Another Card'),
                            onPressed: addCard,
                          ),
                          MaterialButton(
                            child: Text('Next Round'),
                            onPressed: null,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: MaterialButton(
                  onPressed: () {
                    changeCards();
                  },
                  child: Text('Start Game'),
                ),
              ));
  }
}