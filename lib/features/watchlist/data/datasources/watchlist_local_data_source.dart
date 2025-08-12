import 'package:injectable/injectable.dart';
import 'package:scene/core/services/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class WatchlistLocalDataSource {
  static final prefs=getIt.get<SharedPreferences>();
  static Future<void> saveUserId(String userId) async {
    await prefs.setString("userId", userId);
  }
  static String? getUserId() {
    return prefs.getString("userId");
  }
  static void deleteUserID()=>prefs.remove("userId");
}
