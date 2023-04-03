import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_dimytect/utils/api.dart';
import 'package:interview_dimytect/utils/toast.dart';

class berandaController extends GetxController {
  var dataMenu = [].obs;

  var statusLoad = false.obs;
  var urutkan = false.obs;

  void startLoad() {
    getDataApi();
  }

  void getDataApi() async {
    statusLoad.value = true;
    statusLoad.refresh();
    var connect = Api.connectionApi("get", "", "coffee/hot");
    var getValue = await connect;
    var valueBody = jsonDecode(getValue.body);
    if (valueBody.isNotEmpty) {
      List tampung = [];
      for (var element in valueBody) {
        var data = {
          "id": element["id"],
          "title": element["title"],
          "description": element["description"],
          "ingredients": element["ingredients"],
          "image": element["image"],
          "active": false,
        };
        tampung.add(data);
      }
      tampung.sort((a, b) => b["id"].compareTo(a["id"]));
      dataMenu.value = tampung;
      dataMenu.refresh();
    }
    statusLoad.value = false;
    statusLoad.refresh();
  }

  void sortData() {
    if (!urutkan.value) {
      dataMenu.sort((a, b) => a["id"].compareTo(b["id"]));
      urutkan.value = true;
      urutkan.refresh();
    } else {
      dataMenu.sort((a, b) => b["id"].compareTo(a["id"]));
      urutkan.value = false;
      urutkan.refresh();
    }
  }
}
