import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'sidemenu_model.dart';

Widget _currentPage = const SizedBox();
int _selectedHeadingIndex = 0;
String? _selectedSubTabIndex;
bool _expanded = false;

class FlmlSideMenu extends StatefulWidget {
  final DashBoard _dashBoard;
  final List<SideMenu> _items;
  final double? _width;
  final SideMenuStyle? _sideMenuStyle;
  final HeadingStyle? _headingStyle;
  final ItemStyle? _itemStyle;
  final Widget? _headerWidget;
  FlmlSideMenu({
    super.key,
    required List<SideMenu> items,
    required DashBoard dashBoard,
    double? width,
    SideMenuStyle? sideMenuStyle,
    HeadingStyle? headingStyle,
    ItemStyle? itemStyle,
    Widget? headerWidget,
  })  : _items = items,
        _dashBoard = dashBoard,
        _sideMenuStyle = sideMenuStyle ?? SideMenuStyle(),
        _headingStyle = headingStyle ?? HeadingStyle(),
        _itemStyle = itemStyle ?? ItemStyle(),
        _width = width ?? 250,
        _headerWidget = headerWidget;

  @override
  State<FlmlSideMenu> createState() => _FlmlSideMenuState();
}

class _FlmlSideMenuState extends State<FlmlSideMenu> {
  final ScrollController scrollController = ScrollController();

  setFunct() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _currentPage = widget._dashBoard.navigate;
  }

  @override
  void dispose() {
    scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: widget._sideMenuStyle!.backgroundColor,
            width: widget._width,
            height: height,
            child: RawScrollbar(
              thumbColor: widget._sideMenuStyle?.scrollBarColor,
              interactive: true,
              controller: scrollController,
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                }),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget._headerWidget != null) widget._headerWidget!,
                      FlSideMenuItem(
                        index: 0,
                        setFunct: setFunct,
                        headingStyle: widget._headingStyle!,
                        itemStyle: widget._itemStyle!,
                        sideMenuStyle: widget._sideMenuStyle!,
                        sidemenu: SideMenu(
                            heading: widget._dashBoard.heading,
                            items: [],
                            onTap: () {
                              _currentPage = widget._dashBoard.navigate;
                              setState(() {});
                            }),
                      ),
                      ...List.generate(
                          widget._items.length,
                          (index) => FlSideMenuItem(
                                index: index + 1,
                                setFunct: setFunct,
                                headingStyle: widget._headingStyle!,
                                itemStyle: widget._itemStyle!,
                                sideMenuStyle: widget._sideMenuStyle!,
                                sidemenu: widget._items[index],
                              )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {});
              },
              child: _currentPage,
            ),
          )
        ],
      ),
    );
  }
}

class FlSideMenuItem extends StatefulWidget {
  final Function _setFunct;
  final SideMenu _sidemenu;
  final int _index;
  final SideMenuStyle? _sideMenuStyle;
  final HeadingStyle? _headingStyle;
  final ItemStyle? _itemStyle;

  const FlSideMenuItem({
    super.key,
    required Function setFunct,
    required SideMenu sidemenu,
    required int index,
    required SideMenuStyle sideMenuStyle,
    required HeadingStyle headingStyle,
    required ItemStyle itemStyle,
  })  : _index = index,
        _sidemenu = sidemenu,
        _setFunct = setFunct,
        _sideMenuStyle = sideMenuStyle,
        _headingStyle = headingStyle,
        _itemStyle = itemStyle;

  @override
  State<FlSideMenuItem> createState() => _FlSideMenuItemState();
}

class _FlSideMenuItemState extends State<FlSideMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: widget._sideMenuStyle!.dividerColor,
        ),
        Container(
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            border: _selectedHeadingIndex == widget._index
                ? Border(
                    left: BorderSide(
                      color: widget._headingStyle!.selectedHeaderColor,
                      width: 3,
                    ),
                  )
                : null,
          ),
          child: InkWell(
            onTap: () {
              if (_selectedHeadingIndex != widget._index) {
                _expanded = true;
              } else {
                _expanded = !_expanded;
              }
              if (widget._sidemenu.items.isEmpty && (widget._index == 0) ||
                  widget._sidemenu.items.isNotEmpty) {
                _selectedHeadingIndex = widget._index;
              }
              if (_selectedHeadingIndex == 0) {
                _selectedSubTabIndex = null;
              }
              widget._setFunct();
              if (widget._sidemenu.onTap != null) {
                widget._sidemenu.onTap!();
              }
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget._sidemenu.heading,
                      style:
                          TextStyle(color: widget._headingStyle!.headingColor),
                    ),
                  ],
                ),
                if (widget._index != 0 && widget._sidemenu.items.isNotEmpty)
                  Icon(
                    (_selectedHeadingIndex == widget._index && _expanded)
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: widget._headingStyle!.arrowColor,
                  )
              ],
            ),
          ),
        ),
        if (_selectedHeadingIndex == widget._index && _expanded)
          ...List.generate(
            widget._sidemenu.items.length,
            (index) => InkWell(
              onTap: () {
                if (widget._sidemenu.items[index].navigate != null) {
                  _selectedSubTabIndex = "${widget._index}$index";
                  _currentPage = widget._sidemenu.items[index].navigate!;
                  widget._setFunct();
                } else if (widget._sidemenu.items[index].onTap != null) {
                  widget._sidemenu.items[index].onTap!();
                }
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.stop_rounded,
                        color: Colors.white,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        widget._sidemenu.items[index].name,
                        style: TextStyle(
                          color:
                              _selectedSubTabIndex == "${widget._index}$index"
                                  ? widget._itemStyle!.selectedItemTextColor
                                  : widget._itemStyle!.itemTextColor,
                          fontWeight:
                              _selectedSubTabIndex == "${widget._index}$index"
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
