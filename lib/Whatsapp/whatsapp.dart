import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsApp extends StatefulWidget {
  const WhatsApp({super.key});

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child : ElevatedButton(
      onPressed: () async => await launch(
        //  "https://wa.me/${919109817180}?text=Hello piyush , i am from golden eagle"
       ""
         ),
      child: Text('Open Whatsapp'),
),

    );
  }
}