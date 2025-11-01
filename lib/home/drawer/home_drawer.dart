import 'package:flutter/material.dart';
import 'package:news_app/home/drawer/theme/theme_bottom_sheet.dart';
import 'package:news_app/home/drawer/widget/app_config_item.dart';
import 'package:news_app/home/drawer/widget/divider_item.dart';
import 'package:news_app/home/drawer/widget/drawer_item.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_text_styles.dart';

import '../../utils/app_images.dart';
import 'language/language_bottom_sheet.dart';

class HomeDrawer extends StatefulWidget {
  VoidCallback onDrawerItemClick;

  HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: height * 0.19,
          alignment: AlignmentGeometry.center,
          color: AppColors.white,
          child: Text(
            AppLocalizations.of(context)!.news_app,
            style: AppTextStyles.black24Bold,
          ),
        ),
        InkWell(
          onTap: () {
            widget.onDrawerItemClick();
          },
          child: DrawerItem(
            text: AppLocalizations.of(context)!.go_to_home,
            icon: AppImages.homeIcon,
          ),
        ),
        SizedBox(height: height * 0.028),
        DividerItem(),
        DrawerItem(
          text: AppLocalizations.of(context)!.theme,
          icon: AppImages.themeIcon,
        ),
        InkWell(
          onTap: () => showThemeBottomSheet(),
          child: AppConfigItem(text: AppLocalizations.of(context)!.light),
        ),
        DividerItem(),
        DrawerItem(
          text: AppLocalizations.of(context)!.language,
          icon: AppImages.languageIcon,
        ),
        InkWell(
          onTap: () => showLanguageBottomSheet(),
          child: AppConfigItem(text: AppLocalizations.of(context)!.english),
        ),
      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
