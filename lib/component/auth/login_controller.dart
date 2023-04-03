import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_dimytect/component/beranda/beranda_view.dart';
import 'package:interview_dimytect/utils/toast.dart';

class loginController extends GetxController {
  var pin = TextEditingController().obs;

  void validasiLogin() {
    if (pin.value.text == "") {
      UtilsAlert.showToast("Harap isi pin terlebihd dahulu");
    } else if (pin.value.text != "2022") {
      UtilsAlert.showToast("Pin yang anda masukkan salah");
    } else {
      Get.offAll(Beranda());
    }
  }
}
