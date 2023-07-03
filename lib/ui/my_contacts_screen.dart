import 'package:flutter/material.dart';
import 'package:n8_default_project/data/local/db/local_database.dart';

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
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              LocalDatabase.insertContact(
                ContactModelSql(
                  phone: "+998991234567",
                  name: "Behruz:${DateTime.now().minute}",
                ),
              );
              _updateContacts();
            },
            icon: const Icon(Icons.add),
          )
        ],
        title: const Text("My Contacts"),
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
            return ListView(
              children: List.generate(
                contacts.length,
                (index) => ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(
                      "${contacts[index].phone} ID:${contacts[index].id.toString()}"),
                  trailing: IconButton(
                    onPressed: () {
                      // LocalDatabase.updateContact(
                      //   contactsModelSql:
                      //       contacts[index].copyWith(phone: "123421234"),
                      // );
                      _updateSingleContact(contacts[index]);
                      _updateContacts();
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  onLongPress: () {
                    LocalDatabase.deleteContact(contacts[index].id!);
                    _updateContacts();
                  },
                ),
              ),
            );
          }
          return Center(child: Text(rowData.error.toString()));
        },
      ),
    );
  }

  _updateSingleContact(ContactModelSql contactModelSql) {
    final TextEditingController nameController =
        TextEditingController(text: contactModelSql.name);
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
                    decoration: const InputDecoration(hintText: "Phone"),
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
