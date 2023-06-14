import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool changed = false;
  bool isDark = false;
  bool isEnglish = false;
  bool isUzbek = true;
  @override
  void initState() {
    isEnglish=false;
    isUzbek=true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black12 : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          isUzbek? "Sozlamalar":"Settings",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: isDark ? Colors.black12 : Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.person,
                  size: 100,
                ),
              ),
              Text(
                "ParaDox",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : Colors.black),
              ),
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: isDark ? Colors.grey : Colors.black,
                ),
                title: Text(
                 isUzbek? "Biz haqimizda":"Aboust Us",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: isDark ? Colors.white : Colors.black),
                ),
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.language,
                  color: isDark ? Colors.grey : Colors.black,
                ),
                title: Text(
                  isUzbek? "Tilni tanlang":"Change language",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: isDark ? Colors.white : Colors.black),
                ),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Container(
                      width: 100,
                      height: 150,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Image.asset("assets/images/english.png"),
                            title: Text(
                              "English",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            onTap: (){
                              setState(() {
                                isEnglish=true;
                                isUzbek=false;
                                Navigator.pop(context);
                              });

                            },
                            trailing: isEnglish?Icon(Icons.check):SizedBox(),
                          ),
                          ListTile(
                            leading: Image.asset("assets/images/uzbek.png"),
                            title: Text(
                              "Uzbek",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            onTap: (){
                              setState(() {
                                isEnglish=false;
                                isUzbek=true;
                              });
                              Navigator.pop(context);
                            },
                            trailing: isUzbek?Icon(Icons.check):SizedBox(),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.black)),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: isDark ? Colors.white : Colors.grey,
              ),
              ListTile(
                leading: Icon(
                  Icons.mode_night_rounded,
                  color: isDark ? Colors.grey : Colors.black,
                ),
                title: Text(
                 isUzbek? "Mavzuni tanlang":"Choose theme",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: isDark ? Colors.white : Colors.black),
                ),
                trailing: Switch(
                  onChanged: (value) => setState(() {
                    changed = !changed;
                    isDark = !isDark;
                  }),
                  value: changed,
                ),
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
