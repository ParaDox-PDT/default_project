import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../data/local/service/hive_service.dart';
import '../../data/models/app_model.dart';

class AppDetailsScreen extends StatefulWidget {
  const AppDetailsScreen({super.key, required this.app});

  final AppModel app;

  @override
  State<AppDetailsScreen> createState() => _AppDetailsScreenState();
}

class _AppDetailsScreenState extends State<AppDetailsScreen> {
  bool isEqual = false;

  List<AppModel> apps =[];

  _init() {
    if (HiveService.cartsBox.length == 0) {
      apps = [];
    } else {
      for (int i = 0; i < HiveService.cartsBox.length; i++) {
        apps.add(HiveService.cartsBox.getAt(i));
      }
    }
  }

  _checkEqual() {
    apps.forEach((element) {
      if (element.title == widget.app.title) {
        setState(() {
          isEqual = true;
        });
      }
    });
  }

  @override
  void initState() {
    _init();
    _checkEqual();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Details"),
        centerTitle: true,
        actions: [
          ZoomTapAnimation(
            child: Icon(Icons.save),
            onTap: !isEqual
                ? () {
                    HiveService.cartsBox.add(widget.app);
                    setState(() {
                      _init();
                      _checkEqual();
                    });
                  }
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("This app is already saved!!!")));
                  },
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: widget.app.thumbnail,
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: MediaQuery.sizeOf(context).width * 0.3,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    widget.app.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: "Company: ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                children: [
                  TextSpan(
                    text: widget.app.developer,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: "\nGenre: ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: widget.app.genre,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: "\nSupport platforms: ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: widget.app.platform,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: "\nRelease data: ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: widget.app.releaseDate,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: "\nDescription: ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: widget.app.shortDescription,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: "\nLink to download: ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: widget.app.gameUrl,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await launchUrl(Uri.parse("${widget.app.gameUrl}"));
                      },
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
