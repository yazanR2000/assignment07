import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlipCardAnimation extends StatefulWidget {
  const FlipCardAnimation({super.key});

  @override
  State<FlipCardAnimation> createState() => _FlipCardAnimationState();
}

class _FlipCardAnimationState extends State<FlipCardAnimation> {
  late FlipCardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      controller: _controller,
      fill: Fill.fillBack,
      //speed: 150,
      direction: FlipDirection.HORIZONTAL,
      front: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Image.network(
              "https://mena-innovation.com/2019/wp-content/uploads/2019/08/LUCT-600x400.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Please tap me"),
              SizedBox(width: 10,),
              Icon(Icons.ads_click_sharp)
            ],
          )
        ],
      ),
      back: Container(
        height: 200,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //color: Colors.black,
            border: Border.all(color: Colors.black)),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              "Luminus University School of Technology was established in the year 1980 as a drop of Luminous Group. It is the largest and most important private university college in Jordan and the Middle East. It grants the first degree and the first university degree in addition to the bachelor's degree and academic degrees approved by the Ministry of Higher Education.",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Please tap me"),
                SizedBox(width: 10,),
                Icon(Icons.ads_click_sharp)
              ],
            )
          ],
        ),
      ),
    );
  }
}
