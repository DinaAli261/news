import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:news_app/utils/app_text_styles.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var timeNow = DateTime.now();
    var publishTime = DateTime.parse(news.publishedAt ?? '');
    var minutesAgoTime = timeNow.difference(publishTime).inMinutes;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        showModalBottomSheet(context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .splashColor,
                  borderRadius: BorderRadiusGeometry.circular(16)
              ),

              margin: EdgeInsets.only(
                  top: height * 0.1,
                  bottom: height * 0.019,
                  left: width * 0.04,
                  right: width * 0.04
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.009
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: news.urlToImage ?? '',
                      placeholder: (context, url) =>
                          Center(
                            child: CircularProgressIndicator(
                                color: AppColors.grey),
                          ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(height: height * 0.009,),
                  Text(news.description ?? "", style: Theme
                      .of(context)
                      .textTheme
                      .labelSmall,),
                  SizedBox(height: height * 0.009,),
                  ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.webViewRouteName,
                        arguments: news
                    );
                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme
                              .of(context)
                              .primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8)
                          )
                      ),
                      child: Text("View Full Article", style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge,))

                ],
              ),
            );
          },);
      },
      child: Container(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.009,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(16),
          border: Border.all(color: Theme
              .of(context)
              .splashColor, width: 2),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) =>
                    Center(
                      child: CircularProgressIndicator(color: AppColors.grey),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: height * 0.004),
            Text(news.title ?? '', style: Theme
                .of(context)
                .textTheme
                .labelLarge),
            SizedBox(height: height * 0.004),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "By: ${news.author ?? ''}",
                    style: AppTextStyles.grey12Medium,
                  ),
                ),
                SizedBox(height: height * 0.004),
                Text(
                  '$minutesAgoTime Minutes ago',
                  style: AppTextStyles.grey12Medium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
