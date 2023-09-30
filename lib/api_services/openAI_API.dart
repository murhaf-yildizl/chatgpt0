import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class OpenAIApi{
  static String image_base_url="https://api.openai.com/v1/images/generations";
  static String model = 'gpt-3.5-turbo';
  static String chatting_url="https://api.openai.com/v1/chat/completions";
  static String apiKey="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";

  static final Map<String,String> header={
    "Content-Type":"application/json",
    "Authorization":"Bearer $apiKey"
  };

  static Map<String,dynamic> body={};


 static Future generateImage(String prompt)async
  {
    String? toEnglish=await translate(prompt);
    print(toEnglish);

    body={
        "prompt":toEnglish??prompt,
        "n":1,
        "size":"256x256"
      };
      try {
        var result = await http.post(
            Uri.parse(image_base_url), headers: header, body: jsonEncode(body));

        if (result.statusCode == 200) {
          var data = jsonDecode(result.body.toString());

           if(data['data'][0]['url']!=null)
            return {'status':"success",'url':data['data'][0]['url'].toString()};
       else return{'status':"failed",'error':"server error"};

        }
        else {
          print("EEEEEEEEEERRRRRRRRRRRROOOOORR ${result.statusCode}  ${result.body}");
          return{'status':"failed",'error':"server error"};
        }
      }

      catch(e){
        print("QQQQQQQQQQQ  ${e.toString()}");
        return{'status':"failed",'error':e.toString()};

      }
  }


  static chatModel(String prompt)  async {

     body={
      //'prompt': prompt,
      "messages": [

      {
        "role": "user",
        "content": prompt
      }
      ],
      'model':model,
      'max_tokens': 2000, // Adjust based on your needs
      'temperature': 0.7, // Adjust based on your needs
      //'stop': '\n', // Stop the response at the first newline
    };
    try {
      var result = await http.post(
          Uri.parse(chatting_url), headers: header, body: jsonEncode(body));

      if (result.statusCode == 200) {
        var data = jsonDecode(utf8.decode(result.bodyBytes));
        print(data);
        if(data['choices'][0]['message']['content']!=null)
          return {'status':"success",'response':data['choices'][0]['message']['content'].toString()};
        else return{'status':"failed",'error':"server error"};

      }
      else {
        print("EEEEEEEEEERRRRRRRRRRRROOOOORR ${result.statusCode}  ${result.body}");
        return{'status':"failed",'error':"server error"};
      }
    }

    catch(e){
      print("QQQQQQQQQQQ  ${e.toString()}");
      return{'status':"failed",'error':e.toString()};

    }
  }


static Future<String?> translate(String input)async
{
 final translator=GoogleTranslator();
 return await translator.translate(input,to:'en').then((value){
    if(value!=null)
      return value.text;
 });
}

}
