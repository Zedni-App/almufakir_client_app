String? emailValidator(String? text) {
  if(text ==null){
    return "الرجاء كتابة عنوان بريدك الإلكتروني";
  }
  final good = RegExp(
          r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(text);
  return good ? null : "تأكد من كتابة البريد بشكل صحيح";
}
String? passValidator(String? text) {
  if(text ==null){
    return "الرجاء كتابة كلمة المرور";
  }
  return text.length>7 ? null : "كلمة المرور قصيرة";
}
String? defaultValidator(String? text) {
  if(text ==null||text.isEmpty){
    return "كلمة المرور هذا الحقل";
  }
  return null;
}