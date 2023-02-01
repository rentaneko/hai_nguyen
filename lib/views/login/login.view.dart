import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/views/login/login.controller.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: responsiveWidth(140)),
          child: Column(
            children: [
              Text('Xin chào, mừng bạn quay lại'),
              Text('Tên tài khoản'),
              TextFormField(
                controller: controller.usernameCtrl,
                validator: (_) => controller.validateUsername(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: responsiveHeight(2),
                    horizontal: responsiveWidth(8),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
              Text('Mật khẩu'),
              TextFormField(
                obscureText: true,
                controller: controller.passwordCtrl,
                validator: (_) => controller.validatePassword(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: responsiveHeight(2),
                    horizontal: responsiveWidth(8),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
              ElevatedButton(
                onPressed: () => controller.handleLogin(),
                child: Text('Đăng nhập'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
