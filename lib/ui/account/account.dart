import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/global_widgets/global_appbar.dart';
import 'package:n8_default_project/ui/global_widgets/text_field.dart';

import '../../local/storage_repository.dart';
import '../../utils/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  String oldPassword="";
  bool isStart=true;

  final TextEditingController _oldPasswordController=TextEditingController();
  final TextEditingController _newPasswordController=TextEditingController();
  final TextEditingController _confirmPasswordController=TextEditingController();

  Future<void>  _init()async {
    oldPassword=StorageRepository.getString("old_password");
    isStart=StorageRepository.getBool("is_start");
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

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
               controller: _oldPasswordController,
                title: tr("Old_Password"),
                text: tr("Old_Password"),
                type: TextInputType.visiblePassword),
            SizedBox(
              height: height * (16 / 812),
            ),
             GetTextField(
               controller: _newPasswordController,
                title: tr("New_Password"),
                text: tr("New_Password"),
                type: TextInputType.visiblePassword),
            SizedBox(
              height: height * (16 / 812),
            ),
             GetTextField(
               controller: _confirmPasswordController,
                title: tr("Confirm_Password"),
                text: tr("Confirm_Password"),
                type: TextInputType.visiblePassword),
            SizedBox(
              height: height * (24 / 812),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if(isStart){
                    if(_newPasswordController.text==_confirmPasswordController.text){
                      _saver("old_password", _newPasswordController.text);
                    }
                  }else{
                    if(oldPassword==_oldPasswordController.text){
                      if(_newPasswordController.text==_confirmPasswordController.text){
                        _saver("old_password", _newPasswordController.text);
                      }
                    }
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.C_52B6DF,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(double.infinity, height*(56/812))
              ),
              child: Center(
                child: Text(
                  tr("Update_password"),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: AppColors.white,
                      fontFamily: "Poppins"),
                ),
              ),
            )
          ],

        ),
      ),
    );
  }

  _saver(String name,String value)async{
    await StorageRepository.putString(name, value);
  }
}
