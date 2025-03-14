import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleFormScreen extends StatelessWidget {
  const GoogleFormScreen({super.key});

  final String formUrl1 = "https://docs.google.com/forms/d/1UJ3UpgCzG7i0S4iC_Fvj4xVgTWGGXMoZhxzxCJSHp48/edit";
  final String formUrl2 = "https://docs.google.com/forms/d/1S8JokSmb-svI5s6eUcsLoMnOQJKOqT6ws0ipNx0DIZM/edit";

  Future<void> _launchForm(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo abrir $url');
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
        child: Center( // Center the entire column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column content
            crossAxisAlignment: CrossAxisAlignment.center, // Center the column content
            children: [
              // Instructions Section
              const Text(
                "Instrucciones:\n Nota: Si ya se ha registrado previamente y tiene su codigo, puede saltar al paso 4\n1. Abrir el primer formulario.\n2. Escriba su correo electronico y someta para registrarse.\n3. Reciba su codigo de registro en su correo electronico\n4. Abra el segundo formulario\n5. Llene el formulario con la informacion de su pregunta\n6. Asegure escribir el codigo de registro de manera correcta y someta el formulario\n7. Espere a recibir su respuesta, contestaremos lo mas pronto posible",
                style: TextStyle(fontSize: 16, color: Colors.white), // White text for contrast
                textAlign: TextAlign.center, // Center the text
              ),
              const SizedBox(height: 20),

              // Buttons Section
              ElevatedButton(
                onPressed: () => _launchForm(formUrl1),
                child: const Text("Formulario de registro"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _launchForm(formUrl2),
                child: const Text("Formulario de preguntas"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}