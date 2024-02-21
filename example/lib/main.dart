import 'package:flml_web_sidemenu/flml_web_sidemenu.dart';
import 'package:flutter/material.dart';

import 'screens.dart';

final navKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navKey,
      title: 'Web Sidemenu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: FlmlSideMenu(
          dashBoard: DashBoard(
            heading: "Dashboard",
            navigate: const Center(
              child: Text("DashBoard"),
            ),
          ),
          headingStyle: HeadingStyle(
            selectedHeaderColor: Colors.yellow,
            arrowColor: Colors.blue,
          ),
          items: [
            SideMenu(
              heading: "Heading 1",
              onTap: () {
                ScaffoldMessenger.of(navKey.currentState!.context).showSnackBar(
                    const SnackBar(content: Text("Show snackbar")));
              },
              items: [],
            ),
            SideMenu(
              heading: "Heading 2",
              items: [
                SideMenuItem(
                  name: "H2 Item 1",
                  navigate: const ScreenTwo(),
                ),
              ],
            ),
            SideMenu(
              heading: "Heading 3",
              items: [
                SideMenuItem(
                  name: "H3 Item 1",
                  navigate: const ScreenOne(),
                ),
                SideMenuItem(
                  name: "H3 Item 2",
                  navigate: const ScreenTwo(),
                ),
                SideMenuItem(
                  name: "H3 Item 3",
                  navigate: const ScreenThree(),
                ),
              ],
            ),
            SideMenu(
              heading: "Heading 4",
              items: [
                SideMenuItem(
                  name: "H3 Item 1",
                  navigate: const ScreenOne(),
                ),
                SideMenuItem(
                  name: "H3 Item 2",
                  navigate: const ScreenTwo(),
                ),
                SideMenuItem(
                  name: "H3 Item 3",
                  navigate: const ScreenThree(),
                ),
                SideMenuItem(
                  name: "H3 Item 4",
                  navigate: const ScreenTwo(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
