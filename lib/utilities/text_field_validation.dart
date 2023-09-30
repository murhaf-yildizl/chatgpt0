import 'package:get/get.dart';

String? validation(String type,String data,int? min,int? max)
{
  if(data.length==0 )
    return "36".tr;

  else  switch(type)
  {
    case "username":
      {
        if(!GetUtils.isUsername(data))
          return "37".tr;

      if(max!=null && min!=null)
           return checkLength(data,type,min,max);
        break;
      }
    case "lastname":
      {
        if(!GetUtils.isUsername(data))
          return "37".tr;

        if(max!=null && min!=null)
          return checkLength(data,type,min,max);
        break;
      }

    case "email":
      {
        if(!GetUtils.isEmail(data))
          return "37".tr;

        if(max!=null && min!=null)
          return checkLength(data,type,min,max);
        break;
      }

    case "phone":
      {
         if(!GetUtils.isPhoneNumber(data))
          return "30".tr;

        if(max!=null && min!=null)
          return checkLength(data,type,min,max);
        break;
      }

    case "number":
      {
        if(!GetUtils.isNumericOnly(data))
          return "37".tr;

        if(max!=null && min!=null)
          return checkLength(data,type,min,max);
        break;
      }

    case "password":
      {
        if(max!=null && min!=null)
          return checkLength(data,type,min,max);
        break;
      }
    default:{return checkLength(data, type, min, max);}
  }

}

String? checkLength(String data,String type, int? min, int? max) {

  if( min!=null)
    if(data.length<min)
    {
      if(type=="password")
        return "38".tr;
  else  return "60".tr;
    }

  if(max!=null)
    if(data.length>max)
    return "$type can't be longer than $max character";

}