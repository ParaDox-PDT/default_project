import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/global_widgets/global_appbar.dart';
import 'package:n8_default_project/ui/global_widgets/global_button.dart';
import 'package:n8_default_project/ui/global_widgets/text_field.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GlobalAppBar(title: tr("Account")),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * (24 / 375), vertical: height * (24 / 812)),
        child: Column(
          children: [
             GetTextField(
                title: tr("Old_Password"),
                text: tr("Old_Password"),
                type: TextInputType.visiblePassword),
            SizedBox(
              height: height * (16 / 812),
            ),
             GetTextField(
                title: tr("New_Password"),
                text: tr("New_Password"),
                type: TextInputType.visiblePassword),
            SizedBox(
              height: height * (16 / 812),
            ),
             GetTextField(
                title: tr("Confirm_Password"),
                text: tr("Confirm_Password"),
                type: TextInputType.visiblePassword),
            SizedBox(
              height: height * (24 / 812),
            ),
             GlobalButton(title: tr("Update_password"))
          ],
        ),
      ),
    );
  }
}
