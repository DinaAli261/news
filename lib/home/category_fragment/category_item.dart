import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_colors.dart';

import '../../model/category.dart';

late BuildContext contextItem;

class CategoryItem extends StatelessWidget {
  int index;
  final Category category;

  CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    contextItem = context;
    return Stack(
      alignment: (index % 2 == 0)
          ? AlignmentGeometry.centerRight
          : AlignmentGeometry.centerLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(24),
          child: Image.asset(
            category.image,
            fit: BoxFit.fill,
            width: 0.92 * width,
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.04,
              right: width * 0.04,
              top: height * 0.04,
              bottom: height * 0.019,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  width: 0.43 * width,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadiusGeometry.circular(84),
                  ),
                  child: Row(
                    textDirection: (index % 2 == 0)
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: (index % 2 == 0) ? width * 0.04 : width * 0.02,
                          end: (index % 2 == 0) ? width * 0.02 : width * 0.04,
                          top: height * 0.01,
                          bottom: height * 0.01,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.view_all,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      CircleAvatar(
                        radius: width * 0.06,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(
                          (index % 2 == 0)
                              ? Icons.arrow_forward_ios_rounded
                              : Icons.arrow_back_ios_new_rounded,
                          color: Theme.of(context).splashColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
