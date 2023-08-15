import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extensions/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/models/user_model.dart';
import 'package:whatsapp_messenger/common/utils/coloors.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.user});

  final UserModel user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool forAndroid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.profilePageBg,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverPersistentDelegate(widget.user),
            pinned: true,
          ),
          // create a long list to make the content scrollable
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    children: [
                      Text(
                        widget.user.username,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.user.phoneNumber,
                        style: TextStyle(
                          fontSize: 20,
                          color: context.theme.greyColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'last seen 2 min ago',
                        style: TextStyle(
                          fontSize: 12,
                          color: context.theme.greyColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconWithText(
                            icon: Icons.phone,
                            text: "Audio",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          iconWithText(icon: Icons.videocam, text: "Video"),
                          const SizedBox(
                            width: 10,
                          ),
                          iconWithText(
                            icon: Icons.currency_rupee_outlined,
                            text: "Pay",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          iconWithText(
                            icon: Icons.search,
                            text: "Search",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 10,
                  thickness: 10,
                ),
                ListTile(
                  title: const Text("Hey there! I am using WhatsApp."),
                  subtitle: Text(
                    "15th August",
                    style: TextStyle(
                      color: context.theme.greyColor,
                    ),
                  ),
                ),
                const Divider(
                  height: 10,
                  thickness: 10,
                ),
                ListTile(
                  title: const Text("Media, links, and docs"),
                  subtitle: Text(
                    "No Media shared",
                    style: TextStyle(
                      color: context.theme.greyColor,
                    ),
                  ),
                  onTap: () {},
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const Divider(
                  height: 10,
                  thickness: 10,
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text("Mute notifications"),
                  trailing: Switch(
                    activeColor: Coloors.greenDark,
                    value: forAndroid,
                    onChanged: (value) => setState(
                      () {
                        forAndroid = value;
                      },
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.music_note),
                  title: const Text("Custom notifications"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text("Media visibility"),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  thickness: 10,
                ),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text(
                    "Encryption",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    "Messages and calls are end-to-end\nencrypted. Tap to verify.",
                    style: TextStyle(
                      color: context.theme.greyColor,
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.speed_outlined),
                  title: const Text("Disappearing messages"),
                  subtitle: Text(
                    "off",
                    style: TextStyle(
                      color: context.theme.greyColor,
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.chat),
                  title: const Text("Chat lock"),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  thickness: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "No groups in common",
                      style: TextStyle(
                        color: context.theme.greyColor,
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: CustomIconButton(
                    icon: Icons.group,
                    onTap: () {},
                    iconColor: Colors.white,
                    background: Coloors.greenDark,
                  ),
                  title: Text("Create group with ${widget.user.username}"),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  thickness: 10,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.block,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Block ${widget.user.username}",
                    style: const TextStyle(color: Colors.red),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.thumb_down_sharp,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Report ${widget.user.username}",
                    style: const TextStyle(color: Colors.red),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  iconWithText({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 30,
            color: Coloors.greenDark,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(color: Coloors.greenDark),
          ),
        ],
      ),
    );
  }
}

class SliverPersistentDelegate extends SliverPersistentHeaderDelegate {
  final UserModel user;
  final double maxHeaderHeight = 180;
  final double minHeaderHeight = kToolbarHeight + 20;
  final double maxImageSize = 130;
  final double minImageSize = 40;

  SliverPersistentDelegate(this.user);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = MediaQuery.of(context).size;
    final percent = shrinkOffset / (maxHeaderHeight - 35);
    final percent2 = shrinkOffset / (maxHeaderHeight);
    final currentImageSize = (maxImageSize * (1 - percent)).clamp(
      minImageSize,
      maxImageSize,
    );
    final currentImagePosition =
        (((size.width / 2) - 65) * (1 - percent)).clamp(
      minImageSize,
      maxImageSize,
    );
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Container(
        color: Theme.of(context)
            .appBarTheme
            .backgroundColor!
            .withOpacity(percent2 * 2 < 1 ? percent2 * 2 : 1),
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).viewPadding.top + 15,
              left: currentImagePosition + 50,
              child: Text(
                user.username,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(percent2),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: MediaQuery.of(context).viewPadding.top + 5,
              child: BackButton(
                color:
                    percent2 > .3 ? Colors.white.withOpacity(percent2) : null,
              ),
            ),
            Positioned(
              right: 0,
              top: MediaQuery.of(context).viewPadding.top + 5,
              child: CustomIconButton(
                icon: Icons.more_vert,
                onTap: () {},
                iconColor: percent2 > .3
                    ? Colors.white.withOpacity(percent2)
                    : Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
            Positioned(
              left: currentImagePosition,
              top: MediaQuery.of(context).viewPadding.top + 5,
              bottom: 0,
              child: Hero(
                tag: 'profile',
                child: Container(
                  width: currentImageSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(user.profileImageUrl),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeaderHeight;

  @override
  double get minExtent => minHeaderHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
