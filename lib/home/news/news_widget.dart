import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_provider.dart';

//هو في عك كتير هنا  معرفتش اعملها بالسكرول فعلمتها ب BUTTON LOAD MORE
class NewsWidget extends StatefulWidget {
  String? searchText;
  final Sources source;
  int page = 1;

  NewsWidget({super.key, required this.source, this.searchText});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  List<News> allNews = [];
  @override
  Widget build(BuildContext context) {
    bool isSearch = widget.searchText != null;
    if (!isSearch) {
      widget.searchText = '';
    }
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNewsBySourceId(
        widget.source.id ?? '',
        languageProvider.appLanguage,
          widget.page,
          5,
          widget.searchText!
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.grey),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                AppLocalizations.of(context)!.something_went_wrong,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getNewsBySourceId(
                    widget.source.id ?? "",
                    languageProvider.appLanguage,
                    1,
                    4,
                    widget.searchText!,
                  );
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.grey,
                ),
                child: Text(
                  AppLocalizations.of(context)!.try_again,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }

        if (snapshot.data!.status != 'ok') {
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getNewsBySourceId(
                    widget.source.id ?? "",
                    languageProvider.appLanguage,
                      1,
                      4,
                      widget.searchText!
                  );
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.grey,
                ),
                child: Text(
                  AppLocalizations.of(context)!.try_again,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }

        var newArticles = snapshot.data?.articles ?? [];
        for (var news in newArticles) {
          if (!allNews.any((e) => e.title == news.title)) {
            allNews.add(news);
          }
        }
        //عملت سيرش الاول وبعد ما عملت PAGINATION بقي بيعمل سيرش علي اللي اتحمل بس فرجعت عملته بال API

        //var newsList = snapshot.data?.articles ?? [];
        // bool ifSearch = widget.searchText != null;
        //List<News> searchedList = [];
        //if (ifSearch) {
        // searchedList = newsList.where((item) {
        //  return item.title!
        //    .toLowerCase()
        //   .contains(widget.searchText!.toLowerCase());
        //}).toList();
        //}

        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.019,
                    horizontal: width * 0.04,
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: height * 0.019),
                  itemBuilder: (context, index) {
                    return NewsItem(
                        news: allNews[index]);
                    //(ifSearch)
                    //                           ? searchedList[index]
                    //                           : allNews[index]);
                  },
                  itemCount: allNews.length
                //(ifSearch) ? searchedList.length : allNews.length,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.page++;
                  ApiManager.getNewsBySourceId(
                      widget.source.id ?? "",
                      languageProvider.appLanguage,
                      widget.page,
                      5,
                      widget.searchText!
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: height * 0.019,
                      vertical: width * 0.04
                  ),
                  backgroundColor: Theme
                      .of(context)
                      .splashColor
              ),
              child: Text(AppLocalizations.of(context)!.load_more, style: Theme
                  .of(context)
                  .textTheme
                  .labelSmall,),
            )
          ],
        );
      },
    );
  }
}
