import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/shared_preferences_helper.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var selectedTheme = themeProvider.appTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
              selectedTheme = ThemeMode.light;
              saveLastTheme("light");
            },
            child: getLightItemWidget(selectedTheme),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
              selectedTheme = ThemeMode.dark;
              saveLastTheme("dark");
            },
            child: getDarkItemWidget(selectedTheme),
          ),
        ],
      ),
    );
  }

  Widget getLightItemWidget(ThemeMode selectedTheme) {
    if (selectedTheme == ThemeMode.light) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.light,
            style: AppTextStyles.black24Bold,
          ),
          Icon(Icons.check, color: AppColors.black),
        ],
      );
    } else {
      return Text(
        AppLocalizations.of(context)!.light,
        style: AppTextStyles.black24Bold,
      );
    }
  }

  Widget getDarkItemWidget(ThemeMode selectedTheme) {
    if (selectedTheme == ThemeMode.dark) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.dark,
            style: AppTextStyles.black24Bold,
          ),
          Icon(Icons.check, color: AppColors.black),
        ],
      );
    } else {
      return Text(
        AppLocalizations.of(context)!.dark,
        style: AppTextStyles.black24Bold,
      );
    }
  }
}
