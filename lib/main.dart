import 'package:chatgpt0/view/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization/change_language.dart';
import 'localization/language_getx.dart';
import 'localization/translation.dart';


late SharedPreferences pref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

   pref = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.put(LanguageController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslate(),
      locale: languageController.language,
      theme:languageController.appTheme,
      routes: {
        "home": (context) => Home(),
        "setting": (context) => ChangeLanguage()
      },
      home: Container(
        color: Colors.white,
        child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 3)),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Lottie.asset("assets/lottie/loader2.json");
            else if (snapshot.connectionState == ConnectionState.done)
              return Home();

            return Text('');
          },
        ),
      ),
    );
  }
}
