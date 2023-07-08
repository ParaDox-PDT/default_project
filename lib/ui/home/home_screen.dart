import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:n8_default_project/data/network/api_provider.dart';
import 'package:n8_default_project/data/network/api_repository.dart';
import 'package:n8_default_project/models/app_model.dart';
import 'package:n8_default_project/ui/app_routes.dart';
import 'package:n8_default_project/ui/home/widgets/search_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppRepository appRepository = AppRepository(apiProvider: ApiProvider());
  List<AppModel> apps=[];

  _fetchData()async{
    apps=await appRepository.fetchAppData();
  }

  String searchText = "";

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.yellow),
        elevation: 0,
        actions: [
        IconButton(
        onPressed: () async {
          searchText = await showSearch(
            context: context,
            delegate: ContactSearchView(
              suggestionList: apps.map((e) => e).toList(),
            ),
          );
        },
        icon: const Icon(Icons.search),
        color: Colors.black,
      ),]
      ),
      body: FutureBuilder<List<AppModel>>(
        future: appRepository.fetchAppData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<AppModel>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            List<AppModel> apps = snapshot.data!;
            return apps.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: [
                          ...List.generate(
                            10,
                            (index){
                              AppModel app = apps[index];
                              return Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                color: Colors.yellowAccent,
                                height: 100,
                                child: CachedNetworkImage(imageUrl: app.thumbnail,),
                                // child: Image.network(app.thumbnail),
                              );
                            }
                          )
                        ],
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                            autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 1)
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
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
                                  Navigator.pushNamed(
                                      context, RouteNames.appDetailsScreen,
                                      arguments: {"app": app});
                                },
                                title: Text(app.title),
                                subtitle: Text(app.title),
                                trailing: const Icon(Icons.arrow_right_outlined),
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
