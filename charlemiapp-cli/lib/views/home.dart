import 'package:charlemiapp_cli/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:charlemiapp_cli/views/widgets/appbar_noback.dart';
import 'package:charlemiapp_cli/views/browser/browser_page.dart';
import 'package:charlemiapp_cli/views/user/SignInUp_page.dart';
import 'package:charlemiapp_cli/views/shop/overview_page.dart';

const midDarkColor = Color(0xFF1c2031);
const darkColor = Color(0xFF121421);
const buttonBlueColor = Color(0xFF4a80ef);
const whiteColor = Color(0xFFFFFFFF);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    BrowserPage(),
    Overview(),
    SignInUp()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarNoBack(),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(AppCustomIcons.compass, size: 30,),
              label: '',
              tooltip: 'Discover',
            ),
            BottomNavigationBarItem(
                icon: Icon(AppCustomIcons.shopping_basket, size: 30,), label: '', tooltip: 'Order'),
            BottomNavigationBarItem(
                icon: Icon(AppCustomIcons.user_circle, size: 30,),
                label: '',
                tooltip: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: buttonBlueColor,
          onTap: _onItemTapped,
          backgroundColor: midDarkColor,
        ),
      ),
    );
  }
}