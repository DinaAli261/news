import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/shared_preferences_helper.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var selectedLanguage = languageProvider.appLanguage;

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
              languageProvider.changeLanguage("en");
              selectedLanguage = "en";
              saveLastLang("en");
            },
            child: getEnglishItemWidget(selectedLanguage),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage("ar");
              selectedLanguage = "ar";
              saveLastLang("ar");
            },
            child: getArabicItemWidget(selectedLanguage),
          ),
        ],
      ),
    );
  }

  Widget getEnglishItemWidget(String selectedLanguage) {
    if (selectedLanguage == 'en') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.english,
            style: AppTextStyles.black24Bold,
          ),
          Icon(Icons.check, color: AppColors.black),
        ],
      );
    } else {
      return Text(
        AppLocalizations.of(context)!.english,
        style: AppTextStyles.black24Bold,
      );
    }
  }

  Widget getArabicItemWidget(String selectedLanguage) {
    if (selectedLanguage == 'ar') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.arabic,
            style: AppTextStyles.black24Bold,
          ),
          Icon(Icons.check, color: AppColors.black),
        ],
      );
    } else {
      return Text(
        AppLocalizations.of(context)!.arabic,
        style: AppTextStyles.black24Bold,
      );
    }
  }
}
