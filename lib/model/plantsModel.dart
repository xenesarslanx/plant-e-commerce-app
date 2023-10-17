import 'package:plant/utils/dbHelper.dart';

class Plants {
  String? name, size, description;
  double? price;
  bool? isFav;
  int? id;
  List<String>? imageList;
  Plants(
      {required this.name,
      required this.imageList,
      required this.price,
      required this.isFav,
      required this.size,
      required this.description,
      required this.id});

  // Plants sınıfını JSON formatına dönüştüren toJson metodu
  Map<String, dynamic> toJson() {
    return {
      DBHelper.columnId: id ?? "",
      DBHelper.columnName: name ?? "",
      DBHelper.columnPrice: price ?? "",
      DBHelper.columnimageList: imageList!.join(","),
      DBHelper.columnisFav: isFav == true ? 1 : 0,
      DBHelper.columnSize: size ?? "",
      DBHelper.columnDescription: description ?? "",
    };
  }

  // JSON formatından Plants sınıfını oluşturan fromJson metodu
  factory Plants.fromMap(Map<String, dynamic> map) {
    return Plants(
      id: map[DBHelper.columnId],
      name: map[DBHelper.columnName],
      price: map[DBHelper.columnPrice],
      imageList: map[DBHelper.columnimageList],
      isFav:
          map[DBHelper.columnisFav] == 1, // 1 represents true, otherwise false
      size: map[DBHelper.columnSize],
      description: map[DBHelper.columnDescription],
    );
  }
}
