import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../models/list_model.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  late List<int> selectedProducts;
  late Set<int> newList;

  Future<void> _init() async {
    selectedProducts = StorageRepository.getList("productsIndexes")
        .map((e) => int.parse(e))
        .toList();
    selectedProducts.toSet().toList();
    newList=selectedProducts.toSet();
    selectedProducts=newList.toList();
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "Market",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        // actions: [IconButton(onPressed: (){
        //   setState(() {
        //     _saveInt();
        //     _init();
        //   });
        // }, icon: Icon(Icons.delete,color: Colors.red,))],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: selectedProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3),
                itemBuilder: (context, index) => Slidable(
                  key: const ValueKey(0),
                  endActionPane: ActionPane(
                    extentRatio: 0.3,
                    dragDismissible: false,
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {}),
                    children: [
                      SlidableAction(
                        onPressed: (v) {
                          productModels[selectedProducts[index]].count=1;
                          setState(() {
                            selectedProducts.removeAt(index);
                            _saveList(selectedProducts);
                            _init();
                          });
                        },
                        borderRadius: BorderRadius.circular(15),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children:[ Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                    productModels[selectedProducts[index]].img,
                                    height: 100,
                                    width: 100),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: "Nomi - ",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                        children: [
                                          TextSpan(
                                            text: productModels[
                                                    selectedProducts[index]]
                                                .title,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.orange),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: "Narxi - ",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                        children: [
                                          TextSpan(
                                            text: productModels[
                                                    selectedProducts[index]]
                                                .price,
                                            style: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: productModels[selectedProducts[index]]
                                            .skidka,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.orange),children: [TextSpan(text: "\nCount--${productModels[selectedProducts[index]].count}")]
                                      ),
                                    ),
                                  ],
                                ),

                              ]),Column(
                            children: [
                              ZoomTapAnimation(
                                onTap: (){
                                  setState(() {
                                    productModels[selectedProducts[index]].count++;
                                  });
                                },
                                child: Container(
                                  child: Icon(Icons.add),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.transparent,border: Border.all(width: 2,color: Colors.black)),
                                ),
                              ),
                              ZoomTapAnimation(
                                onTap: (){
                                  setState(() {
                                    if(productModels[selectedProducts[index]].count>=1) {
                                      productModels[selectedProducts[index]]
                                          .count--;
                                    }else{
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${productModels[selectedProducts[index]].title} elementi soni 0 ga teng")));
                                    }
                                  });
                                },
                                child: Container(
                                  child: Icon(Icons.remove),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.transparent,border: Border.all(width: 2,color: Colors.black)),
                                ),
                              ),
                            ],
                          ),]
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _saveList(List<int> list) async {
    await StorageRepository.putList(
        "productsIndexes", list.map((e) => e.toString()).toList());
  }
}
