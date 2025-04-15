/* import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class GoogleFormModal extends StatefulWidget {
  const GoogleFormModal({super.key});

  @override
  State<GoogleFormModal> createState() => _GoogleFormModalState();
}

class _GoogleFormModalState extends State<GoogleFormModal> {
  InAppWebViewController? _webViewController;

  // Replace with your Google Form URL
  final String googleFormUrl = "https://docs.google.com/forms/d/e/1FAIpQLSfG/example/viewform";

  void _showGoogleFormModal(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: Column(
            children: [
              // Close button
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri(googleFormUrl),
                  ),
                  initialSettings: InAppWebViewSettings(
                    javaScriptEnabled: true,
                  ),
                  onWebViewCreated: (controller) {
                    _webViewController = controller;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Form Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showGoogleFormModal(context),
          child: const Text("Open Google Form"),
        ),
      ),
    );
  }
} */