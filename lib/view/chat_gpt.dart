import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../api_services/openAI_API.dart';
import '../utilities/custom_widgets/custom_appbar.dart';
import '../utilities/custom_widgets/custom_widgets.dart';
import '../utilities/custom_widgets/dialogs.dart';
import '../utilities/custom_widgets/drawer.dart';

class ChatGPT extends StatefulWidget {
  const ChatGPT({Key? key}) : super(key: key);

  @override
  _ChatGPTState createState() => _ChatGPTState();
}

class _ChatGPTState extends State<ChatGPT> {
  List<Map<String,String>>answers=[];
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
             child: ListView(
               physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                CustomAppBar(
                  title: "64".tr,
                ),

                answers.length>0?FloatingActionButton(
                  backgroundColor: Colors.purple,
                    child: Icon(Icons.delete,color: Colors.white,size: 35,),
                    onPressed:(){
                      setState(() {
                        answers=[];
                      });
                    }):Text(''),
                Container(
                  height: Get.height*0.60,
                  child: isLoading?Lottie.asset("assets/lottie/dots_loading.json"):
                          ListView.builder(
                            reverse: true,
                              itemCount: answers.length,
                              itemBuilder:(context,index){
                                return Padding(
                                  padding: const EdgeInsets.all(12),
                                  child:drawList(index),
                                );
                              }
                          ),
                ),

               ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        child: Padding(
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

                if (isLoading) return;

                if (formKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                  var result = await OpenAIApi.chatModel(
                      _controller.text.trim());

                  if (result['status'] == "success") {
                    print(result['response']);
                    setState(() {
                      isLoading=false;
                      answers.add({'question':_controller.text.trim(),'reply':result['response']});
                      _controller.text='';

                    });
                  }
                  else
                    setState(() {
                      isLoading=false;

                      showDialogBox2(context, "13".tr, "66".tr, DialogType.error);

                    });

                }
              },
            ),
          ),
        ),
      ),
    );
  }

  drawList(int index) {
    return Column(
       children: [
        Container(
         decoration: BoxDecoration(
           color: Colors.red,
           borderRadius: BorderRadius.circular(20),
         ),
         padding: EdgeInsets.all(15),
          child: Center(
            child: Text(
              answers[answers.length-1-index]['question']!,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold,color: Colors.white),),
          ),
        ),
        SizedBox(height: 10,),
        Card(
          color: Colors.black,
          elevation: 5,
          margin: EdgeInsets.all(6),
          child: Container(
            padding: EdgeInsets.all(20),
            child: SelectableText.rich(

              TextSpan(
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
                children: [
                  TextSpan(text: answers[answers.length-1-index]['reply'],),
                  // Add more TextSpan widgets as needed.
                ],
              ),
            ),
          ),
        ),
       SizedBox(height: 20,),
        Divider(thickness: 2,color: Colors.deepOrange,)
      ],
    );
  }
}

