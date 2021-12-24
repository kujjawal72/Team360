import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:team360/home/components/backgound.dart';
import 'package:team360/home/home.dart';
import 'package:team360/retailer/onboard/onboard_retailer.dart';
import 'package:team360/retailer/retailer_list.dart';
import 'package:team360/splash_screen.dart';
import 'package:team360/task_list/task_calendar.dart';
import 'package:team360/task_list/task_list.dart';
import 'package:team360/touchbase/touchbase_dashboard.dart';
import 'package:team360/util/my_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Team 360",
      color: MyColor.appBackgroundColor,
      home: SplashScreen(),
    );
  }
}
/*initialRoute: "/",
      onGenerateRoute: MainRouteGenerator.generateRoutes,*/

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  String pageTitle = "";

  final nav_screens = [
    const HomeScreen(),
    const RetailerListScreen(),
    const TouchBaseDashboardScreen(),
    const TaskListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(pageTitle),
        backgroundColor: Colors.transparent,
        //MyColor.appBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: _currentIndex == 3
            ? ([
                IconButton(
                    onPressed: () {
                      initializeDateFormatting().then((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => TaskCalendarScreen()),
                        );
                      });
                    },
                    icon: Icon(Icons.calendar_view_month_rounded))
              ])
            : null,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                        backgroundColor: Colors.lightGreenAccent,
                        radius: 40.0,
                        backgroundImage:
                            Image.asset("assets/images/ujjawal.jpg").image),
                  ),
                  const Text(
                    "Ujjawal Dubey",
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 0.3,
              color: Colors.purpleAccent,
            ),
            createDrawerBodyItem(
                icon: Icons.toc, text: "Terms of use", onTap: () {}),
            createDrawerBodyItem(
                icon: Icons.policy, text: "Privacy Policy", onTap: () {}),
            createDrawerBodyItem(
                icon: Icons.location_on, text: "Contact us", onTap: () {}),
            createDrawerBodyItem(
                icon: Icons.logout, text: "Sign out", onTap: () {}),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Align(
                child: Text("Version 1.0.0"),
                alignment: Alignment.center,
              ),
            )
          ],
        ),
      ),
      body: nav_screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        mouseCursor: SystemMouseCursors.grab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_convenience_store_rounded),
              label: "Retailer"),
          BottomNavigationBarItem(
              icon: Icon(Icons.mode_edit), label: "Retailer Onboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list), label: "Task List"),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: MyColor.bottomNavBackgroundColor,
        onTap: (currentIndex) => setState(() {
          switch (currentIndex) {
            case 0:
              pageTitle = "";
              break;
            case 1:
              pageTitle = "Retailer";
              break;
            case 2:
              pageTitle = "Retailer Onboard";
              break;
            case 3:
              pageTitle = "Task List";
              break;
          }
          _currentIndex = currentIndex;
        }),
      ),
    ));
  }
}

Widget createDrawerBodyItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
