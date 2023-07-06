
import 'package:n8_default_project/utils/img.dart';

class ContactModelFields {
  static const String id = "_id";
  static const String name = "name";
  static const String phone = "phone";
  static const String img = "img";

  static const String contactsTable = "my_contacts";
}

class ContactModelSql {
  int? id;
  final String name;
  final String phone;
  final String img;

  ContactModelSql({
    this.id,
    required this.phone,
    required this.name,
    required this.img,
  });

  ContactModelSql copyWith({
    String? name,
    String? phone,
    String? img,
    int? id,
  }) {
    return ContactModelSql(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      img: img ?? this.img,
      id: id ?? this.id,
    );
  }

  factory ContactModelSql.fromJson(Map<String, dynamic> json) {
    return ContactModelSql(
      name: json[ContactModelFields.name] ?? "",
      phone: json[ContactModelFields.phone] ?? "",
      img: json[ContactModelFields.img] ?? AppImages.defaultImg,
      id: json[ContactModelFields.id] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ContactModelFields.name: name,
      ContactModelFields.phone: phone,
      ContactModelFields.img: img,
    };
  }

  @override
  String toString() {
    return '''
      name: $name
      phone: $phone
      img: $img
      id: $id, 
    ''';
  }
}
