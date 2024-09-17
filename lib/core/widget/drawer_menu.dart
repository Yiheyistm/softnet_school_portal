import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:softnet_school_portal/core/utils/constants.dart';
import 'package:softnet_school_portal/core/utils/image_icon_name.dart';

class SideMenu extends StatefulWidget {
  final Function(int index) onItemSelected;

  const SideMenu({super.key, required this.onItemSelected});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _selectedIndex = 0;
  @override
  void initState() {
    widget.onItemSelected(_selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
              horizontal: defaultPadding / 2, vertical: defaultPadding)
          .copyWith(top: 0),
      margin: EdgeInsets.only(right: defaultPadding),
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.8),
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(0.4, 0.4),
            ),
          ]),
      child: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(logoUrl, width: 150),
                    ],
                  ),
                ),
              ),
              drawerListTile(
                title: 'Dashboard',
                svgSrc: dashboardIcon,
                onTap: () {
                  widget.onItemSelected(0);
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                index: 0,
              ),
              drawerListTile(
                title: 'Financial Information',
                svgSrc: financialIcon,
                onTap: () {
                  widget.onItemSelected(1);
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                index: 1,
              ),
              drawerListTile(
                title: 'Teachers Information',
                svgSrc: teachersIcon,
                onTap: () {
                  widget.onItemSelected(2);
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                index: 2,
              ),
              drawerListTile(
                title: 'Students Information',
                svgSrc: studentsIcon,
                onTap: () {
                  widget.onItemSelected(3);
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
                index: 3,
              ),
              drawerListTile(
                  title: 'Settings',
                  svgSrc: settingsIcon,
                  onTap: () {
                    widget.onItemSelected(4);
                    setState(() {
                      _selectedIndex = 4;
                    });
                  },
                  index: 4),
              drawerListTile(
                title: 'Notification',
                svgSrc: bellIcon,
                onTap: () {
                  widget.onItemSelected(5);
                  setState(() {
                    _selectedIndex = 5;
                  });
                },
                index: 5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              drawerListTile(
                  title: 'Logout',
                  svgSrc: logoutIcon,
                  onTap: () {
                    widget.onItemSelected(6);
                    setState(() {
                      _selectedIndex = 6;
                    });
                  },
                  index: 6),
            ],
          ),
        ),
      ),
    );
  }

  Padding drawerListTile(
      {required String title,
      required String svgSrc,
      required VoidCallback onTap,
      int index = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: defaultPadding / 4),
      child: Container(
        decoration: BoxDecoration(
          color: _selectedIndex != index
              ? Theme.of(context).shadowColor.withOpacity(.1)
              : null,
          gradient: _selectedIndex == index
              ? LinearGradient(
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).primaryColor
                  ], // Define the gradient colors
                  begin: Alignment.topLeft, // Gradient starting point
                  end: Alignment.bottomRight, // Gradient ending point
                )
              : null,
          borderRadius:
              BorderRadius.circular(15), // Optional: for rounded corners
        ),
        child: ListTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          style: ListTileStyle.drawer,
          selected: _selectedIndex == index,
          leading: SvgPicture.asset(
            svgSrc,
            height: 18,
            width: 18,
            colorFilter: ColorFilter.mode(
                _selectedIndex == index
                    ? Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .color! // Icon color when selected
                    : Theme.of(context).textTheme.bodyMedium!.color!,
                BlendMode.srcIn),
          ),
          title: Text(title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: _selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  overflow: TextOverflow.ellipsis,
                  color: _selectedIndex == index
                      ? Theme.of(context).textTheme.displayLarge!.color!
                      : Theme.of(context).textTheme.bodyMedium!.color)),
          onTap: onTap,
        ),
      ),
    );
  }
}
