import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:whatsapp_messenger/common/extensions/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/utils/coloors.dart';
// import 'package:whatsapp_messenger/common/extensions/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/widgets/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL() async {
  Uri _url = Uri.parse('https://faq.whatsapp.com/495856382464992');
  if (await launchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Could not launch $_url';
  }
}

class GroupHomePage extends StatelessWidget {
  const GroupHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/community.png',
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Stay connected with a community',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text:
                        'Communities bring members together in a topic-based groups, make it easy ti get admin announcements. Any community you'
                        're added will apppear here. ',
                  ),
                  TextSpan(
                    text: 'Learn more',
                    style: const TextStyle(color: Coloors.greenDark),
                    recognizer: TapGestureRecognizer()..onTap = _launchURL,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomElevatedButton(
              onPressed: () {},
              text: 'Start your community',
            ),
          ],
        ),
      ),
    );
  }
}
