import 'package:elmawkef_inc/app/router/pages.dart';
import 'package:elmawkef_inc/app/translations/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'router/routers.dart';
import 'themes/dark/v1/dark.dart';
import 'themes/light/v1/light.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', 'US'),
        Locale('fr', 'FR'),
        Locale('ar')
      ],
      translations: AppTranslations(),
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      locale: Locale('fr', 'FR'),
      //Get.deviceLocale,
      fallbackLocale: const Locale('fr', 'FR'),
      getPages: Pages.route,
    );
  }
}
