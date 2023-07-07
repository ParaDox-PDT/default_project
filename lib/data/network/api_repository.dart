import 'package:n8_default_project/data/network/api_provider.dart';
import 'package:n8_default_project/models/app_model.dart';
import 'package:n8_default_project/models/universal_response.dart';

class AppRepository{
  final ApiProvider apiProvider;
  AppRepository({required this.apiProvider});

  Future<List<AppModel>> fetchAppData()async{
    UniversalResponse universalResponse =await apiProvider.getAllData();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as List<AppModel>;
    }
    return [];
  }
}