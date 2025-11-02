import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';

class ErrorSearch extends StatefulWidget {
  final VoidCallback onClose;

  const ErrorSearch({super.key, required this.onClose});

  @override
  State<ErrorSearch> createState() => _ErrorSearchState();
}

class _ErrorSearchState extends State<ErrorSearch> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: height * 0.019,
            vertical: width * 0.04,
          ),
          backgroundColor: Theme.of(context).splashColor,
        ),
        onPressed: widget.onClose,
        child: Text(
          AppLocalizations.of(context)!.please_select_news_category,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
