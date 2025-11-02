import 'package:flutter/material.dart';
import 'package:news_app/home/category_details/category_details.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../model/category.dart';
import '../providers/app_language_provider.dart';

class Search extends StatefulWidget {
  final Category? selectedCategory;
  final VoidCallback onClose;
  String? searchText;

  Search({
    super.key,
    required this.selectedCategory,
    required this.onClose,
    this.searchText,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.04,
              right: width * 0.04,
              bottom: height * 0.019,
              top: height * 0.09,
            ),
            child: TextField(
              onChanged: (newText) {
                widget.searchText = newText;
                setState(() {});
              },
              style: Theme.of(context).textTheme.headlineLarge,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Theme.of(context).splashColor),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).splashColor,
                ),
                suffixIcon: InkWell(
                  onTap: widget.onClose,
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).splashColor,
                  ),
                ),
                hintText: AppLocalizations.of(context)!.search,
                hintStyle: Theme.of(context).textTheme.headlineLarge,
                enabledBorder: createBorderStyle(),
                focusedBorder: createBorderStyle(),
              ),
            ),
          ),
          Expanded(
            child: CategoryDetails(
              searchText: widget.searchText,
              categoryId: widget.selectedCategory!.id,
              language: languageProvider.appLanguage,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder createBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Theme.of(context).splashColor, width: 1),
    );
  }
}
