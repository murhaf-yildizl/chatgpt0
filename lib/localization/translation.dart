//import 'package:get/get.dart';

import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:get/get.dart';

class MyTranslate extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en':{
      '1':'choose language:',
      '2':'Home Page',
      '3':'english',
      '4':'arabic',
      '5':"save",
      '6':"settings",
      '7':"signIn",
      '8':"signOut",
      '9':"create new account",
      '10':"language setting",
      '11':"add a new note",
      '12':"edit note",
      '13':"error",
      '14':"my notes",
      '15':"email",
      '16':"password",
      '17':"user name",
      '18':"Or",
      '19':"camera",
      '20':"gallery",
      '21':"please select a file",
      '22':"do you want to delete this note?",
      '23':"yes",
      '24':"cancel",
      '25':"confirm",
      '26':"no notes found!",
      '27':"add title...",
      '28':"add the content...",
      '29':"phone number",
      '30':"phone number is not valid!",
      '31':"verification code is not valid",
      '32':"please enter the verifaication code that has sent to your phone number...",
      '33':"your account has been created successfuly",
      '34':"edit",
      '35':"delete",
      '36':"this feild can't be empty",
      '37':"enterd value is not valid",
      '38':"password must be 8 characters at least",
      '39':"the note has been deleted successfuly",
      '40':"the changes has been saved successfuly",
      '41':"the note has been saved successfuly",
      '42':"the user is already exist",
      '43':"signUp",
      '44':"forget your password?",
      '45':"enter your phoneNumber",
      '46':"send",
      '47':" phone number verification",
      '48':"reset password",
      '49':"enter a new password:",
      '50':"confirm your password",
      '51':"enterd password is not match!",
      '52':"this phone number is not regested",
      '53':"enterd code is wrong",
      '54':"you are not logged in yet",
      '55':"your password has changed successfuly",
      '56':"type your question here... ",
      '57':"search word",
      '58':"generate your images with chat gpt",
      '59':"3D render of a tropical fish in an aquarium on a dark blue background.",
      '60':"prompt text must be 3 character at least",
      '61':"no file found for sharing",
      '62':"your image has been downloaded succsessfuly",
      '63':"failed to shre image",
      '64':"chat with GPT",
      '65':"Images Creator ",
      '66':"failed to request, please try again",
      '67':"you have exceeded the number of attempts allowed "

    },

    'ar':
    {
      '1':"اختر اللغة",
      '2':"الصفحة الرئيسية",
      '3':'الإنجليزية',
      "4":"العربية",
      '5':"حفظ",
      '6':"الإعدادات",
      '7':"تسجيل الدخول",
      '8':"تسجيل الخروج",
      '9':"إنشاء حساب جديد",
      '10':"إعدادات اللغة",
      '11':" إضافة ملاحظة جديدة",
      '12':"تعديل الملاحظة",
      '13':"حدث خطأ",
      '14':"ملاحظاتي",
      '15':"الإيميل",
      '16':"كلمة السرّ",
      '17':"الاسم",
      '18':"أو",
      '19':"الكاميرا",
      '20':"الأستديو",
      '21':"لم تقم بتحميل الصورة",
      '22':"هل تريد حذف هذه الملاحظة؟",
      '23':"نعم",
      '24':"إلغاء الأمر",
      '25':"تأكيد",
      '26':"لا يوجد ملاحظات بعد",
      '27':"أضف العنوان...",
      '28':"أضف المحتوى...",
      '29':"رقم الهاتف",
      '30':"رقم الهاتف غير صالح",
      '31':"كود التفعيل غير صالح",
      '32':"رجاءً قم بإدخال الكود الذي تم إرساله إلى رقم هاتفك",
      '33':"تم إنشاء الحساب بنجاح",
      '34':"تعديل",
      '35':"حذف",
      '36':" هذا الحقل لا يمكن أن يكون فارغاً",
      '37':"القيمة المدخلة ليست صالحة ",
      '38':"كلمة السر يجب أن تتكون من 8 رموز على الأقل",
      '39':"تم حذف الملاحظة بنجاح",
      '40':"تم حفظ التغييرات بنجاح",
      '41':"تم إنشاء الملاحظة بنجاح",
      '42':"هذا المستخدم موجود بالفعل",
      '43':"إنشاء الحساب",
      '44':"نسيت كلمة السرّ؟",
      '45':"أدخل رقم هاتفك",
      '46':"إرسال",
      '47':"تأكيد رقم الهاتف",
      '48':"إعادة تعيين كلمة السرّ",
      '49':"أدخل كلمة السر الجديدة",
      '50':"قم بتأكيد كلمة السرّ",
      '51':"كلمة السر غير متطابقة بين الحقلين",
      '52':"لم يتم العثور على رقم الهاتف",
      '53':"الكود الذي أدخلته غير صحيح",
      '54':"لم تقم بتسجيل الدخول بعد",
      '55':"تم تغيير كلمة السرّ بنجاح",
      '56':"أكتب سؤالك هنا...",
      '57':"كلمة البحث",
      '58':"صمم صورك باستخدام الذكاء الاصطناعي",
      '59':"عرض ثلاثي الأبعاد لسمكة استوائية في حوض مائي على خلفية زرقاء داكنة.",
      '60':"يجب أن يتكون النص من 3 محارف على الأقل",
      '61':"لا يوجد ملف للمشاركة بعد",
      '62':"تم حفظ الصورة بنجاح",
      '63':"فشل مشاركة الصورة",
      '64':"التحدث مع الذكاء الاصطناعي",
      '65':"إنشاء الصور",
      '66':"فشل الطلب,الرجاء المحاولة مرة أخرى ",
      '67':"لقد تجاوزت عدد المحاولات المتاحة لك"


    }
  };

}