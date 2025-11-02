import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_text_styles.dart';

class AppConfigItem extends StatelessWidget {
  String text;

  AppConfigItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
        left: width * 0.04,
        right: width * 0.04,
        top: height * 0.009,
        bottom: height * 0.019,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.019,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(16),
        border: Border.all(color: AppColors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppTextStyles.white20Medium),
          Icon(Icons.arrow_drop_down, color: AppColors.white, size: 30),
        ],
      ),
    );
  }
}
