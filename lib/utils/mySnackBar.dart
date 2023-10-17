import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant/constants/const.dart';

snackBar(String title, String message) {
  return Get.snackbar(title, message,
      backgroundColor: Constants().green, icon: const Icon(Icons.error));
}
