import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:n8_default_project/data/local/db/local_database.dart';
import 'package:n8_default_project/models/contact_model/contact_model.dart';
import 'package:n8_default_project/utils/img.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';



class AddScreen extends StatefulWidget {
  const AddScreen({
    super.key,
    required this.listener,
  });

  final VoidCallback listener;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  String img = AppImages.defaultImg;
  final List<String> images=[
    AppImages.defaultImg,
    AppImages.img1,
    AppImages.img2,
    AppImages.img3,
    AppImages.img4,
    AppImages.img5,
    AppImages.img6,
    AppImages.img7,
    AppImages.img8,
    AppImages.img9,
    AppImages.img10,
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
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
            onPressed: () async {
              if (nameController.text.isNotEmpty) {
                if (phoneController.text.isNotEmpty) {
                  String phone = phoneController.text.replaceAll(" ", "");
                  phone = phone.replaceAll("(", "");
                  phone = phone.replaceAll(")", "");
                  phone = phone.replaceAll(")", "");
                  phone = phone.replaceAll("-", "");
                  ContactModelSql newContact =
                      await LocalDatabase.insertContact(
                    ContactModelSql(
                        phone: "+998$phone",
                        name: nameController.text,
                        img: img),
                  );
                  if ((newContact.id != null) && (newContact.id! > 0)) {
                    if (context.mounted) {
                      widget.listener.call();
                      Navigator.pop(context);
                    }
                  } else {}
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Telefon nomer to'liq emas!"),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Ism kitting!"),
                  ),
                );
              }
            },
            icon: const Icon(Icons.done),
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Expanded(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Image.asset(
                            img,
                            width: 150,
                          ),
                          ZoomTapAnimation(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 5,
                                        children: [
                                          ...List.generate(images.length, (index) => ZoomTapAnimation(
                                              onTap: () {
                                                img = images[index];
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Image.asset(
                                                    images[index],
                                                    width: 100,
                                                  ),
                                                  img == images[index]
                                                      ? const Icon(
                                                    Icons.done,
                                                    size: 60,
                                                    color: Colors.red,
                                                  )
                                                      : const SizedBox(
                                                    width: 0,
                                                  ),
                                                ],
                                              ))),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.grey),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
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
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-z0-9]'))
                    ],
                    focusNode: nameFocus,
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
                    focusNode: phoneFocus,
                    onChanged: (number) {
                      if (number.length == 14) {
                        phoneFocus.unfocus();
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: const Text(
                          "+998",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                              color: Colors.black),
                        ),
                      ),
                      hintText: "_ _   _ _ _   _ _   _ _",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
