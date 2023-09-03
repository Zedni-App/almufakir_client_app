class OnBoardingContent {
  String title;
  String discription;
  String imageUrl;

  OnBoardingContent({
    required this.title,
    required this.discription,
    required this.imageUrl,
  });
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
    title: 'أهلاً بك في عالم النوادي',
    discription: " يسرنا انضمامك "
        "ابدأ رحلتك في عالمك الخاص"
        " واستمتع بالخدمات المتوفرة ",
    imageUrl: "assets/images/intro1.jpg",
  ),
  OnBoardingContent(
    title: ' اختيار النادي',
    discription: " تستطيع تصفح النوادي المتوفرة في منطقتك بسهولة "
        "كل ماعليك اختيار النادي المناسب لك، ومن ثم انطلق "
        "في رحلتك الممتعة ",
    imageUrl: "assets/images/intro2.jpg",
  ),
  OnBoardingContent(
    title: 'اختيار المدرب',
    discription: " بعد اختيار النادي، ستختار أيضاً المدرب الخاص بك إن أحببت، "
        "بحيث سترى معلومات عن المدرب وبطولاته وتفاصيل عنه ",
    imageUrl: "assets/images/intro3.jpg",
  ),
  OnBoardingContent(
    title: 'برنامج تدريب',
    discription: "اختر برنامج التدريب المتناسب مع أوقاتك"
        " بكل أريحية",
    imageUrl: "assets/images/intro4.jpg",
  ),
  OnBoardingContent(
    title: 'حالة النادي',
    discription: "تم إضافة تفقد حالة النادي بسبب المعاناة التي تحصل"
        " عندما تدخل النادي وترى الإزدحام، فمن خلال التطبيق تستطيع معرفة "
        "مشغولية النادي وأوقات التدريب المناسبة",
    imageUrl: "assets/images/intro5.jpg",
  ),
  OnBoardingContent(
    title: 'انطلق...',
    discription: "",
    imageUrl: "assets/images/intro5.jpg",
  ),
];
