import 'package:dart_tiktok/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.size10,
              horizontal: Sizes.size20,
            ),
            child: Text(
              "New",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
                color: Colors.black38,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: Sizes.size52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.bell,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  title: RichText(
                    text: const TextSpan(
                      text: "Account updates:",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size16,
                      ),
                      children: [
                        TextSpan(
                            text: " Upload longer",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            )),
                        TextSpan(
                            text: " 1h",
                            style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.normal,
                            )),
                      ],
                    ),
                  ),
                  trailing: const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: Sizes.size16,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
