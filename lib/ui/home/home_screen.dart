import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:n8_default_project/ui/home/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _timer = 10;
  late TextEditingController _controller;
  late Timer _secontTimer;

  @override
  void initState() {
    _timer = 10;
    _controller = TextEditingController();
    _init();
    super.initState();
  }

  _init() {
    _secontTimer=Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_timer == 0) {
          timer.cancel();
          return;
        }
        if (mounted) {
          setState(() => _timer--);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          "Kodni tasdiqlang",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/clock.png",
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${_timer.toString()} soniya",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: Colors.white),
              child: TextField(
                controller: _controller,
                cursorHeight: 20,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                cursorWidth: 1.4,
                cursorColor: Colors.black.withOpacity(0.2),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _timer > 0
                ? ElevatedButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        _secontTimer.cancel();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SecondScreen();
                            },
                          ),
                        );
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                      "Confirm code",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  )
                : Column(
                    children: [
                      const Text(
                        "Vaqt tugadi,qaytadan urinib ko'ring!",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.red,
                            fontSize: 24),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _timer=10;
                              _init();
                              _controller.text='';
                            });
                          },
                          child: const Text(
                            "Kodni qaytadan kiriting",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.purple),
                          ))
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
