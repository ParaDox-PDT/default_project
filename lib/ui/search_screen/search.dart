import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:n8_default_project/ui/my_contacts_screen.dart';

import '../../data/local/db/local_database.dart';
import '../../models/contact_model/contact_model.dart';
import '../../utils/icon.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ContactModelSql> contacts = [];

  _updateContacts() async {
    contacts = await LocalDatabase.getAllContacts();
    setState(() {});
  }

  @override
  void initState() {
    _updateContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return MyContactsScreen();
              }));
            },
            icon: Icon(Icons.arrow_back),),
        title: TextField(
            onChanged: (newText){
              setState(() {
              });
              onTextChanged(newText);
            },
          decoration: InputDecoration(
            hintText: "Search...",

          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.close,color: Colors.grey,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: contacts.isNotEmpty
          ? ListView(
        children: List.generate(
          contacts.length,
              (index) => ListTile(
            leading: IconButton(
                onPressed: () {
                },
                icon:
                SvgPicture.asset(AppIcons.accountImageCircle)),
            title: Text(
              contacts[index].name,
              overflow: TextOverflow.ellipsis,
            ),
            titleTextStyle: TextStyle(
                fontSize: 16,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
                color: Colors.black),
            subtitle: Text("${contacts[index].phone}"),
            subtitleTextStyle: TextStyle(
                fontSize: 14,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
                color: Color(0xFF8B8B8B)),
            trailing: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.call),
            ),
          ),
        ),
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                SvgPicture.asset(AppIcons.box),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "You have no contacts yet",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 16,
                      fontFamily: "Roboto"),
                )
              ],
            ),
          ),
        ],
      )
    );

  }
  void onTextChanged(String newText) {
    var query = newText;
    LocalDatabase.getSearchContact(query).then((value){
      setState(() {
        contacts.clear();
        contacts.addAll(value);
      });
    });
  }
}
