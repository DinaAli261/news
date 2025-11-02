import 'package:flutter/cupertino.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_images.dart';

class Category {
  String id;
  String title;
  String image;

  Category({required this.id, required this.title, required this.image});

  static List<Category> getCategoriesList(bool isDark, BuildContext context) {
    return [
      Category(
        id: "general",
        title: AppLocalizations.of(context)!.general,
        image: (isDark) ? AppImages.general : AppImages.generalDark,
      ),
      Category(
        id: "business",
        title: AppLocalizations.of(context)!.business,
        image: (isDark) ? AppImages.business : AppImages.businessDark,
      ),
      Category(
        id: "sports",
        title: AppLocalizations.of(context)!.sports,
        image: (isDark) ? AppImages.sport : AppImages.sportDark,
      ),
      Category(
        id: "technology",
        title: AppLocalizations.of(context)!.technology,
        image: (isDark) ? AppImages.technology : AppImages.technologyDark,
      ),
      Category(
        id: "entertainment",
        title: AppLocalizations.of(context)!.entertainment,
        image: (isDark) ? AppImages.entertainment : AppImages.entertainmentDark,
      ),
      Category(
        id: "health",
        title: AppLocalizations.of(context)!.health,
        image: (isDark) ? AppImages.health : AppImages.healthDark,
      ),
      Category(
        id: "science",
        title: AppLocalizations.of(context)!.science,
        image: (isDark) ? AppImages.science : AppImages.scienceDark,
      ),
    ];
  }
}
