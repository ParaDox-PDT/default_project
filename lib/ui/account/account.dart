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
      appBar: const GlobalAppBar(title: "Account"),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * (24 / 375), vertical: height * (24 / 812)),
        child: Column(
          children: [
            const GetTextField(
                title: "Old Password",
                text: "Old password",
                type: TextInputType.visiblePassword),
            SizedBox(
              height: height * (16 / 812),
            ),
            const GetTextField(
                title: "New Password",
                text: "New password",
                type: TextInputType.visiblePassword),
            SizedBox(
              height: height * (16 / 812),
            ),
            const GetTextField(
                title: "Confirm Password",
                text: "Confirm password",
                type: TextInputType.visiblePassword),
            SizedBox(
              height: height * (24 / 812),
            ),
            const GlobalButton(title: "Update Password")
          ],
        ),
      ),
    );
  }
}
