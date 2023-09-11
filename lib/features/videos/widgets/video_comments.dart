import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressd() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: const Text("22796 comments"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: _onClosePressd,
            icon: const FaIcon(
              FontAwesomeIcons.x,
              size: Sizes.size16,
            ),
          )
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size16,
          vertical: Sizes.size20,
        ),
        itemCount: 10,
        separatorBuilder: (context, index) => Gaps.v20,
        itemBuilder: (context, index) => const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: Sizes.size20,
            ),
            Gaps.h10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "username",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gaps.v3,
                  Text("maksnbfakskj aisnfna aisnfnak  asbasdasd"),
                ],
              ),
            ),
            Gaps.h20,
            Column(
              children: [
                FaIcon(
                  FontAwesomeIcons.heart,
                  size: Sizes.size20,
                  color: Colors.black54,
                ),
                Gaps.v1,
                Text(
                  "52.2k",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.only(
            top: Sizes.size16,
            bottom: Sizes.size32,
            right: Sizes.size16,
            left: Sizes.size16,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: Sizes.size16 + Sizes.size2,
                backgroundColor: Colors.black26,
                child: FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: Colors.white60,
                  size: Sizes.size20,
                ),
              ),
              Gaps.h10,
            ],
          ),
        ),
      ),
    );
  }
}
