import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:apicode/models/footer_item.dart';
import 'package:apicode/utils/constants.dart';
import 'package:apicode/utils/screen_helper.dart';
import 'package:apicode/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<FooterItem> footerItems = [
  FooterItem(
      iconData: Icons.location_on,
      title: "العنوان",
      text1: "مكة",
      text2: "المملكة السعودية العربية",
      onTap: () {
        Utilty.openMyLocation();
      }),
  FooterItem(
      iconData: Icons.phone,
      title: "الهاتف",
      text1: "+966509124056",
      text2: "",
      onTap: () {
        Utilty.openMyPhoneNo();
      }),
  FooterItem(
      iconData: Icons.mail,
      title: "ايميل",
      text1: "baisonzrg@gmail.com",
      text2: "",
      onTap: () {
        Utilty.openMail();
      }),
  FooterItem(
      iconData: Icons.sms,
      title: "واتساب",
      text1: "+966509124056",
      text2: "",
      onTap: () {
        Utilty.openWhatsapp();
      })
];

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: InkWell(
                            onTap: footerItem.onTap,
                            child: SizedBox(
                              width: ScreenHelper.isMobile(context)
                                  ? constraints.maxWidth / 2.0 - 20.0
                                  : constraints.maxWidth / 4.0 - 20.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        footerItem.iconData,
                                        color: kPrimaryColor,
                                        size: 28,
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        footerItem.title,
                                        style: GoogleFonts.josefinSans(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${footerItem.text1}\n",
                                          style: const TextStyle(
                                            color: kCaptionColor,
                                            height: 1.8,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "${footerItem.text2}\n",
                                          style: const TextStyle(
                                            color: kCaptionColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),

                  ),
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}
