import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:n8_default_project/ui/my_contacts_screen.dart';
import 'package:n8_default_project/utils/icon.dart';

import '../../data/local/db/local_database.dart';
import '../../models/contact_model/contact_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.id});

  final int id;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ContactModelSql contactModelSql;
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+998 (##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  _updateContacts() async {
    contactModelSql = (await LocalDatabase.getSingleContact(widget.id))!;
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
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return MyContactsScreen();
            }));
          },
          icon: Icon(Icons.arrow_back),
        ),
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
            onPressed: () {},
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
      body: Column(
        children: [
          SizedBox(
            height: 52,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 150,
              ),
              SvgPicture.asset("assets/svg/account.svg"),
              SizedBox(
                width: 30,
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                              height: 152,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delete",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto"),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    "Are you sure you want to remove Bobur Mavlonov from your contacts?",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Roboto"),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }, child: Text("No")),
                                      TextButton(
                                          onPressed: () {
                                            LocalDatabase.deleteContact(
                                                contactModelSql.id ?? 0);
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                      return MyContactsScreen();
                                                    }));

                                          },
                                          child: Text(
                                            "Yes",
                                            style: TextStyle(color: Colors.red),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: SvgPicture.asset(AppIcons.delete)),
              IconButton(
                  onPressed: () {
                    // LocalDatabase.updateContact(
                    //   contactsModelSql:
                    //       contacts[index].copyWith(phone: "123421234"),
                    // );
                    _updateSingleContact(contactModelSql);
                    _updateContacts();
                  },
                  icon: Icon(Icons.edit)),
            ],
          ),
          Text(
            contactModelSql.name,
            style: TextStyle(
                fontSize: 22,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                contactModelSql.phone,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.callCircle)),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.massage)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _updateSingleContact(ContactModelSql? contactModelSql) {
    final TextEditingController nameController =
        TextEditingController(text: contactModelSql!.name);
    final TextEditingController phoneController =
        TextEditingController(text: contactModelSql.phone);

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              padding: const EdgeInsets.all(24),
              height: 300,
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [maskFormatter],
                    decoration: InputDecoration(
                      hintText: "+998  _ _   _ _ _   _ _   _ _",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                          color: Color(0xFF9E9E9E)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                      onPressed: () async {
                        await LocalDatabase.updateContact(
                          contactsModelSql: contactModelSql.copyWith(
                            name: nameController.text,
                            phone: phoneController.text,
                          ),
                        );
                        _updateContacts();
                        Navigator.pop(context);
                      },
                      child: Text("Update"))
                ],
              ),
            ),
          );
        });
  }
}
