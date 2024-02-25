import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AptitudeTest extends StatefulWidget {
  const AptitudeTest({super.key});

  @override
  State<AptitudeTest> createState() => __AptitudeTestState();
}

class __AptitudeTestState extends State<AptitudeTest> {
  final WebViewController _controller = WebViewController();
  String pageTitle = '_';
  double progress = 0;

  @override
  void initState() {
    super.initState();
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          setState(() {
            progress = progress;
          });
        },
        onPageStarted: (url) {
          setState(() {
            pageTitle = 'Loading...';
          });
        },
        onPageFinished: (url) {
          setState(() {
            pageTitle = url;
            progress = 0;
          });
        },
      ))
      ..loadRequest(Uri.parse(
          'https://docs.google.com/forms/d/e/1FAIpQLSd0gtz9dmvZyG7i_Sdm7e8EFeTVBrqHkoCyrwRsLyWDoGslug/viewform?usp=sf_link'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: _controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () async {
                      if (await _controller.canGoBack()) {
                        _controller.goBack();
                      }
                    },
                    icon: const Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: () {
                      _controller.reload();
                    },
                    icon: const Icon(Icons.replay_outlined)),
                IconButton(
                    onPressed: () {
                      _controller.clearCache();
                    },
                    icon: const Icon(Icons.delete)),
                IconButton(
                    onPressed: () async {
                      if (await _controller.canGoForward()) {
                        _controller.goForward();
                      }
                    },
                    icon: const Icon(Icons.arrow_forward)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
