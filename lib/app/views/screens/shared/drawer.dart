import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:elmawkef_inc/app/controllers/home_page.dart';
import 'package:elmawkef_inc/app/router/routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key, this.screen}) : super(key: key);
  final screen;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          FutureBuilder<String?>(
            future: controller.getUserName(),
            builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return DrawerHeader(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: widget.screen.width * 0.25,
                        height: widget.screen.height * 0.15,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color:
                          Theme.of(widget.screen.context).colorScheme.primary),
                );
              }
              if (snapshot.hasData) {
                return UserAccountsDrawerHeader(
                  accountName: Text("${snapshot.data}"),
                  accountEmail: FutureBuilder<String?>(
                      future: controller.getPhoneNumber(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String?> snapshot) {
                        if (snapshot.connectionState == ConnectionState.none) {
                          return Text("06-XX-XXX-XX");
                        }
                        if (snapshot.hasData) {
                          Text("${snapshot.data}");
                        }
                        return Text("06-XX-XXX-XX");
                      }),
                  currentAccountPicture: TextAvatar(
                      shape: Shape.Circular,
                      size: 35,
                      textColor: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      upperCase: true,
                      backgroundColor: Colors.black,
                      numberLetters: 2,
                      text: "${snapshot.data}"),
                );
              }
              return DrawerHeader(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: widget.screen.width * 0.25,
                      height: widget.screen.height * 0.15,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Theme.of(widget.screen.context).colorScheme.primary),
              );
            },
          ),
          TextButton(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'.tr),
            ),
            onPressed: () {
              Get.toNamed(AppRoutes.profile);
            },
          ),
          TextButton(
            child: ListTile(
              leading: Icon(Icons.post_add),
              title: Text('Services '.tr),
            ),
            onPressed: () {},
          ),
          TextButton(
            child: ListTile(
              leading: Icon(Icons.share),
              title: Text('Tell a Friend'.tr),
            ),
            onPressed: () async {
              final Uri launchUri = Uri(
                scheme: "https",
                path: "elmawkef.com",
              );
              await launchUrl(launchUri);
            },
          ),
          TextButton(
            child: ListTile(
              leading: Icon(Icons.stars),
              title: Text('Rate US'.tr),
            ),
            onPressed: () {
              Get.toNamed(AppRoutes.review);
            },
          ),
          TextButton(
            child: ListTile(
              leading: Icon(Icons.mail_rounded),
              title: Text('ContactUs'.tr),
            ),
            onPressed: () {
              Get.toNamed(AppRoutes.contactUs);
            },
          ),
          TextButton(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'.tr),
            ),
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              await preferences.clear();
              Get.offAllNamed(AppRoutes.signup);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              height: 1,
              thickness: 2,
              indent: 16,
              endIndent: 24,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CupertinoSlidingSegmentedControl(
              children: {
                0: Text("Light".tr),
                1: Text("Dark".tr),
              },
              groupValue: Get.isDarkMode ? 1 : 0,
              onValueChanged: (value) {
                Get.changeThemeMode(
                    value == 0 ? ThemeMode.light : ThemeMode.dark);
              },
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CupertinoSlidingSegmentedControl(
              children: {
                0: Text("En"),
                1: Text("Ar"),
                2: Text("Fr"),
              },
              groupValue: Get.locale == Locale('en', 'US')
                  ? 0
                  : Get.locale == Locale('fr', 'FR')
                      ? 2
                      : 1,
              onValueChanged: (value) {
                Get.updateLocale(value == 0
                    ? Locale('en', 'US')
                    : value == 2
                        ? Locale('fr', 'FR')
                        : Locale('ar'));
              },
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
