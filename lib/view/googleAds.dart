import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  static BannerAd? _bannerAd;

  static BannerAd? get bannerAd => _bannerAd;

  static BannerAd createBannerAd() {
    return BannerAd(
      adUnitId:"ca-app-pub-3940256099942544/6300978111" ,
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => print('Ad loaded.'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          print('Ad failed to load: $error');
        },
        onAdOpened: (Ad ad) => print('Ad opened.'),
        onAdClosed: (Ad ad) => print('Ad closed.'),
      ), request: AdRequest(),
    );
  }

  static void loadBannerAd() {
    _bannerAd ??= createBannerAd()..load();

  }

  static void dispose() {
    _bannerAd?.dispose();
   }
}