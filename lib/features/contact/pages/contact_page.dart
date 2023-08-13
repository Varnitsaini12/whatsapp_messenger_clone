import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        actions: [
          Row(
            children: [
              CustomIconButton(
                onTap: () {},
                icon: Icons.search,
                iconColor: Colors.white,
              ),
              CustomIconButton(
                onTap: () {},
                icon: Icons.more_vert,
                iconColor: Colors.white,
              ),
            ],
          ),
        ],
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contact',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              '5 contacts',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
