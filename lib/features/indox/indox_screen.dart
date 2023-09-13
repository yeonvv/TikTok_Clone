import 'package:dart_tiktok/constants/sizes.dart';
import 'package:dart_tiktok/features/indox/activity_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  void _onActivityTab(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ActivityScreen(),
      ),
    );
  }

  void _onDmPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.01,
        title: const Text("Inbox"),
        actions: [
          IconButton(
            onPressed: _onDmPressed,
            icon: const FaIcon(
              FontAwesomeIcons.paperPlane,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(Sizes.size52),
          child: Column(
            children: [
              const Divider(
                height: Sizes.size16,
                color: Colors.black12,
              ),
              ListTile(
                onTap: () => _onActivityTab(context),
                title: const Text(
                  "Activity",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: Sizes.size16,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.size10,
              horizontal: Sizes.size20,
            ),
            child: Text(
              "Messages",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width: Sizes.size52,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.users,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      title: const Text(
                        "New Followers",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: const Text(
                        "Messages from followers will appear here",
                      ),
                      trailing: const FaIcon(
                        FontAwesomeIcons.chevronRight,
                        size: Sizes.size16,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.black38,
                      endIndent: 0,
                      indent: Sizes.size80,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
