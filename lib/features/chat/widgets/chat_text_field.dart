import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extensions/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/utils/coloors.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key, required this.receiverId});

  final String receiverId;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  late TextEditingController messageController;
  bool isMessageIconEnabled = false;

  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                controller: messageController,
                maxLines: 4,
                minLines: 1,
                autofocus: true,
                autocorrect: true,
                enableSuggestions: true,
                onChanged: (value) {
                  value.isEmpty
                      ? setState(() =>
                          isMessageIconEnabled = false
                        )
                      : setState(() =>
                          isMessageIconEnabled = true
                        );
                },
                decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(
                    color: context.theme.greyColor,
                  ),
                  filled: true,
                  fillColor: context.theme.chatTextFieldBg,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      style: BorderStyle.none,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Material(
                    color: Colors.transparent,
                    child: CustomIconButton(
                      icon: Icons.emoji_emotions,
                      onTap: () {},
                    ),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIconButton(
                          onTap: () {}, icon: Icons.attach_file_outlined),
                      CustomIconButton(
                          onTap: () {}, icon: Icons.currency_rupee),
                      CustomIconButton(onTap: () {}, icon: Icons.camera_alt),
                    ],
                  ),
                )),
          ),
          const SizedBox(
            width: 5,
          ),
          CustomIconButton(
            onTap: () {},
            icon: isMessageIconEnabled ? Icons.send : Icons.mic,
            iconColor: Colors.white,
            background: Coloors.greenDark,
          ),
        ],
      ),
    );
  }
}
