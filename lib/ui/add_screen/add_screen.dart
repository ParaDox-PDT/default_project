import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:n8_default_project/data/local/db/local_database.dart';
import 'package:n8_default_project/models/contact_model/contact_model.dart';
import 'package:n8_default_project/ui/my_contacts_screen.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({
    super.key,
  });

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '+998 (##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  late bool isOnTapped;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  _init(){
    if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
      isOnTapped = false;
    } else {
      isOnTapped = true;
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MyContactsScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Add",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: "Roboto"),
        ),
        actions: [
          IconButton(
            onPressed: !isOnTapped
                ? () {
                    LocalDatabase.insertContact(
                      ContactModelSql(
                          phone: phoneController.text,
                          name: nameController.text),
                    );
                    setState(() {
                      isOnTapped = true;
                    });
                  }
                : null,
            icon: const Icon(Icons.done),
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Enter name",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                  color: Colors.black),
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-z0-9]'))],
              onChanged: (value) {
                setState(() {
                  _init();
                });
              },
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                    color: Color(0xFF9E9E9E)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Phone number",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                  color: Colors.black),
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              inputFormatters: [maskFormatter],
              onChanged: (value) {
                setState(() {
                  _init();
                });
              },
              decoration: InputDecoration(
                hintText: "+998  _ _   _ _ _   _ _   _ _",
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                    color: Color(0xFF9E9E9E)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
