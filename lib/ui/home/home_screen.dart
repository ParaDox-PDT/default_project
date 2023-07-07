import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:n8_default_project/data/network/api_provider.dart';
import 'package:n8_default_project/data/network/api_repository.dart';
import 'package:n8_default_project/models/app_model.dart';
import 'package:n8_default_project/ui/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppRepository appRepository = AppRepository(apiProvider: ApiProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.yellow),
        elevation: 0,
      ),
      body: FutureBuilder<List<AppModel>>(
        future: appRepository.fetchAppData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<AppModel>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            List<AppModel> apps = snapshot.data!;
            return apps.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 10),
                      //   color: Colors.black,
                      //     height: 50,
                      //     width: 100,
                      //     child: ListView(
                      //       scrollDirection: Axis.horizontal,
                      //       children: [
                      //         ...List.generate(
                      //             apps.length,
                      //             (index) =>
                      //                 Image.network(apps[index].thumbnail))
                      //       ],
                      //     )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "All Games",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            ...List.generate(apps.length, (index) {
                              AppModel app = apps[index];
                              return ListTile(
                                onTap: () {
                                  Navigator.pushNamed(context, RouteNames.appDetailsScreen,arguments: {"app":app});
                                },
                                title: Text(app.title),
                                subtitle: Text(app.title),
                                trailing: Icon(Icons.arrow_right_outlined),
                              );
                            })
                          ],
                        ),
                      ),
                    ],
                  )
                : const Center(child: Text("Xatolik sodir bo'ldi"));
          }
          return Center(child: Text("Error:${snapshot.error}"));
        },
      ),
    );
  }
}
