import 'package:pct_mark/core/common/definations.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserData({
  required UserType userType,
  required String token,
}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString('userType', userType.toString());
  await sharedPreferences.setString('token', token);
}
