import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interview_dimytect/component/auth/login_controller.dart';
import 'package:interview_dimytect/component/beranda/beranda_controller.dart';
import 'package:interview_dimytect/utils/utility.dart';
import 'package:interview_dimytect/widget/button.dart';
import 'package:interview_dimytect/widget/card_custom.dart';
import 'package:interview_dimytect/widget/main_scaffold.dart';
import 'package:interview_dimytect/widget/text_form_field_group.dart';
import 'package:interview_dimytect/widget/text_label.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  var controller = Get.put(berandaController());

  @override
  void initState() {
    controller.startLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      type: "default",
      returnOnWillpop: false,
      content: Obx(
        () => Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Utility.medium,
              ),
              Center(
                child: TextLabel(
                  text: "Beranda",
                  size: Utility.large,
                  weigh: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Utility.medium,
              ),
              InkWell(
                onTap: () => controller.sortData(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextLabel(text: "Sort"),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Iconsax.sort5),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Utility.medium,
              ),
              controller.dataMenu.isEmpty && controller.statusLoad.value
                  ? Flexible(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Utility.primaryDefault,
                            ),
                            SizedBox(
                              height: Utility.verySmall,
                            ),
                            TextLabel(
                              text: "Sedang Memuat...",
                              weigh: FontWeight.bold,
                            )
                          ],
                        ),
                      ),
                    )
                  : controller.dataMenu.isEmpty && !controller.statusLoad.value
                      ? Flexible(
                          child: Center(
                            child: TextLabel(
                              text: "Data tidak tersedia",
                              weigh: FontWeight.bold,
                            ),
                          ),
                        )
                      : listData()
            ],
          ),
        ),
      ),
    );
  }

  Widget listData() {
    return Flexible(
        child: ListView.builder(
            itemCount: controller.dataMenu.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var id = controller.dataMenu[index]["id"];
              var title = controller.dataMenu[index]["title"];
              var image = controller.dataMenu[index]["image"];
              var description = controller.dataMenu[index]["description"];
              var ingredients = controller.dataMenu[index]["ingredients"];
              var active = controller.dataMenu[index]["active"];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: TextLabel(text: "$id"),
                  ),
                  CardCustom(
                    colorBg: Utility.baseColor2,
                    radiusBorder: Utility.borderStyle1,
                    widgetCardCustom: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 30,
                            child: Center(
                              child: Image.network(
                                image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 70,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextLabel(text: "$title"),
                                  SizedBox(
                                    height: Utility.medium,
                                  ),
                                  !active
                                      ? TextLabel(
                                          text: description.length > 100
                                              ? description.substring(0, 100) +
                                                  '...'
                                              : description)
                                      : TextLabel(text: description),
                                  SizedBox(
                                    height: Utility.verySmall,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: !active
                                        ? InkWell(
                                            onTap: () {
                                              setState(() {
                                                controller.dataMenu[index]
                                                        ["active"] =
                                                    !controller.dataMenu[index]
                                                        ["active"];
                                              });
                                            },
                                            child: TextLabel(
                                              text: "See more...",
                                              weigh: FontWeight.bold,
                                              color: Colors.blue,
                                              align: TextAlign.right,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              setState(() {
                                                controller.dataMenu[index]
                                                        ["active"] =
                                                    !controller.dataMenu[index]
                                                        ["active"];
                                              });
                                            },
                                            child: Icon(
                                              Iconsax.arrow_up_2,
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height: Utility.medium,
                                  ),
                                  ingredients.length != 0
                                      ? SizedBox(
                                          height: 50,
                                          child: ListView.builder(
                                              itemCount: ingredients.length,
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder:
                                                  (context, rowButton) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 3.0,
                                                          right: 3.0),
                                                  child: Button1(
                                                    textBtn:
                                                        "${ingredients[rowButton]}",
                                                    colorBtn:
                                                        Utility.primaryDefault,
                                                    colorText:
                                                        Utility.baseColor2,
                                                  ),
                                                );
                                              }),
                                        )
                                      : SizedBox()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Utility.medium,
                  )
                ],
              );
            }));
  }
}
