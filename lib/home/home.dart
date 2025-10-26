import 'package:flutter/material.dart';
import 'package:news_app/home/category_details/category_details.dart';
import 'package:news_app/utils/app_text_styles.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home", style: AppTextStyles.black20Medium)),
      body: CategoryDetails(),
    );
  }
}
