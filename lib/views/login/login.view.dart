import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/styles/color.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/views/login/login.controller.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: responsiveWidth(140)),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/poster.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: getWidthDevice() / 3.5,
            top: responsiveHeight(200),
            child: Container(
              color: AppColor.loginForm,
              height: responsiveHeight(600),
              width: responsiveWidth(745),
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(140),
                vertical: responsiveHeight(24),
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/delivery.png',
                      height: responsiveHeight(110),
                      width: responsiveWidth(230),
                    ),
                    SizedBox(height: responsiveHeight(32)),
                    TextFormField(
                      controller: controller.usernameCtrl,
                      validator: (_) => controller.validateUsername(),
                      style: TextStyle(
                        color: AppColor.black,
                        fontFamily: 'Inter',
                        fontSize: responsiveFont(32),
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: responsiveHeight(33),
                          horizontal: responsiveWidth(20),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: responsiveHeight(12),
                            horizontal: responsiveWidth(8),
                          ),
                          child: Image.asset('assets/icons/account.png'),
                        ),
                        filled: true,
                        fillColor: AppColor.white,
                        hintText: 'Tên đăng nhập',
                        hintStyle: TextStyle(
                          color: AppColor.black,
                          fontFamily: 'Inter',
                          fontSize: responsiveFont(32),
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(32)),
                    TextFormField(
                      obscureText: true,
                      controller: controller.passwordCtrl,
                      validator: (_) => controller.validatePassword(),
                      style: TextStyle(
                        color: AppColor.black,
                        fontFamily: 'Inter',
                        fontSize: responsiveFont(32),
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: responsiveHeight(33),
                          horizontal: responsiveWidth(20),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: responsiveHeight(12),
                            horizontal: responsiveWidth(8),
                          ),
                          child: Image.asset('assets/icons/lock.png'),
                        ),
                        filled: true,
                        fillColor: AppColor.white,
                        hintText: 'Mật khẩu',
                        hintStyle: TextStyle(
                          color: AppColor.black,
                          fontFamily: 'Inter',
                          fontSize: responsiveFont(32),
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(64)),
                    ElevatedButton(
                      onPressed: () => controller.handleLogin(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.white,
                        minimumSize:
                            Size(double.infinity, responsiveHeight(72)),
                      ),
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: responsiveFont(32),
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
