import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utilities/themes.dart';

class LanguageController extends GetxController{
  Locale? _language;
  SharedPreferences? pref;
  late ThemeData appTheme=arabicTheme;

  changeLanguage(String lang)async
  {
    pref=await SharedPreferences.getInstance();
    pref!.setString("language",lang);

    appTheme=lang=='ar'?arabicTheme:englishTheme;
    Get.changeTheme(appTheme);

    Locale locale=Locale(lang);
    Get.updateLocale(locale);

  }

  @override
  void onInit()async {

    pref=await SharedPreferences.getInstance();
    String? lang=pref!.getString('language');

     if(lang=='ar')
      {
       _language=Locale('ar','EG');
       appTheme=arabicTheme;
      }
 else if(lang=='en')
   {
     _language=Locale('en','US');
     appTheme=englishTheme;

   }
 else {
      _language=Locale(Get.deviceLocale!.languageCode);
      appTheme=arabicTheme;
    }

    Get.updateLocale(_language!);
     super.onInit();

  }

  Locale? get language => _language;
}