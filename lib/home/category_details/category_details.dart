import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category_details/widgets/source_tab_widget.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  String language;
  String categoryId;
  String? searchText;

  CategoryDetails(
      {super.key, required this.categoryId, required this.language, this.searchText});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(widget.categoryId, widget.language),
      builder: (context, snapshot) {
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.grey,
            ),
          );
          //error
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                AppLocalizations.of(context)!.something_went_wrong, style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium,),
              ElevatedButton(onPressed: () {
                ApiManager.getSources(widget.categoryId, widget.language);
                setState(() {

                });
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.try_again, style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium,)),
            ],
          );
        }
        if (snapshot.data?.status == "error") {
          return Column(
            children: [
              Text(snapshot.data!.message!, style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium,),
              ElevatedButton(onPressed: () {
                ApiManager.getSources(widget.categoryId, widget.language);
                setState(() {

                });
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.try_again, style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium,)),
            ],
          );
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return SourceTabWidget(
          sourcesList: sourcesList, searchText: widget.searchText,);
      },
    );
  }
}
/*
ListView.builder(
              itemBuilder: (context, index) {
                return Text(sourcesList[index].name??"");
              },
            itemCount: sourcesList.length,
          );
 */