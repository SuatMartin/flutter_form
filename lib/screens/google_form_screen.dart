import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleFormScreen extends StatelessWidget {
  const GoogleFormScreen({super.key});

  final String formUrl = "https://docs.google.com/forms/d/e/1FAIpQLSdphGElD2QqblDC40rKouxK18JijHNhTx7xd8tik3Dt5mzHJw/viewform?usp=header";

  Future<void> _launchForm() async {
    if (!await launchUrl(Uri.parse(formUrl), mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $formUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Form")),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchForm,
          child: const Text("Open Google Form"),
        ),
      ),
    );
  }
}