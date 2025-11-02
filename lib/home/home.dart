import 'package:flutter/material.dart';
import 'package:news_app/home/category_details/category_details.dart';
import 'package:news_app/home/category_fragment/category_fragment.dart';
import 'package:news_app/home/drawer/home_drawer.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/search/error.dart';
import 'package:news_app/search/search.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../model/category.dart';
import '../providers/app_language_provider.dart';

class Home extends StatefulWidget {
  static bool isSearch = false;

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    return Scaffold(
      appBar: (!Home.isSearch)
          ? AppBar(
        title: (selectedCategory == null)
            ? Text(AppLocalizations.of(context)!.home,
            style: Theme
                .of(context)
                .textTheme
                .headlineLarge)
            : Text(selectedCategory!.title,
            style: Theme
                .of(context)
                .textTheme
                .headlineLarge),
        actions: [
          IconButton(
            onPressed: () {
              Home.isSearch = true;
              setState(() {});
            },
            icon: Icon(Icons.search),
          ),
        ],
      )
          : null,
      drawer: Drawer(
        backgroundColor: AppColors.black,
        child: HomeDrawer(onDrawerItemClick: onDrawerItemClick),
      ),
      body: (!Home.isSearch)
          ? (selectedCategory == null)
          ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
          : CategoryDetails(
        categoryId: selectedCategory!.id,
        language: languageProvider.appLanguage,
      )
          : (selectedCategory == null)
          ? ErrorSearch(onClose: onClose,)
          : Search(
          selectedCategory: selectedCategory, onClose: onClose),
    );
  }

  void onClose() {
    Home.isSearch = false;
    setState(() {});
  }
  void onCategoryItemClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerItemClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
