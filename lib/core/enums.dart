
enum ProcessState { idle, processing, waitingForOTP, failed, done }

enum Provinces {
  provinces(inArabic: "المحافظة"),
  damascus(inArabic: "دمشق"),
  damascusCountry(inArabic: "ريف دمشق"),
  aleppo(inArabic: "حلب"),
  idleb(inArabic: "إدلب"),
  homs(inArabic: "حمص"),
  hama(inArabic: "حماة"),
  tartus(inArabic: "طرطوس"),
  lattakia(inArabic: "اللاذقية"),
  daraa(inArabic: "درعا"),
  sweda(inArabic: "السويداء"),
  qnetra(inArabic: "القنيطرة"),
  deiralzor(inArabic: "دير الزور"),
  raqaa(inArabic: "الرقة"),
  hasaka(inArabic: "الحسكة");

  final String inArabic;

  static Provinces fromIndex(int index) =>
      Provinces.values.firstWhere((element) => element.index == index);

  const Provinces({required this.inArabic});
}
