import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category_details/widgets/source_tab_widget.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(),
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
              Text("something went wrong", style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium,),
              ElevatedButton(onPressed: () {
                ApiManager.getSources();
                setState(() {

                });
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                  ),
                  child: Text("try again", style: Theme
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
                ApiManager.getSources();
                setState(() {

                });
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                  ),
                  child: Text("try again", style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium,)),
            ],
          );
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return SourceTabWidget(sourcesList: sourcesList);
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