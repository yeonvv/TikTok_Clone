import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isWriting = false;

  void _onClearTap() {
    _textEditingController.clear();
  }

  void _onBodyTap() {
    FocusScope.of(context).unfocus();
  }

  void _onTabTab() {
    _onBodyTap();
  }

  void _onStartSearch() {
    if (_textEditingController.value.text.isNotEmpty) {
      _isWriting = true;
    } else {
      _isWriting = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      _onStartSearch();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onBodyTap,
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 1,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const FaIcon(FontAwesomeIcons.chevronLeft),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        autocorrect: false,
                        enableSuggestions: false,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Sizes.size8,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search",
                          hintStyle: const TextStyle(
                            color: Colors.black38,
                          ),
                          prefixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.magnifyingGlass,
                                size: Sizes.size16,
                                color: _isWriting
                                    ? Colors.black87
                                    : Colors.black26,
                              ),
                            ],
                          ),
                          suffixIcon: _isWriting
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: _onClearTap,
                                      child: const FaIcon(
                                        FontAwesomeIcons.solidCircleXmark,
                                        size: Sizes.size20,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                )
                              : null,
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.07),
                        ),
                      ),
                    ),
                  ),
                  const FaIcon(FontAwesomeIcons.sliders),
                ],
              ),
            ),
            bottom: TabBar(
              onTap: (value) => _onTabTab(),
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
              isScrollable: true,
              splashFactory: NoSplash.splashFactory,
              indicatorWeight: Sizes.size3,
              unselectedLabelColor: Colors.black45,
              labelColor: Colors.black,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              indicatorColor: Colors.black,
              tabs: [
                for (var tab in tabs) Tab(text: tab),
              ],
            ),
          ),
          body: TabBarView(children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 20,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
                vertical: Sizes.size5,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 9 / 20,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size20,
              ),
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size5),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholderFit: BoxFit.cover,
                        placeholder: "assets/images/solidity.png",
                        image:
                            "https://images.unsplash.com/photo-1675389342851-294e4e582aea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
                      ),
                    ),
                  ),
                  Gaps.v10,
                  const Text(
                    "This is a very long caption for my tiktok thay im upload just now",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v5,
                  const DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: Sizes.size12,
                        ),
                        Gaps.h5,
                        Expanded(
                          child: Text(
                            "My Avartar is going to be very long name",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size16,
                          color: Colors.black54,
                        ),
                        Gaps.h3,
                        Text("2.5M"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(fontSize: Sizes.size32),
                ),
              )
          ]),
        ),
      ),
    );
  }
}
