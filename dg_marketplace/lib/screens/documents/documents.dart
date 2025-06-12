import 'package:flutter/material.dart';
import 'package:dg_marketplace/screens/privacy and policy/privacy.dart';
import 'package:dg_marketplace/screens/privacy and policy/faq.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Documents', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivacyPolicyPage()));
                  },
                  child: Text('Privacy Policy')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FAQPage()));
                  },
                  child: Text('FAQ'))
            ])));
  }
}
