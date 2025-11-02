import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_text_styles.dart';

class DrawerItem extends StatelessWidget {
  String icon;
  String text;

  DrawerItem({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.019, left: width * 0.04),
      child: Row(
        children: [
          ImageIcon(AssetImage(icon), color: AppColors.white),
          SizedBox(width: width * 0.02),
          Text(text, style: AppTextStyles.white20Bold),
        ],
      ),
    );
  }
}
