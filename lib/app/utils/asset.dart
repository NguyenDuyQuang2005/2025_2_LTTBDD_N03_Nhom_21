const linkAsset = 'assets/images/icons/';

class AssetCustom {
  static String getLinkImg(String nameIcon) =>
      '$linkAsset${nameIcon.replaceAll(' ', '_').toLowerCase()}.png';
}

class MyKey {
  static const String api_key = 'dbcf35c98686fa109a055987717c0478';
}
