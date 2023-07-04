import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/models/list_model.dart';


class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key, required this.index});
  final int index;

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  List<String> indexes=[];
  Future<void> _init()async{
    indexes=StorageRepository.getList("productsIndexes");
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
        title: Text(
          productModels[widget.index].title,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        actions: [IconButton(onPressed: (){
            indexes.add(widget.index.toString());
          _saveList("productsIndexes",indexes);
          _init();
          Navigator.pop(context);
        }, icon: Icon(Icons.save))],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                productModels[widget.index].img,
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * .5,
              ),
              SizedBox(
                height: 18,
              ),
              RichText(
                text: TextSpan(
                  text: "Nomi",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue),
                  children: [
                    TextSpan(
                      text: "\n${productModels[widget.index].title}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: "\nBa'tafsil",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),
                    TextSpan(
                        text:
                        "\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _saveList(String key,List<String> list)async{
    await StorageRepository.putList(key, list);
  }
}

