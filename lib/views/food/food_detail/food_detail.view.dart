import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/styles/color.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/views/food/food_detail/food_detail.controller.dart';

class FoodDetailPage extends GetWidget<FoodDetailController> {
  const FoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        automaticallyImplyLeading: false,
        title: Text(
          'Chi tiết món ăn',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: responsiveFont(36),
            fontWeight: FontWeight.w700,
            color: AppColor.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(48)),
        child: ListView(
          children: [
            SizedBox(height: responsiveHeight(16)),
            Container(
              height: responsiveHeight(300),
              width: double.infinity,
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: '${controller.food.value.image}',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/No_image_3x4.svg/1200px-No_image_3x4.svg.png'),
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            RichText(
              text: TextSpan(
                text: 'Mã định danh: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: '${controller.food.value.id}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveFont(22),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            RichText(
              text: TextSpan(
                text: 'Tên món ăn: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: '${controller.food.value.name}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveFont(22),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            RichText(
              text: TextSpan(
                text: 'Giá tiền: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: '${controller.food.value.price}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveFont(22),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            RichText(
              text: TextSpan(
                text: 'Mô tả: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: '${controller.food.value.description}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveFont(22),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            RichText(
              text: TextSpan(
                text: 'Combo (Nếu có): ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: controller.food.value.ingredient == ''
                        ? 'Không có'
                        : '${controller.food.value.ingredient}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveFont(22),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                fixedSize: Size(responsiveWidth(280), responsiveHeight(56)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                'Xoá món ăn khỏi nhà hàng',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                  color: AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
