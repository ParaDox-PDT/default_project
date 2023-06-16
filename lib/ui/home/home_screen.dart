import 'package:flutter/material.dart';
import 'package:n8_default_project/local/storage_repository.dart';
import 'package:n8_default_project/ui/login/login_screen.dart';
import 'package:n8_default_project/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> clear(String key)async{
    await StorageRepository.putString(key, "`");
  }

  Future<void> saveIsLogin(String key)async{
    await StorageRepository.putBool(key, false);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "HomeScreen",
            style: TextStyle(color: AppColors.black),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${StorageRepository.getString("first_name")} ${StorageRepository.getString("last_name")}",
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: "SF PRO"),
              ),
              Text(
                "${StorageRepository.getString("email")}",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    fontFamily: "SF PRO"),
              ),
              const SizedBox(height: 100,),
              const SizedBox(height: 100,),
              SizedBox(
                width: width * (204 / 307.5),
                height: height * (40 / 666),
                child: ElevatedButton(
                    onPressed: () {
                      clear("first_name");
                      clear("last_name");
                      clear("confirm_password");
                      clear("email");
                      clear("password");
                      saveIsLogin("is_login");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return const LoginScreen();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.C_1317DD,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    child: const Text(
                      "LOG OUT",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.black,
                          fontFamily: "SF PRO"),
                    )),
              ),
            ],
          ),
        ));
  }
}
