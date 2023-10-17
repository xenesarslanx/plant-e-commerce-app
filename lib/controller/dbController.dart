import 'package:plant/model/plantsModel.dart';
import 'package:plant/model/userModel.dart';
import 'package:plant/utils/dbHelper.dart';

class DBController {
  DBHelper dbHelper = DBHelper();

  List<UserModel> usersList = [];

  List<Plants> plants = [];
  List<Plants> plantsByName = [];

  void insert(String name, int id, double price, List<String> imageList,
      bool isFav, String size, String description) async {
    Map<String, dynamic> row = {
      DBHelper.columnName: name,
      DBHelper.columnId: id,
      DBHelper.columnPrice: price,
      DBHelper.columnimageList: imageList,
      DBHelper.columnisFav: isFav,
      DBHelper.columnSize: size,
      DBHelper.columnDescription: description,
    };
    Plants plants = Plants.fromMap(row);

    final idNo = await dbHelper.insertData(plants);
    print("inserted row id: $idNo");
  }

  void insertUser(String email, String password) async {
    //user insert
    Map<String, dynamic> row = {
      DBHelper.columnUserEmail: email,
      DBHelper.columnUserPassword: password,
    };
    UserModel users = UserModel.fromMap(row);

    final idNo = await dbHelper.insertDataUser(users);
    print("inserted row id: $idNo");
  }

  Future<List<Plants>> queryAll() async {
    final allRows = await dbHelper.queryAllData();
    plants.clear();
    for (var element in allRows) {
      Plants plant = Plants(
        id: element['id'],
        name: element['name'],
        size: element['size'],
        description: element['description'],
        price: element['price'].toDouble(),
        isFav: element['isFav'] == 1 ? true : false,
        imageList: List<String>.from(element['imageList'].split(',')),
      );

      plants.add(plant);
      print("query done");
    }
    return plants;
  }

  Future<List<UserModel>> queryAllUser() async {
    final allRows = await dbHelper.queryAllData();
    usersList.clear();
    for (var element in allRows) {
      UserModel users = UserModel(
        email: element['email'],
        password: element['password'],
      );

      usersList.add(users);
      print("query done");
    }
    return usersList;
  }

  /*void query(name) async{
    final allRows = await dbHelper.queryData(name);
    carsByName.clear();
    for (var element in allRows) {
      carsByName.add(Car.fromMap(element));
    }}*/

  /*  void update(int id, String name, int miles) async{
    Car car = Car(id: id,name: name,miles: miles);
    final rowsAffected = await dbHelper.updateData(car);
    print("updated: $rowsAffected");
   }
*/
  void delete(int id) async {
    final rowsDelete = await dbHelper.deleteData(id);
    print("deleted $id, $rowsDelete");
  }
}
