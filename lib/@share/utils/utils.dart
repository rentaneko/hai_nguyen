import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/styles/color.dart';

// ignore: constant_identifier_names
const DESIGN_WIDTH = 1920;
// ignore: constant_identifier_names
const DESIGN_HEIGHT = 1080;

double responsiveWidth(double value) =>
    value != 0 ? (Get.width * value) / DESIGN_WIDTH : Get.width;

double responsiveHeight(double value) =>
    value != 0 ? (Get.height * value) / DESIGN_HEIGHT : Get.height;

double responsiveFont(double value) => (Get.width * value) / DESIGN_WIDTH;

double getHeightDevice() => Get.height;
double getWidthDevice() => Get.width;

double responsivePercent(double value) => getWidthDevice() * value / 100;

goTo({required String screen, dynamic argument}) =>
    Get.toNamed(screen, arguments: argument);

goToAndRemoveAll({required String screen, dynamic argument}) =>
    Get.offAllNamed(screen, arguments: argument);

goBack({dynamic argument}) => Get.back(result: argument);

offTo(String screen) => Get.offAndToNamed(screen);

showSnackBar({String? title, String? content}) =>
    Get.snackbar(title!, content!);

showToast(String content) => EasyLoading.showToast(content);

showLoading([String? content]) => EasyLoading.show(status: content ?? "");

hideLoading() => EasyLoading.dismiss();

getArgument() => Get.arguments;

openPopup(String title, VoidCallback function) => Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: responsiveFont(22),
              color: AppColor.black),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => goBack(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: AppColor.primary),
              ),
            ),
            child: Text(
              'Huỷ bỏ',
              style: TextStyle(
                color: AppColor.black,
                fontFamily: 'Inter',
                fontSize: responsiveFont(16),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: function,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Xác nhận',
                style: TextStyle(
                  color: AppColor.white,
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(16),
                ),
              )),
        ],
      ),
    );
