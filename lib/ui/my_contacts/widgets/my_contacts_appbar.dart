import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyContactsAppBar extends StatelessWidget  implements PreferredSize{
  const MyContactsAppBar({super.key, required this.onSearchTap, required this.onMoreTap});

  final VoidCallback onSearchTap;
  final ValueChanged<int> onMoreTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white),
      backgroundColor: Colors.white,
      elevation: 1,
      title: const Text(
        "Contacts",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: "Roboto"),
      ),
      actions: [
        IconButton(
          onPressed: onSearchTap,
          icon: const Icon(Icons.search),
          color: Colors.black,
        ),
        PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert,color: Colors.black,),
            onSelected: onMoreTap,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Delete all'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('Sort by A-Z'),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: Text('Sort by Z-A'),
              ),
            ])
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity,56);
}
