import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../repository/api_repositry.dart';

class UserDetailsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    hitEndpointForGetUserData();
  }

  @override
  void onClose() {
    // TODO: implement onClose
  }

  hitEndpointForGetUserData() async {
    try {
      var data = await ApiRepository().userDetailsRepository();
    } catch (e) {
      if (kDebugMode) {
        print("hitEndpointForGetUserData>>>>>>>${e.toString()}");
      }
    }
  }
}
