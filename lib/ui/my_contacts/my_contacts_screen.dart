import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/data/local/db/local_database.dart';
import 'package:n8_default_project/ui/app_routs.dart';
import 'package:n8_default_project/ui/my_contacts/widgets/my_contacts_appbar.dart';
import 'package:n8_default_project/ui/my_contacts/widgets/search.dart';
import 'package:n8_default_project/utils/icon.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/contact_model/contact_model.dart';

class MyContactsScreen extends StatefulWidget {
  const MyContactsScreen({super.key});

  @override
  State<MyContactsScreen> createState() => _MyContactsScreenState();
}

class _MyContactsScreenState extends State<MyContactsScreen> {
  List<String> options = <String>[
    'Default',
    'A-Z',
    'Z-A',
  ];
  String dropdownValue = 'Default';

  String searchText = "";

  int selectedMenu = 0;

  List<ContactModelSql> contacts = [];
  List<ContactModelSql> allContacts = [];

  _updateContacts() async {
    allContacts = await LocalDatabase.getAllContacts();
    contacts = await LocalDatabase.getAllContacts();
    setState(() {});
  }

  _sortContacts(String order) async {
    contacts = await LocalDatabase.getContactsByAlphabet(order);
    setState(() {});
  }

  _deleteAllContact() async {
    contacts = await LocalDatabase.deleteAllContacts();
    setState(() {});
  }

  _getContactByQuery(String query) async {
    contacts = await LocalDatabase.getContactsByQuery(query);
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
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: MyContactsAppBar(onSearchTap: () async {
        searchText = await showSearch(
          context: context,
          delegate: ContactSearchView(
            suggestionList: allContacts.map((e) => e).toList(),
          ),
        );
        if (searchText.isNotEmpty) {
          _getContactByQuery(searchText);
        } else {
          _updateContacts();
        }
      }, onMoreTap: (int item) {
        setState(() {
          selectedMenu = item;
        });
        if (selectedMenu == 1) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SizedBox(
                    height: 152,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Delete All Contacts",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Are you sure you want to delete all contacts!",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No")),
                            TextButton(
                                onPressed: () {
                                  _deleteAllContact();
                                  _updateContacts();
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Contactlar muvaffaqiyatli o'chirildi")));
                                  Navigator.pop(context);
                                },
                                child: const Text(
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
        } else {
          _sortContacts(selectedMenu == 2 ? "ASC" : "DESC");
        }
      }),
      body: contacts.isNotEmpty
          ? ListView(
              children: List.generate(
                contacts.length,
                (index) => ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.contactDetails,
                        arguments: {
                          "id": contacts[index].id!,
                          "deleteListener": () {
                            _updateContacts();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Contact muvaffaqiyatli o'chirildi")));
                          },
                          "updateListener": () {
                            _updateContacts();
                          }
                        });
                  },
                  leading: Image.asset(contacts[index].img,width:60,fit: BoxFit.cover,),
                  title: Text(
                    contacts[index].name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  titleTextStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  subtitle: Text(contacts[index].phone),
                  subtitleTextStyle: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8B8B8B)),
                  trailing: IconButton(
                    onPressed: () async{
                      await launchUrl(Uri.parse("tel:${contacts[index].phone}"));
                    },
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
                      const SizedBox(
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
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.addContact, arguments: () {
            _updateContacts();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Contact muvaffaqiyatli qo'shildi!")));
          });
        },
        backgroundColor: const Color(0xFF00B2FF),
        child: const Icon(Icons.add),
      ),
    );
  }
}
