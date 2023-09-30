import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chatgpt0/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';

import '../api_services/openAI_API.dart';
import '../controller/image_controller.dart';
import '../utilities/custom_widgets/custom_appbar.dart';
import '../utilities/custom_widgets/custom_widgets.dart';
import '../utilities/custom_widgets/dialogs.dart';
import '../utilities/custom_widgets/drawer.dart';

class ImageCretor extends StatefulWidget {
  const ImageCretor({Key? key}) : super(key: key);

  @override
  _ImageCretorState createState() => _ImageCretorState();
}

class _ImageCretorState extends State<ImageCretor> {
  TextEditingController _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false, imageLoded = false;
  String prompt = '', url = '';
  ScreenshotController _screenshotController = ScreenshotController();
   String text="";
  int attempts=0;

  //Completer<void> shareCompleter=Completer();
    @override
  void initState() {
    // TODO: implement initState

    setdefault();
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (url == null) setdefault();

    attempts=pref.getInt("attempts")??0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            height: Get.height,
            child: ListView(
              shrinkWrap: true,
              children: [
                CustomAppBar(
                  title: "58".tr,
                ),
                Stack(
                  children: [
                    Card(
                      //color: Colors.black,
                        child: Center(
                          child: Container(
                            height: Get.height * 0.60,
                            margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: !isLoading
                                ? Column(
                              children: [
                                !imageLoded
                                    ? Image.asset(
                                  url,
                                  height: Get.height * 0.50,
                                  width: Get.width,
                                  fit: BoxFit.fill,
                                )
                                    : Screenshot(
                                  controller: _screenshotController,
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        url,
                                        height: Get.height * 0.50,
                                        width: Get.width,
                                        fit: BoxFit.fill,
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Container(
                                           child: Row(
                                            children: [
                                              IconButton(
                                                  icon: Icon(
                                                    Icons.share,
                                                  ),
                                                  onPressed: () async {
                                                    /*  if(!imageLoded) {
                        showDialogBox(context, "13".tr, "61".tr,Icon(Icons.error,color: Colors.red,size: 40,));
                        return;
                      }*/
                                                    try {
                                                      await ImageController
                                                          .shareImage(
                                                          _screenshotController);
                                                    } catch (e) {
                                                      showDialogBox2(
                                                          context,
                                                          "13".tr,
                                                          "63".tr,
                                                          DialogType
                                                              .success);
                                                    }
                                                  }),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.download,
                                                ),
                                                onPressed: () async {
                                                  var res =
                                                  await ImageController
                                                      .downloadImage(
                                                      _screenshotController);
                                                  showDialogBox2(
                                                      context,
                                                      "13".tr,
                                                      "62".tr,
                                                      DialogType
                                                          .success);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                    child: Text(
                                      prompt,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16),
                                    )),
                              ],
                            )
                                : Lottie.asset(
                              "assets/lottie/imageloader.json",
                              height: Get.height * 0.50,
                              width: Get.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                    imageLoded
                        ? Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              color: Colors.black
                            )
                          ]
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.deepPurple,
                                ),
                                onPressed: () async {
                                  /*  if(!imageLoded) {
                    showDialogBox(context, "13".tr, "61".tr,Icon(Icons.error,color: Colors.red,size: 40,));
                    return;
                  }*/
                                  try {
                                    await ImageController.shareImage(
                                        _screenshotController);
                                  } catch (e) {
                                    showDialogBox2(context, "13".tr,
                                        "63".tr, DialogType.success);
                                  }
                                }),
                            IconButton(
                              icon: Icon(
                                Icons.download,
                                color: Colors.deepPurple,
                              ),
                              onPressed: () async {
                                var res =
                                await ImageController.downloadImage(
                                    _screenshotController);
                                showDialogBox2(context, "13".tr, "62".tr,
                                    DialogType.success);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                        : Container(),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        child:   Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Form(
            key: formKey,
            child: CustomTextFeild(
              textEditingController: _controller,
              hint: "56".tr,
              //label: "57".tr,
              iconData: Icons.send,
              min: 3,
              icon_onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();

                if(attempts>2)
                  {
                    showDialogBox2(context,'13'.tr, "67".tr, DialogType.error);
                    return null;
                  }
                if (isLoading) return;

                if (formKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                  final result = await OpenAIApi.generateImage(
                      _controller.text.trim());

                  if (result['status'] == "success" &&
                      result['url'] != null)
                    setState(() {
                      isLoading = false;
                      imageLoded = true;
                      url = result['url'];
                      prompt = _controller.text.trim();
                      attempts++;
                       pref.setInt("attempts",attempts );
                       _controller.text='';
                    });
                  else {
                    setState(() {
                      setdefault();
                      isLoading = false;
                      imageLoded = false;
                    });

                    //showDialogBox(context, "13".tr, result['error'],Icon(Icons.error,color: Colors.red,size: 40,));
                    showDialogBox2(context, "13".tr, result['error'],
                        DialogType.error);
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void setdefault() {
    url = "assets/images/fish.png";
    prompt = "59".tr;
  }
}
