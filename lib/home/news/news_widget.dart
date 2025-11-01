import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_provider.dart';

class NewsWidget extends StatefulWidget {
  final Sources source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNewsBySourceId(
        widget.source.id ?? '',
        languageProvider.appLanguage,
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
                "something went wrong",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getNewsBySourceId(
                    widget.source.id ?? "",
                    languageProvider.appLanguage,
                  );
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.grey,
                ),
                child: Text(
                  "try again",
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
                  );
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.grey,
                ),
                child: Text(
                  "try again",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.separated(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.019,
            horizontal: width * 0.04,
          ),
          separatorBuilder: (context, index) =>
              SizedBox(height: height * 0.019),
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}
