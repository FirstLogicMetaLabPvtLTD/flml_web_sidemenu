# Web Sidemenu package.

This is a web sidemenu package. It has lot of customizations.

<hr />

## Usage

### 1. Add dependency

Add the `flml_web_sidemenu` package to your `pubspec.yaml` file:

```yaml
dependencies:
  flml_web_sidemenu: ^0.0.1
```

### 2. Import the package

Import the `flml_web_sidemenu` package into your Dart file:

```dart
import 'package:flml_web_sidemenu/flml_web_sidemenu.dart';
```

### Example

```dart
FlmlSideMenu(
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
        );
```
