import 'package:n8_default_project/data/network/api_provider.dart';
import 'package:n8_default_project/models/card_model.dart';
import 'package:n8_default_project/models/universal_response.dart';

class CardRepository{
  final ApiProvider apiProvider;
  CardRepository({required this.apiProvider});

  Future<List<CardModel>> fetchAppData()async{
    UniversalResponse universalResponse =await apiProvider.getAllData();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as List<CardModel>;
    }
    return [];
  }
}