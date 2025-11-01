import 'package:flutter/material.dart';
import 'package:news_app/home/category_fragment/category_item.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../model/category.dart';
import '../../providers/app_theme_provider.dart';

typedef OnCategoryItemClick = void Function(Category);

class CategoryFragment extends StatelessWidget {
  OnCategoryItemClick onCategoryItemClick;

  CategoryFragment({super.key, required this.onCategoryItemClick});

  List<Category> categoryList = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    //todo: shared prefrence theme
    categoryList = Category.getCategoriesList(
      themeProvider.appTheme == ThemeMode.dark,
      context,
    );
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.019,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(
              context,
            )!.good_morning_here_is_some_news_for_you,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: height * 0.019),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryItemClick(categoryList[index]);
                  },
                  child: CategoryItem(
                    category: categoryList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.019),
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
