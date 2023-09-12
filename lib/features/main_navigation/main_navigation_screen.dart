import 'package:dart_tiktok/constants/sizes.dart';
import 'package:dart_tiktok/features/main_navigation/widget/nav_tab.dart';
import 'package:dart_tiktok/features/main_navigation/widget/post_video_button.dart';
import 'package:dart_tiktok/features/videos/video_timeline_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // final screens = [
  //   const Center(
  //     child: Text(
  //       "Home",
  //       style: TextStyle(fontSize: Sizes.size48),
  //     ),
  //   ),
  //   const Center(
  //     child: Text(
  //       "Search",
  //       style: TextStyle(fontSize: Sizes.size48),
  //     ),
  //   ),
  //   Container(
  //     child: const Center(
  //       child: Text(
  //         "Create",
  //         style: TextStyle(fontSize: Sizes.size48),
  //       ),
  //     ),
  //   ),
  //   const Center(
  //     child: Text(
  //       "Inbox",
  //       style: TextStyle(fontSize: Sizes.size48),
  //     ),
  //   ),
  //   const Center(
  //     child: Text(
  //       "Profile",
  //       style: TextStyle(fontSize: Sizes.size48),
  //     ),
  //   ),
  // ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTab() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
          appBar: AppBar(
            title: const Text("Record video"),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const Center(
              child: Text(
                "Discover",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const Center(
              child: Text(
                "Inbox",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const Center(
              child: Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavigationTap(
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.houseUser,
                isSelected: _selectedIndex == 0,
                label: "Home",
                onTap: () => _onTap(0),
                selectedIndex: _selectedIndex,
              ),
              NavigationTap(
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                isSelected: _selectedIndex == 1,
                label: "Discover",
                onTap: () => _onTap(1),
                selectedIndex: _selectedIndex,
              ),
              Expanded(
                child: GestureDetector(
                  child: VideoNavButton(
                    onTap: _onPostVideoButtonTab,
                    inverted: _selectedIndex != 0,
                  ),
                ),
              ),
              NavigationTap(
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                isSelected: _selectedIndex == 3,
                label: "Inbox",
                onTap: () => _onTap(3),
                selectedIndex: _selectedIndex,
              ),
              NavigationTap(
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                isSelected: _selectedIndex == 4,
                label: "Profile",
                onTap: () => _onTap(4),
                selectedIndex: _selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
    /*
    <ios>
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: "Search",
          ),
        ],
      ),
      tabBuilder: (context, index) => screens[index],
    );
    */
    /*
    return Scaffold(
      body: screens[_selectedIndex],
      /*
      <m3>
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.black26,
        backgroundColor: Colors.brown,
        selectedIndex: _selectedIndex,
        onDestinationSelected: onTap,
        destinations: const [
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.house,
              color: Colors.white,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.white,
            ),
            label: "Search",
          ),
        ],
      ),
      */

      /*
      <m2>
      bottomNavigationBar: BottomNavigationBar(
        // 아이템의 수가 4개 이상인 경우 자동으로 type이 shifting으로 바뀐다.(default는 fixed)
        // 4개 이상인 경우 backgroundColor를 적용하지 않는다면 unselectedItemColor를 지정해 주거나,
        // background를 적용한다면 BottomNavigationBarType.fixed로 설정한뒤 background를 지정해주면 적용된다.
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: onTap,
        selectedItemColor: Theme.of(context).primaryColor,
        // unselectedItemColor: Colors.black45,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.plus),
            label: "Create",
            // tooltip: "What are you?",
            // backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.video),
            label: "Vedio",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: "Profile",
          ),
        ],
      ),
      */
    );
  }
  */

