import 'package:flutter/material.dart';

class CardsGridView extends StatelessWidget {
  CardsGridView({
    Key? key,
    required this.cards,
  });

  final List<Image> cards;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        // physics: NeverScrollableScrollPhysics(),
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: cards[index],
          );
        },
      ),
    );
  }
}
