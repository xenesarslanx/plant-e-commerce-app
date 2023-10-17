import 'package:plant/utils/dbHelper.dart';

class UserModel {
  String? email, password;
  UserModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    return {
      DBHelper.columnUserEmail: email ?? "",
      DBHelper.columnUserPassword: password ?? "",
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map[DBHelper.columnUserEmail],
      password: map[DBHelper.columnUserPassword],
    );
  }
}
