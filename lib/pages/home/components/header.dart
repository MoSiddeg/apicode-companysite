import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:apicode/models/header_item.dart';
import 'package:apicode/provider/home.dart';
import 'package:apicode/provider/theme.dart';
import 'package:apicode/utils/constants.dart';
import 'package:apicode/utils/globals.dart';
import 'package:apicode/utils/screen_helper.dart';
import 'package:apicode/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Container(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child:  Container(
            padding: const EdgeInsets.all(5),
            height:MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.35,
            child: const Image(
              image: AssetImage('assets/images/logo1.png'),
            ),
          ),
      ));
    });
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key, required this.themeSwitch}) : super(key: key);
  final Widget themeSwitch;

  static List<NameOnTap> get headerItems => [
        NameOnTap(
          title: "الرئيسية",
          iconData: Icons.home,
          onTap: () {},
        ),
        NameOnTap(
          title: "عنا",
          onTap: () {},
          iconData: Icons.info,
        ),
        NameOnTap(
          title: "خدماتنا",
          onTap: () {},
          iconData: Icons.school,
        ),
        NameOnTap(
          title: "المعرض",
          onTap: () {},
          iconData: Icons.work,
        ),
        NameOnTap(
          title: "تواصل معنا",
          onTap: () {},
          iconData: Icons.contact_mail,
        ),
        NameOnTap(
          title: "Themes",
          onTap: () {
            Utilty.openUrl(AppConstants.mediumUrl);
          },
          iconData: Icons.light_mode_outlined,
          isDarkTheme: true,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Consumer(
        builder: (context, ref, child) {
          return Row(children: [
            ...headerItems
                .map(
                  (item) => item.title == "Themes"
                      ? const Text("")
                      : MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            margin: const EdgeInsets.only(right: 30.0, left:30),
                            child: GestureDetector(
                              onTap: () {
                                item.onTap();
                                HomeProvider _homeProvider =
                                    ref.read(homeProvider);
                                _homeProvider.scrollBasedOnHeader(item);
                              },
                                child: Text(
                                  item.title,
                                  style: TextStyle(
                                    color: item.title == "Sing-up"
                                        ? kPrimaryColor
                                        : null,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                .toList(),
            themeSwitch
          ]);
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key, required this.themeSwitch}) : super(key: key);
  final Widget themeSwitch;

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: buildHeader(context, themeSwitch),
      mobile: buildMobileHeader(context, themeSwitch),
      tablet: buildHeader(context, themeSwitch),
    );
  }

  // mobile header
  Widget buildMobileHeader(BuildContext context ,Widget themeSwitch) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            HeaderRow(
              themeSwitch: themeSwitch,
            ),
            GestureDetector(
              onTap: () {
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(
                Icons.menu,
                size: 28.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader(BuildContext context, Widget themeSwitch) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.isDesktop(context) ? 24 : 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            HeaderRow(
              themeSwitch: themeSwitch,
            ),

        ]),
      )
    );
  }
}