// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DashBoard {
  /// Sidemenu heading name
  String heading;

  /// Enter widget which show as the first screen
  Widget navigate;
  DashBoard({
    required this.heading,
    required this.navigate,
  });
}

class SideMenu {
  /// Sidemenu heading name
  String heading;

  /// Sidemenu items
  List<SideMenuItem> items;

  /// Function trigger when heading clicked
  VoidCallback? onTap;
  SideMenu({
    required this.heading,
    required this.items,
    this.onTap,
  });
}

class SideMenuItem {
  /// Sidemenu item name
  String name;

  /// If navigate is not null then onTap will not work
  Widget? navigate;

  /// If navigate is not null then onTap will not work
  VoidCallback? onTap;
  SideMenuItem({
    required this.name,
    this.navigate,
    this.onTap,
  });
}

class SideMenuStyle {
  final Color? scrollBarColor;
  final Color dividerColor;
  final Color backgroundColor;
  SideMenuStyle({
    this.scrollBarColor,
    Color? dividerColor,
    Color? backgroundColor,
  })  : backgroundColor = backgroundColor ?? const Color(0xff333333),
        dividerColor = dividerColor ?? Colors.blueGrey.shade800;
}

class HeadingStyle {
  Color selectedHeaderColor;
  Color headingColor;
  Color arrowColor;
  HeadingStyle({
    Color? selectedHeaderColor,
    Color? headingColor,
    Color? arrowColor,
  })  : arrowColor = arrowColor ?? Colors.white,
        headingColor = headingColor ?? Colors.white,
        selectedHeaderColor = selectedHeaderColor ?? const Color(0xfff82649);
}

class ItemStyle {
  Color selectedItemTextColor;
  Color itemTextColor;
  ItemStyle({
    Color? selectedItemTextColor,
    Color? itemTextColor,
  })  : itemTextColor = itemTextColor ?? Colors.grey,
        selectedItemTextColor = selectedItemTextColor ?? Colors.blue.shade300;
}
