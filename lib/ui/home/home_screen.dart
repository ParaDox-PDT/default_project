import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  saveBool(String key,bool value) async{
     await StorageRepository.putBool(key, value);
  }

  saveString(String key, String value)async{
    await StorageRepository.putString(key, value);
  }
  late bool isStarted;
  late bool isTap1  ;
  late bool isTap2  ;
  late bool radio1  ;
  late bool radio2 ;
  late bool radio3  ;
  late bool radio  ;
  late bool img  ;
  String name = "";
  String phone = "";

  late TextEditingController controller1;
  late TextEditingController controller2;


  Future<void> init()async{
    setState(() {

    });
    await Future.delayed(Duration(seconds: 0),(){ if(isStarted){
      showDialog(context: context, builder: (context){return Dialog(
        child: Column(
          children: [
            Row(
              children: [
                Text("Name"),
                Text(name)
              ],
            ),
            Row(
              children: [
                Text("Phone"),
                Text(name)
              ],
            ),
            Image.asset(isTap1?"assets/images/img1":"assets/images/img2")
          ],
        ),
      );});
    }});
  }

  @override
  void initState() {
    isStarted=StorageRepository.getBool('is_start');
    isTap1 = StorageRepository.getBool("is_tap1");
    isTap2 = StorageRepository.getBool("is_tap2");
    radio1 = StorageRepository.getBool("is_radio1");
    radio2 = StorageRepository.getBool("is_radio2");
    radio3 = StorageRepository.getBool("is_radio3");
    radio = StorageRepository.getBool("radio");
    img = StorageRepository.getBool("img");
    name = StorageRepository.getString("name");
    phone = StorageRepository.getString("phone");
    controller1 = TextEditingController();
    controller2 = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Home Screen",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About me",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2 - 10,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextField(
                    controller: controller1,
                    cursorHeight: 20,
                    cursorWidth: 1.4,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 15),
                      border: InputBorder.none,
                      hintText: "Name",
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontFamily: "Sora"),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2 - 10,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextField(
                    controller: controller2,
                    cursorHeight: 20,
                    cursorWidth: 1.4,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 15),
                      border: InputBorder.none,
                      prefixIcon: Text(
                        "+998",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontFamily: "Sora"),
                      ),
                      prefixIconConstraints: BoxConstraints(maxHeight: 26),
                      hintText: "Phone number",
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontFamily: "Sora"),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: ZoomTapAnimation(
                        onTap: () {
                          setState(() {
                            saveBool("radio1", true);
                            saveBool("radio2", false);
                            saveBool("radio3", false);
                            saveBool("radio", true);
                          });
                        },
                        child: Icon(radio1
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off))),
                Expanded(
                    child: Text(
                  "Ishlayman",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                Expanded(
                    child: ZoomTapAnimation(
                        onTap: () {
                          setState(() {
                            saveBool("radio2", true);
                            saveBool("radio1", false);
                            saveBool("radio3", false);
                            saveBool("radio", true);
                          });
                        },
                        child: Icon(radio2
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off))),
                Expanded(
                    child: Text(
                  "O'qiyman",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                Expanded(
                    child: ZoomTapAnimation(
                        onTap: () {
                          setState(() {
                            saveBool("radio3", true);
                            saveBool("radio2", false);
                            saveBool("radio1", false);
                            saveBool("radio", true);
                          });
                        },
                        child: Icon(radio3
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off))),
                Expanded(
                    child: Text(
                  "Vaqtincha ishsiz",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    setState(() {
                      saveBool("is_tap1", true);
                      saveBool("is_tap2", false);
                      saveBool("img", true);
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 170,
                        height: 170,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/img1.png",
                            width: 170,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      isTap1
                          ? Container(
                              width: 170,
                              height: 170,
                              color: Colors.white10,
                              child: Icon(
                                Icons.check_circle_rounded,
                                size: 100,
                                color: Colors.greenAccent,
                              ),
                            )
                          : SizedBox(
                              width: 0,
                            ),
                    ],
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    setState(() {
                      saveBool("is_tap2", true);
                      saveBool("is_tap1", false);
                      saveBool("img", true);
                    });
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 170,
                        height: 170,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/img2.png",
                            width: 170,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      isTap2
                          ? Container(
                              width: 170,
                              height: 170,
                              color: Colors.white10,
                              child: Icon(
                                Icons.check_circle_rounded,
                                size: 100,
                                color: Colors.greenAccent,
                              ),
                            )
                          : SizedBox(
                              width: 0,
                            ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            ZoomTapAnimation(
              onTap: () {
                saveString("name", controller1.text);
                saveString("phone", controller2.text);
                saveBool("is_start", true);
                if (img &&
                    radio &&
                    controller1.text.isNotEmpty &&
                    controller2.text.isNotEmpty) {
                  return ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Saved",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  );
                }
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueAccent),
                child: Center(
                    child: Text(
                  "Save",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
