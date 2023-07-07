import 'package:flutter/material.dart';
import 'package:n8_default_project/models/app_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDetailsScreen extends StatefulWidget {
  const AppDetailsScreen({super.key, required this.app});
  final AppModel app;

  @override
  State<AppDetailsScreen> createState() => _AppDetailsScreenState();
}

class _AppDetailsScreenState extends State<AppDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Image.network(widget.app.thumbnail),
          Text(widget.app.title,style: TextStyle(fontSize: 20),),
          TextButton(onPressed: ()async{
            await launchUrl(Uri.parse("${widget.app.gameUrl}"));
          }, child: Text(widget.app.gameUrl))
        ],
      ),
    );
  }
}
