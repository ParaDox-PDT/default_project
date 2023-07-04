import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/data/local/db/local_database.dart';
import 'package:n8_default_project/ui/add_screen/add_screen.dart';
import 'package:n8_default_project/ui/profile/profile_screen.dart';
import 'package:n8_default_project/ui/search_screen/search.dart';
import 'package:n8_default_project/utils/icon.dart';

import '../models/contact_model/contact_model.dart';

class MyContactsScreen extends StatefulWidget {
  const MyContactsScreen({super.key});

  @override
  State<MyContactsScreen> createState() => _MyContactsScreenState();
}

class _MyContactsScreenState extends State<MyContactsScreen> {
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
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Contacts",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: "Roboto"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return SearchScreen();
              }));
            },
            icon: Icon(Icons.search),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      content: Container(
                        width: 224,
                        height: 120,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Sort by"),
                              titleTextStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              trailing: Icon(Icons.arrow_right),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Container(
                                          height: 120,
                                          child: Column(
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "A-Z",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                      fontFamily: "Roboto"),
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: Text("Z-A",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Roboto"))),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ),
                            ListTile(
                              title: Text("Delete all"),
                              titleTextStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              onTap: () {
                                LocalDatabase.deleteAllContacts();
                                setState(() {});
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            icon: Icon(Icons.more_vert),
            color: Colors.black,
          ),
        ],
      ),
      body: FutureBuilder<List<ContactModelSql>>(
        future: LocalDatabase.getAllContacts(),
        builder: (
          context,
          AsyncSnapshot<List<ContactModelSql>> rowData,
        ) {
          if (rowData.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (rowData.hasData) {
            List<ContactModelSql> contacts = rowData.data!;
            return contacts.isNotEmpty
                ? ListView(
                    children: List.generate(
                      contacts.length,
                      (index) => ListTile(
                        leading: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProfileScreen(id: contacts[index].id!);
                              }));
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
                  );
          }
          return Center(child: Text(rowData.error.toString()));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return AddScreen();
          }));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF00B2FF),
      ),
    );
  }
}
