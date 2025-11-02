import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../model/NewsResponse.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  String? name;
  String? url;

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final news = ModalRoute.of(context)?.settings.arguments as News?;
    url = news?.url;
    name = news?.sources?.name;
    if (url != null && url!.isNotEmpty) {
      if (!url!.startsWith('http://') && !url!.startsWith('https://')) {
        url = 'https://$url';
      }

      controller.loadRequest(Uri.parse(url!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name ?? 'WebView',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
