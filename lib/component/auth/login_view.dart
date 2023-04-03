import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interview_dimytect/component/auth/login_controller.dart';
import 'package:interview_dimytect/utils/utility.dart';
import 'package:interview_dimytect/widget/button.dart';
import 'package:interview_dimytect/widget/main_scaffold.dart';
import 'package:interview_dimytect/widget/text_form_field_group.dart';
import 'package:interview_dimytect/widget/text_label.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var controller = Get.put(loginController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      type: "default",
      returnOnWillpop: false,
      content: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 20,
              child: SizedBox(),
            ),
            Expanded(
              flex: 80,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Utility.medium,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextLabel(
                        text: "Login",
                        size: Utility.large,
                        weigh: FontWeight.bold,
                        color: Utility.primaryDefault,
                      ),
                    ),
                    SizedBox(
                      height: Utility.medium,
                    ),
                    TextLabel(text: "Enter Pin"),
                    SizedBox(
                      height: Utility.verySmall,
                    ),
                    TextFieldMain(
                      controller: controller.pin.value,
                      statusIconLeft: false,
                      keyboardType: TextInputType.number,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: Utility.medium,
                    ),
                    Button1(
                      colorBtn: Utility.primaryDefault,
                      colorText: Utility.baseColor2,
                      textBtn: "Login",
                      style: 1,
                      onTap: () => controller.validasiLogin(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
