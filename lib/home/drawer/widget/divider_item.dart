import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Divider(
      color: AppColors.white,
      endIndent: width * 0.04,
      indent: width * 0.04,
      thickness: 1,
    );
  }
}
