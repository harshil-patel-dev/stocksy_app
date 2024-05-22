import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_trading_app/responsive.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'dart:html' as html;
import 'dart:js' as js;

void main() {
  WebViewPlatform.instance = WebWebViewPlatform();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stoxxy'),
      ),
      body: WebSmoothScroll(
        controller: _scrollController,
        scrollOffset: 200,
        animationDuration: 500,
        child: ResponsiveLayout(
          mobile: _body(),
          desktop: _body(),
          tablet: _body(),
        ),
      ),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          const Text(
            'Stocks list',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
              onPressed: () async {
                print('Clicked');
                final url =
                    'https://www.w3schools.com'; // Replace with your desired URL
                final completer = Completer<String>();

                js.context.callMethod('openWindow', [
                  url,
                  js.allowInterop((data) => completer.complete(data)),
                ]);

                final message = await completer.future;
                if (message == 'windowClosed') {
                  print('Window closed'); // Handle window closed scenario
                } else {
                  print('URL changed to: $message'); // Handle URL changes
                }

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => WebviewPage()));
              },
              child: const Text(
                'Navigate to Webview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) => Container(
              alignment: Alignment.center,
              height: 200,
              decoration: BoxDecoration(
                  color: _getColor(), borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(child: Text('${index + 1}')),
                  const SizedBox(width: 20),
                  Text('Item ${index + 1}',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ),
            itemCount: 50,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          )
        ],
      ),
    );
  }

  MaterialColor _getColor() {
    if (ResponsiveLayout.isDesktop(context)) {
      return Colors.cyan;
    } else if (ResponsiveLayout.isTablet(context)) {
      return Colors.teal;
    } else {
      return Colors.deepPurple;
    }
  }
}

class WebviewPage extends StatelessWidget {
  WebviewPage({super.key});

  final PlatformWebViewController _controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse('https://www.google.co.in/'),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Webview'),
      ),
      body: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(controller: _controller),
      ).build(context),
    );
  }
}
