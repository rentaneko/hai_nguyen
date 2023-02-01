import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:hai_nguyen/@share/constants/url.constant.dart';
import 'package:hai_nguyen/@share/routes/routes.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late TextEditingController usernameCtrl;
  late TextEditingController passwordCtrl;
  late SharedPreferences _preferences;

  final formKey = GlobalKey<FormState>();

  String? validateUsername() {
    if (usernameCtrl.text.isEmpty) {
      return 'Vui lòng nhập tên tài khoản';
    }
    if (usernameCtrl.text.isNotEmpty && usernameCtrl.text.length < 3) {
      return 'Tài khoản phải có ít nhất 5 kí tự';
    }

    return null;
  }

  String? validatePassword() {
    if (passwordCtrl.text.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (usernameCtrl.text.isNotEmpty && usernameCtrl.text.length < 3) {
      return 'Mật khẩu phải có ít nhất 5 kí tự';
    }

    return null;
  }

  Future<void> login() async {
    showLoading('Đang đăng nhập');

    _preferences = await SharedPreferences.getInstance();
    var url = Uri.parse('$BASE_URL/api/login');
    var res = await http.post(
      url,
      body: {
        "username": usernameCtrl.text.trim(),
        "password": passwordCtrl.text.trim()
      },
    );

    hideLoading();
    if (res.statusCode == 200) {
      if (jsonDecode(res.body)['status'] == 'Success') {
        _preferences.setString(TOKEN, jsonDecode(res.body)['data']);
        goTo(screen: ROUTE_HOME);
      } else {
        showToast('Sai tài khoản hoặc mật khẩu');
      }
    } else {
      showToast('Hệ thống đang lỗi, vui lòng thử lại sau');
    }
  }

  void handleLogin() {
    if (formKey.currentState!.validate()) {
      login();
    } else {
      Get.log('FALSE');
    }
  }

  @override
  void onInit() {
    usernameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    usernameCtrl.clear();
    usernameCtrl.dispose();
    passwordCtrl.clear();
    passwordCtrl.dispose();
    super.onClose();
  }
}
