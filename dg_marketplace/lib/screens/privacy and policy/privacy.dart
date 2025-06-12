import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override

  // ChatGPT generated text

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Policy",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy for Disc Golf App",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              Text(
                "At Disc Golf App, your privacy is important to us. This Privacy Policy outlines the types of personal information we collect, how we use it, and your rights regarding your data when using our mobile application ('App'). By using our app, you agree to the collection and use of information in accordance with this policy.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "1. Information We Collect",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We collect the following types of information when you use our App:\n\n"
                "A. Personal Information: User-provided information such as your name, email address, and disc collection details.\n\n"
                "B. Usage Data: Information on how the App is accessed and used, including device type and interaction data.\n\n"
                "C. Device Information: Information about your device, such as device type and operating system.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "2. How We Use Your Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We use the information we collect for the following purposes:\n\n"
                "- Provide and improve the App.\n"
                "- Personalize the user experience.\n"
                "- Analyze usage trends and app performance.\n"
                "- Communicate updates and support.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "3. Sharing Your Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We do not sell, rent, or share your personal information with third parties unless necessary for the following purposes:\n\n"
                "- Service Providers: Trusted third-party services that help operate the App.\n"
                "- Legal Requirements: If required by law or legal requests.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "4. Data Security",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We take reasonable measures to protect your personal information, though we cannot guarantee 100% security.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "5. Your Rights and Choices",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "You have the following rights regarding your personal information:\n\n"
                "- Access and update your information.\n"
                "- Opt-out of communications by adjusting settings or contacting us.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "6. Third-Party Links and Services",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "The App may contain links to third-party websites. We are not responsible for their privacy practices.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "7. Children’s Privacy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "The App is not intended for users under the age of 13. We do not knowingly collect information from children under 13.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "8. Changes to This Privacy Policy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We may update this Privacy Policy from time to time. Changes will be posted on this page.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "9. Contact Us",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "If you have any questions, please contact us at andreasgilbertleite@gmail.com.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
