import 'package:flutter/material.dart';
import 'package:project_alpha_app/src/screens/sections/home_section.dart';
import 'package:project_alpha_app/src/screens/sections/profile_section.dart';
import 'package:project_alpha_app/src/screens/sections/search_section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, @required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        pageSnapping: true,
        controller: _pageController,
        children: <Widget>[
          ProfileSection(),
          SearchSection(),
          HomeSection(
            title: "Nepali Gurus",
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.purple,
          )
        ],
        onPageChanged: (index) {
          this.setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        fixedColor: Colors.purple,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          this.setState(() {
            _selectedIndex = index;
          });

          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.idBadge),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 10.0),
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.searchengin),
              title: Text(
                "Search",
                style: TextStyle(fontSize: 10.0),
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 10.0),
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cubes),
              title: Text(
                "Best Courses",
                style: TextStyle(fontSize: 10.0),
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.award),
              title: Text(
                "Achievement",
                style: TextStyle(fontSize: 10.0),
              ))
        ],
      ),
    );
  }
}
