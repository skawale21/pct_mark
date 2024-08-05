import 'dart:convert';

import 'package:pct_mark/core/app_data/data_model/tenant_data_model.dart';
import 'package:pct_mark/core/app_data/data_model/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static final StorageManager _instance = StorageManager._internal();

  factory StorageManager() {
    return _instance;
  }

  StorageManager._internal();

  Future<void> saveUserData(UserData userData) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userDataJson = jsonEncode(userData.toJson());
    await sharedPreferences.setString('userData', userDataJson);
  }

  Future<UserData?> getUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userDataJson = sharedPreferences.getString('userData');

    if (userDataJson != null) {
      final userDataMap = jsonDecode(userDataJson) as Map<String, dynamic>;
      return UserData.fromJson(userDataMap);
    }

    return null;
  }

  Future<void> saveTenantData(TenantData tenantData) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final tenantDataJson = jsonEncode(tenantData.toJson());
    await sharedPreferences.setString('tenantData', tenantDataJson);
  }

  Future<TenantData?> getTenantData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final tenantDataJson = sharedPreferences.getString('tenantData');

    if (tenantDataJson != null) {
      final tenantDataMap = jsonDecode(tenantDataJson) as Map<String, dynamic>;
      return TenantData.fromJson(tenantDataMap);
    }

    return null;
  }

  Future<void> clearData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('userData');
    await sharedPreferences.remove('tenantData');
    // Add more fields if needed
  }
}
