import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/app_detail/app_detail_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/models/app_model.dart';

class ContactSearchView extends SearchDelegate {
  ContactSearchView({required this.suggestionList});

  final List<AppModel> suggestionList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontSize: 64,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<AppModel> suggestions = suggestionList.where((searchResult) {
      final result = searchResult.title.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: List.generate(
          suggestions.length,
          (index) => Container(
            color: Colors.yellowAccent,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: ZoomTapAnimation(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return AppDetailsScreen(app: suggestions[index]);
                }));
              },
              child: Column(
                children: [
                  CachedNetworkImage(imageUrl: suggestions[index].thumbnail),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    suggestions[index].title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
