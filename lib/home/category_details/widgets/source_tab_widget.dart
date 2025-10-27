import 'package:flutter/material.dart';
import 'package:news_app/home/category_details/widgets/source_name.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  final List<Sources> sourcesList;

  SourceTabWidget({super.key, required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Theme.of(context).splashColor,
            dividerColor: AppColors.transparent,
            tabAlignment: TabAlignment.start,
            tabs: widget.sourcesList.map((source) {
              return SourceName(
                isSelected: selectedIndex == widget.sourcesList.indexOf(source),
                source: source,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
