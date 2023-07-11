import 'package:hive/hive.dart';

class HiveService{
  static late Box cartsBox;

  static openBox()async{
    cartsBox=await Hive.openBox("listCarts");
  }
}