import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_messenger/common/extensions/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/utils/coloors.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_messenger/features/home/pages/calls_home_page.dart';
import 'package:whatsapp_messenger/features/home/pages/chat_home_page.dart';
import 'package:whatsapp_messenger/features/home/pages/group_home_page.dart';
import 'package:whatsapp_messenger/features/home/pages/status_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<void> openCamera(BuildContext context) async {
  final picker = ImagePicker();

  final pickedFile = await picker.pickImage(source: ImageSource.camera);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Opacity(
            opacity: 0.5,
            child: Text(
              'WhatsApp',
              style: TextStyle(
                letterSpacing: 1,
              ),
            ),
          ),
          elevation: 1,
          actions: [
            Row(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: CustomIconButton(
                    onTap: () => openCamera(context),
                    icon: Icons.camera_alt_outlined,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Opacity(
                  opacity: 0.5,
                  child: CustomIconButton(
                    onTap: () {},
                    icon: Icons.search,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Opacity(
                  opacity: 0.5,
                  child: CustomIconButton(
                    onTap: () {},
                    icon: Icons.more_vert_outlined,
                  ),
                ),
              ],
            ),
          ],
          bottom: const TabBar(
            indicatorWeight: 3,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(
                child: Icon(Icons.group),
              ),
              Tab(
                text: 'Chats',
              ),
              Tab(
                text: 'Status',
              ),
              Tab(
                text: 'Calls',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GroupHomePage(),
            ChatHomePage(),
            StatusHomePage(),
            CallsHomePage(),
          ],
        ),
      ),
    );
  }
}
