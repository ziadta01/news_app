import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future pubData(bool isLight)
  async{
    return await sharedPreferences?.setBool('isLight', isLight);
  }

  static bool? getData(String key)
  {
    return sharedPreferences?.getBool(key);
  }

}
