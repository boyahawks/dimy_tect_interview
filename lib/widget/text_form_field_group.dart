import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interview_dimytect/utils/utility.dart';
import 'package:interview_dimytect/widget/card_custom.dart';

class TextFieldMain extends StatelessWidget {
  final Color? colorCard;
  final Color? colorTextField;
  final double? heightCard;
  final double? fontSize;
  final double? heightTextField;
  final bool? statusIconLeft;
  final bool? statusCardCustom;
  final bool? keyboardMultiline;
  final Icon? iconLeft;
  final BorderRadius? borderRadius;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function? onTap;
  const TextFieldMain({
    super.key,
    this.colorCard,
    this.heightCard,
    this.iconLeft,
    required this.statusIconLeft,
    this.statusCardCustom,
    this.keyboardMultiline,
    this.borderRadius,
    this.fontSize,
    this.heightTextField,
    this.colorTextField,
    this.keyboardType,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return statusCardCustom == null || statusCardCustom == true
        ? CardCustomForm(
            colorBg: colorCard ?? Utility.baseColor2,
            tinggiCard: heightCard ?? 45.0,
            radiusBorder: borderRadius ?? Utility.borderStyle1,
            widgetCardForm: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                cursorColor: Utility.primaryDefault,
                controller: controller,
                textInputAction: TextInputAction.done,
                keyboardType: keyboardType ?? TextInputType.text,
                decoration: statusIconLeft == false
                    ? const InputDecoration(
                        border: InputBorder.none,
                      )
                    : InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: iconLeft,
                      ),
                style: TextStyle(
                    fontSize: fontSize ?? 14.0,
                    height: heightTextField ?? 1.0,
                    color: colorTextField ?? Colors.black),
              ),
            ),
          )
        : TextField(
            cursorColor: Utility.primaryDefault,
            controller: controller,
            textInputAction: TextInputAction.done,
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: statusIconLeft == false
                ? const InputDecoration(
                    border: InputBorder.none,
                  )
                : InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: iconLeft,
                  ),
            style: TextStyle(
                fontSize: fontSize ?? 14.0,
                height: heightTextField ?? 1.0,
                color: colorTextField ?? Colors.black),
          );
  }
}

class TextFieldPassword extends StatelessWidget {
  final Color? colorCard;
  final Color? colorTextField;
  final double? heightCard;
  final double? fontSize;
  final double? heightTextField;
  final BorderRadius? borderRadius;
  final bool? obscureController;
  final bool? statusCardCustom;
  final TextEditingController? controller;
  final Function? onTap;
  const TextFieldPassword({
    super.key,
    this.colorCard,
    this.heightCard,
    this.borderRadius,
    this.fontSize,
    this.heightTextField,
    this.colorTextField,
    this.statusCardCustom,
    required this.obscureController,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return statusCardCustom == null || statusCardCustom == true
        ? CardCustomForm(
            colorBg: colorCard ?? Utility.baseColor2,
            tinggiCard: heightCard ?? 45.0,
            radiusBorder: borderRadius ?? Utility.borderStyle1,
            widgetCardForm: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                cursorColor: Utility.primaryDefault,
                obscureText: !obscureController!,
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    // prefixIcon: const Icon(
                    //   Iconsax.lock,
                    //   color: Color(0xff001767),
                    // ),
                    suffixIcon: InkWell(
                      onTap: () {
                        if (onTap != null) onTap!();
                      },
                      child: Icon(
                        obscureController! ? Iconsax.eye : Iconsax.eye_slash,
                        color: obscureController!
                            ? Utility.primaryDefault
                            : Utility.nonAktif,
                      ),
                    )

                    // IconButton(
                    //   icon: Icon(
                    //     obscureController! ? Iconsax.eye : Iconsax.eye_slash,
                    //     color: obscureController!
                    //         ? Utility.primaryDefault
                    //         : Utility.nonAktif,
                    //   ),
                    //   onPressed: () {
                    //     if (onTap != null) onTap!();
                    //   },
                    // )
                    ),
                style: TextStyle(
                    fontSize: fontSize ?? 14.0,
                    height: heightTextField ?? 1.0,
                    color: colorTextField ?? Colors.black),
              ),
            ),
          )
        : TextField(
            cursorColor: Utility.primaryDefault,
            obscureText: !obscureController!,
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                // prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: InkWell(
                  onTap: () {
                    if (onTap != null) onTap!();
                  },
                  child: Icon(
                    obscureController! ? Iconsax.eye : Iconsax.eye_slash,
                    size: 20,
                    color: obscureController!
                        ? Utility.primaryDefault
                        : Utility.nonAktif,
                  ),
                )),
            style: TextStyle(
                fontSize: fontSize ?? 14.0,
                height: heightTextField ?? 1.0,
                color: colorTextField ?? Colors.black),
          );
  }
}

class TextFieldDate extends StatelessWidget {
  final tanggal, colorCard, borderRadius, onTap;
  const TextFieldDate({
    super.key,
    this.colorCard,
    this.borderRadius,
    required this.tanggal,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3),
      child: InkWell(
        onTap: () {
          DatePicker.showDatePicker(
            Get.context!,
            showTitleActions: true,
            minTime: DateTime(2000, 1, 1),
            maxTime: DateTime(2100, 1, 1),
            currentTime: DateTime.now(),
            locale: LocaleType.en,
            onConfirm: (date) {
              if (onTap != null) onTap!(date);
            },
          );
        },
        child: CardCustom(
          colorBg: colorCard ?? Utility.baseColor2,
          radiusBorder: borderRadius ?? Utility.borderStyle1,
          widgetCardCustom: Padding(
            padding: EdgeInsets.all(6),
            child: Text('${Utility.convertDate1("${tanggal}")}'),
          ),
        ),
      ),
    );
  }
}
