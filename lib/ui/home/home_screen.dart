import 'package:flutter/material.dart';
import 'package:n8_default_project/data/network/api_provider.dart';
import 'package:n8_default_project/data/network/api_repository.dart';
import 'package:n8_default_project/models/card_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardRepository cardRepository =
      CardRepository(apiProvider: ApiProvider());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cards"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<CardModel>>(
            future: cardRepository.fetchAppData(),
            builder: (BuildContext context,
                AsyncSnapshot<List<CardModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                List<CardModel> cards = snapshot.data!;
                return cards.isNotEmpty
                    ? Column(
                        children: [
                          Expanded(
                              child: ListView(
                            children: [
                              ...List.generate(cards.length, (index) {
                                CardModel card = cards[index];
                                String colorA =
                                    "0xFF${card.colors["color_a"].toString().substring(1)}";
                                String colorB =
                                    "0xFF${card.colors["color_b"].toString().substring(1)}";
                                return ZoomTapAnimation(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(colors: [
                                          Color(int.parse(colorA)),
                                          Color(int.parse(colorB))
                                        ])),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              card.bankName,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(card.cardType,style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),)
                                          ],
                                        ),
                                        const SizedBox(height: 20,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("${card.moneyAmounts.toString()} ${card.cardCurrency}",style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),)
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        Text("CARD NUM: ${card.cardNumber}",style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),),
                                        const SizedBox(height: 20,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("EXPIRE DATE: ${card.expireDate.substring(0,16)}",style:const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500) ,),
                                            Image.network(card.iconImage,width: 60,)
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                );
                              })
                            ],
                          ))
                        ],
                      )
                    : const Center(child: Text("Xatolik so dir bo'ldi"));
              }
              return Center(child: Text("Error:${snapshot.error}"));
            }));
  }
}
