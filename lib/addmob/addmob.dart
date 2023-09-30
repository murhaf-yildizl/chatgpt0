import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService{
  bool _testmode=true;
  String _banner1_AD="ca-app-pub-3563035693975858/8586648677";
                     //"ca-app-pub-3940256099942544/6300978111" test

  String _interstitial_AD1="ca-app-pub-3563035693975858/5171391116";
  String _interstitial_AD2="ca-app-pub-3563035693975858/8038572507";

  //"ca-app-pub-3940256099942544/1033173712"  test
  final BannerAdListener bannerAdListener=  BannerAdListener(

    onAdLoaded: (ad)=>ad,
    onAdFailedToLoad: (ad,error){
      ad.dispose();
      debugPrint("AD failed to load$error");
    },
  );

   String?  getBannerId()
  {
    if(Platform.isAndroid)
      {
        return this._banner1_AD;
      }
  }


    createBannerAd()
  {
       return BannerAd(
          size: AdSize.fullBanner,
          adUnitId: _banner1_AD,
          listener: bannerAdListener,
          request: const AdRequest())..load();
  }

    createinterstitialAd(int num)
    {

      InterstitialAd.load(
     adUnitId:num==1? _interstitial_AD1:num==2?_interstitial_AD2:_interstitial_AD1,
     request: AdRequest(),
     adLoadCallback: InterstitialAdLoadCallback(
       onAdLoaded: (InterstitialAd ad) {
         if(ad!=null)
          ad.show();
       },
       onAdFailedToLoad: (LoadAdError error) {
         print('Interstitial ad failed to load: $error');
       },
     ),
      );
  }

}