import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:n8_default_project/models/contact_model/contact_model.dart';

import '../../utils/icon.dart';

class ContactSearchView extends SearchDelegate {
  ContactSearchView({required this.suggestionList});

  final List<ContactModelSql> suggestionList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: Icon(Icons.arrow_back));
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
    List<ContactModelSql> suggestions = suggestionList.where((searchResult) {
      final result = searchResult.name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: List.generate(
            suggestions.length,
            (index) => ListTile(
                  leading: IconButton(
                      onPressed: () {
                      },
                      icon: SvgPicture.asset(AppIcons.accountImageCircle)),
                  title: Text(
                    suggestions[index].name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  titleTextStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  subtitle: Text("${suggestions[index].phone}"),
                  subtitleTextStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8B8B8B)),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIcons.call),
                  ),
              onTap: (){
                query=suggestions[index].name;
                close(context, query);
              },
                )),
      ),
    );
  }
}
