import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/global_widgets/global_appbar.dart';
import 'package:n8_default_project/ui/settings/language_page/language_screen.dart';
import 'package:n8_default_project/ui/global_widgets/list_items.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const GlobalAppBar(title: "Settings"),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * (24 / 375), vertical: height * (24 / 812)),
        child: Column(
          children: [
            GlobalListItems(
                title: "App language",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const SelectLanguagePage();
                  }));
                }),
            const Divider(thickness: 0.5,),
            GlobalListItems(title: "Notification", onTap: (){}),
            SizedBox(height: height*(8/812),),
            const Divider(thickness: 0.5,),
            GlobalListItems(title: "Update version", onTap: (){}),
          ],
        ),
      ),
    );
  }
}
