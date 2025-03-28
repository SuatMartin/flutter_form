import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html; // Required for Web interop

class GoogleFormScreen extends StatefulWidget {
  const GoogleFormScreen({super.key});

  @override
  State<GoogleFormScreen> createState() => _GoogleFormScreenState();
}

class _GoogleFormScreenState extends State<GoogleFormScreen> {
  final String formUrl1 = "https://docs.google.com/forms/d/e/1FAIpQLSeP-LpNc2i4TtByY2VB-3NzDFU0prU3FWJE1ZDwtzhgUmlFuA/viewform?usp=header";
  final String formUrl2 = "https://docs.google.com/forms/d/e/1FAIpQLSdphGElD2QqblDC40rKouxK18JijHNhTx7xd8tik3Dt5mzHJw/viewform?usp=header";

  bool isCaptchaSolved = false; // Initially false

  @override
  void initState() {
    super.initState();

    // Listen for messages from JavaScript
    html.window.onMessage.listen((event) {
      if (event.data is Map && event.data["type"] == "CAPTCHA_SOLVED") {
        setState(() {
          isCaptchaSolved = true;
        });
      }
    });
  }

  Future<void> _launchForm(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo abrir $url');
    }
  }

  void _showCaptchaAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Verificación requerida"),
        content: const Text("Por favor, resuelva el CAPTCHA antes de continuar."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Entendido"),
          ),
        ],
      ),
    );
  }

  void _handleButtonPress(String url) {
    if (isCaptchaSolved) {
      _launchForm(url);
    } else {
      _showCaptchaAlert();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formularios e instrucciones para someter preguntas"),
        backgroundColor: Colors.green, // Green app bar
      ),
      backgroundColor: const Color.fromARGB(255, 8, 63, 107), // Blue background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Instructions
              const Text(
                "Instrucciones:\n Nota: Si ya se ha registrado previamente y tiene su codigo, puede saltar al paso 4\n1. Abrir el primer formulario.\n2. Escriba su correo electronico y someta para registrarse.\n3. Reciba su codigo de registro en su correo electronico\n4. Abra el segundo formulario\n5. Llene el formulario con la informacion de su pregunta\n6. Asegure escribir el codigo de registro de manera correcta y someta el formulario\n7. Espere a recibir su respuesta, contestaremos lo mas pronto posible",
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // CAPTCHA Status
              Text(
                isCaptchaSolved ? "✅ CAPTCHA Resuelto" : "⚠️ Resuelva el CAPTCHA",
                style: TextStyle(
                  fontSize: 18,
                  color: isCaptchaSolved ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Buttons
              ElevatedButton(
                key: const Key("formButton1"),
                onPressed: () => _handleButtonPress(formUrl1),
                child: const Text("Formulario de registro"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                key: const Key("formButton2"),
                onPressed: () => _handleButtonPress(formUrl2),
                child: const Text("Formulario de preguntas"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}