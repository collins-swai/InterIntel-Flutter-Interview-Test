import 'dart:ui';

class ColorConstant {
  static Color purple100 = fromHex('#dcbcf9');

  static Color teal50 = fromHex('#daf2e5');

  static Color gray50 = fromHex('#f9f9f9');

  static Color lightBlue30072 = fromHex('#724bc8ee');

  static Color whiteA7007f = fromHex('#7fffffff');

  static Color whiteA700B2 = fromHex('#b2ffffff');

  static Color deepPurpleA20059 = fromHex('#59755ffd');

  static Color lightBlue300 = fromHex('#4bc8ee');

  static Color yellow800A5 = fromHex('#a5fc9e1b');

  static Color yellow800E5 = fromHex('#e5fc9e1b');

  static Color deepOrange60072 = fromHex('#72f44620');

  static Color teal80019 = fromHex('#1900803a');

  static Color yellow800 = fromHex('#fc9e1b');

  static Color deepOrange900 = fromHex('#ba3d02');

  static Color purpleA200 = fromHex('#ff21fb');

  static Color purple900D8 = fromHex('#d8470ba7');

  static Color redA700 = fromHex('#ff0000');

  static Color lightBlue300A5 = fromHex('#a54bc8ee');

  static Color teal8000c = fromHex('#0c00803a');

  static Color gray600 = fromHex('#807964');

  static Color gray601 = fromHex('#7f7963');

  static Color deepOrange600Bf = fromHex('#bff44620');

  static Color teal80026 = fromHex('#2600803a');

  static Color purple90059 = fromHex('#59470ba7');

  static Color limeA700D8 = fromHex('#d89ded1a');

  static Color deepOrange900D8 = fromHex('#d8ba3d02');

  static Color bluegray400 = fromHex('#888888');

  static Color lightBlue500A5 = fromHex('#a502a3f4');

  static Color purple10072 = fromHex('#72dcbcf9');

  static Color yellow80059 = fromHex('#59fc9e1b');

  static Color yellow50099 = fromHex('#99ffed35');

  static Color greenA10059 = fromHex('#59c9fcbe');

  static Color yellow80099 = fromHex('#99fc9e1b');

  static Color whiteA700 = fromHex('#ffffff');

  static Color pinkA20099 = fromHex('#99f52484');

  static Color lightBlue500Bf = fromHex('#bf02a3f4');

  static Color yellow500A5 = fromHex('#a5ffed35');

  static Color yellow500E5 = fromHex('#e5ffed35');

  static Color deepOrange900A5 = fromHex('#a5ba3d02');

  static Color yellow500 = fromHex('#ffed35');

  static Color teal800 = fromHex('#007f39');

  static Color black900 = fromHex('#000000');

  static Color lightBlue500D8 = fromHex('#d802a3f4');

  static Color yellow800Bf = fromHex('#bffc9e1b');

  static Color greenA100Bf = fromHex('#bfc9fcbe');

  static Color purple90072 = fromHex('#72470ba7');

  static Color gray900 = fromHex('#00132f');

  static Color bluegray100 = fromHex('#d9d9d9');

  static Color yellow800D8 = fromHex('#d8fc9e1b');

  static Color lightBlue50099 = fromHex('#9902a3f4');

  static Color greenA100D8 = fromHex('#d8c9fcbe');

  static Color lightBlue300Bf = fromHex('#bf4bc8ee');

  static Color gray100 = fromHex('#f5f5f5');

  static Color bluegray900 = fromHex('#20304a');

  static Color purple900E5 = fromHex('#e5470ba7');

  static Color purple900A5 = fromHex('#a5470ba7');

  static Color bluegray901 = fromHex('#302e2a');

  static Color yellow50072 = fromHex('#72ffed35');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}