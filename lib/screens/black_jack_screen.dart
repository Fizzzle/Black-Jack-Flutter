import 'dart:math';

import 'package:blackjack/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../widgets/cards_grid_view.dart';

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

    playingCards = {};

    playingCards.addAll(deckOfCards);

    myCards = [];
    dealersCards = [];

    Random random = Random();

    String cardOneKey = playingCards.keys.elementAt(random.nextInt(
        playingCards.length)); //from 1 to playingCards.length inclusive

    // ?????????????????? ???????????????????? ???? ?????????????? ?????????? ?? ???????? ????, ???? ?????? ???????????? ?????? ?? ?????????????? ???? ???? ????????????
    playingCards.removeWhere((key, value) => key == cardOneKey);

    String cardTwoKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.length));
    playingCards.removeWhere((key, value) => key == cardTwoKey);

    String cardThreeKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.length));
    playingCards.removeWhere((key, value) => key == cardThreeKey);

    String cardFourKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.length));
    playingCards.removeWhere((key, value) => key == cardFourKey);

    dealersFirstCard = cardOneKey;
    dealersSecondCard = cardTwoKey;

    playersFirstCard = cardThreeKey;
    playersSecondCard = cardFourKey;

    dealersCards.add(Image.asset(dealersFirstCard!));
    dealersCards.add(Image.asset(dealersSecondCard!));

    dealersScore =
        deckOfCards[dealersFirstCard]! + deckOfCards[dealersSecondCard]!;

    myCards.add(Image.asset(playersFirstCard!));
    myCards.add(Image.asset(playersSecondCard!));
    playerScore =
        deckOfCards[playersFirstCard]! + deckOfCards[playersSecondCard]!;

    if (dealersScore <= 14) {
      String thirdDealersCardKey =
          playingCards.keys.elementAt(random.nextInt(playingCards.length));
      playingCards.removeWhere((key, value) => key == thirdDealersCardKey);

      dealersCards.add(Image.asset(thirdDealersCardKey));

      dealersScore = dealersScore + deckOfCards[thirdDealersCardKey]!;
    }
  }

  void addCard() {
    Random random = Random();

    if (playingCards.length > 0) {
      String cardKey =
          playingCards.keys.elementAt(random.nextInt(playingCards.length));
      playingCards.removeWhere((key, value) => key == cardKey);

      setState(() {
        myCards.add(Image.asset(cardKey));
      });

      playerScore = playerScore + deckOfCards[cardKey]!;
    }
  }

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
                          Text(
                            '???????????????????? ???????? $dealersScore',
                            style: TextStyle(
                                fontSize: 22,
                                color: dealersScore <= 21
                                    ? Colors.green[700]
                                    : Colors.red[900]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // grid view
                          CardsGridView(cards: dealersCards),
                        ],
                      ),
                      //players Cards
                      Column(
                        children: [
                          Text(
                            '???????????????? ???????? $playerScore',
                            style: TextStyle(
                                fontSize: playerScore <= 21 ? 22 : 25,
                                color: playerScore <= 21
                                    ? Colors.black
                                    : Colors.red[900]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // grid view
                          CardsGridView(cards: myCards),
                        ],
                      ),
                      // buttons
                      IntrinsicWidth(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyButton(
                                onPressed: addCard,
                                label: '???????????????? ??????????',
                                size: 21),
                            MyButton(
                                onPressed: changeCards,
                                label: '?????????????????? ??????????',
                                size: 21),
                            // MaterialButton(
                            //   child: Text(
                            //     '???????????????? ??????????',
                            //     style: TextStyle(fontSize: 22),
                            //   ),
                            //   color: Colors.amber[200],
                            //   onPressed: addCard,
                            // ),
                            // MaterialButton(
                            //   child: Text(
                            //     '?????????????????? ??????????',
                            //     style: TextStyle(fontSize: 20),
                            //   ),
                            //   color: Colors.amber[200],
                            //   onPressed: () => changeCards(),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('?????????? ???????????????? ?? ????????????????',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900)),
                    Image.network(
                        'https://st.depositphotos.com/2112833/5027/i/950/depositphotos_50277667-stock-photo-blackjack-playing-cards.jpg'),
                    MyButton(
                      onPressed: changeCards,
                      label: '?? ??????????',
                      size: 25,
                    ),
                  ],
                ),
                // MaterialButton(
                //   onPressed: () {
                //     changeCards();
                //   },
                //   color: Colors.brown[200],
                //   child: Text('Start Game'),
                // ),
              ));
  }
}
