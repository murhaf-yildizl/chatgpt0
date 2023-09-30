import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utilities/custom_widgets/custom_appbar.dart';
import 'chat_gpt.dart';
import 'create_image.dart';
import 'package:chatgpt0/addmob/addmob.dart';

class Home extends StatelessWidget {
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  AdMobService adMobService=AdMobService();

  Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
      createAds();
    return Scaffold(
      body: Center(
        child: Container(
           child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            CustomAppBar(title: "OpenAI"),
            Image.asset("assets/images/openai_logo.png",height: 200,width: 200,),
            InkWell(
              onTap: (){
                showInterstitialA(1);

                Future.delayed(Duration(seconds: 1)).then((value) {
                  print(interstitialAd);
                });
                Get.to(ChatGPT());
              },
              child: Container(
                height: 75,
                width:300,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green,
                      spreadRadius: 2,
                      blurRadius: 1
                    )
                  ]

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text('64'.tr,style: TextStyle(fontSize:18,color: Colors.deepPurple,fontWeight: FontWeight.bold)),
                   SizedBox(width: 20,),
                    Icon(Icons.chat,size: 30,color: Colors.purple,)
                ],),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                showInterstitialA(2);
                Get.to(ImageCretor());
              },
              child: Container(
                height: 75,
                width: 300,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.shade200,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green,
                          spreadRadius: 2,
                          blurRadius: 1
                      )
                    ]

                ),

                child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                  Text('65'.tr,style: TextStyle(fontSize:18,color: Colors.deepPurple,fontWeight: FontWeight.bold ),),
                    SizedBox(width: 20,),
                    Icon(Icons.image,size: 30,color: Colors.purple)
                ],),
              ),
            ),

          ])
        ),
      ),
      bottomNavigationBar: Container(
            width: double.infinity,
            height: 100,
            child:bannerAd==null?Text(''): AdWidget(ad: bannerAd!),

      )
    );
  }

  void showInterstitialA(int num) {
    interstitialAd=adMobService.createinterstitialAd(num);

  }

  void createAds()async {
    bannerAd= adMobService.createBannerAd();

  }




}
