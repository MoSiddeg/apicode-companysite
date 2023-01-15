import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:apicode/provider/theme.dart';
import 'package:apicode/routes/routes.dart';
import 'classes/language_constants.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyAppmain()));
}

class MyAppmain extends StatefulWidget {
  const MyAppmain({Key? key}) : super(key: key);

  @override
  State<MyAppmain> createState() => _MyAppmainState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppmainState? state = context.findAncestorStateOfType<_MyAppmainState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppmainState extends State<MyAppmain> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Consumer(
      builder: (context, ref, _) {
        return ThemeProvider(
          initTheme: ref.watch(themeProvider).isDarkMode
              ? MyThemes.darkTheme
              : MyThemes.lightTheme,
          child: MaterialApp(
            title: "APiCode",
            locale: _locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            themeMode: ref.watch(themeProvider).themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            initialRoute: Routes.initial,
            onGenerateRoute: RouterGenerator.generateRoute,
          ),
        );
      },
    );
  }
}
