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
  var maskFormatter = MaskTextInputFormatter(
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
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const MyContactsScreen();
            }));
          },
          icon: const Icon(Icons.arrow_back),
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
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 52,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                width: 150,
              ),
              SvgPicture.asset("assets/svg/account.svg"),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                  onPressed: () {
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
                                    "Delete",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto"),
                                  ),
                                  const SizedBox(height: 10,),
                                   Text(
                                    "Are you sure you want to remove ${contactModelSql.name} from your contacts?",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Roboto"),
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }, child: const Text("No")),
                                      TextButton(
                                          onPressed: () {
                                            LocalDatabase.deleteContact(
                                                contactModelSql.id ?? 0);
                                            Navigator.pop(context);
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                      return const MyContactsScreen();
                                                    }));
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
                  },
                  icon: SvgPicture.asset(AppIcons.delete)),
              IconButton(
                  onPressed: () {
                    _updateSingleContact(contactModelSql);
                    _updateContacts();
                  },
                  icon: const Icon(Icons.edit)),
            ],
          ),
          Text(
            contactModelSql.name,
            style: const TextStyle(
                fontSize: 22,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                contactModelSql.phone,
                style: const TextStyle(
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
                    decoration: const InputDecoration(
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
                      child: const Text("Update"))
                ],
              ),
            ),
          );
        });
  }
}