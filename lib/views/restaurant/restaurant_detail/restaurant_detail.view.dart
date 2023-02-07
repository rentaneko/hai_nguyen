import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_nguyen/@share/styles/color.dart';
import 'package:hai_nguyen/@share/utils/utils.dart';
import 'package:hai_nguyen/views/restaurant/restaurant_detail/restaurant_detail.controller.dart';

class RestaurantDetail extends GetWidget<RestaurantDetailController> {
  const RestaurantDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        automaticallyImplyLeading: false,
        title: Text(
          'Chi tiết nhà hàng',
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
                imageUrl: '${controller.restaurant.value.image}',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/No_image_3x4.svg/1200px-No_image_3x4.svg.png'),
              ),
            ),
            SizedBox(height: responsiveHeight(16)),
            RichText(
              text: TextSpan(
                text: 'Tên nhà hàng: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: '${controller.restaurant.value.name}',
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
                text: 'Phân loại: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: '${controller.restaurant.value.type}',
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
                text: 'Địa chỉ nhà hàng: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveFont(22),
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: '${controller.restaurant.value.location}',
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
            Text(
              'Hashtag: ',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: responsiveFont(22),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: responsiveHeight(8)),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisExtent: 40,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: controller.restaurant.value.tags!.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.primary),
                  ),
                  child: Text(controller.restaurant.value.tags![index]),
                );
              },
            ),
            SizedBox(height: responsiveHeight(16)),
            Text(
              'Danh mục: ',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: responsiveFont(22),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: responsiveHeight(8)),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisExtent: 40,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: controller.restaurant.value.categories!.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.primary),
                  ),
                  child: Text(controller.restaurant.value.categories![index]),
                );
              },
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
                'Xoá nhà hàng',
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
