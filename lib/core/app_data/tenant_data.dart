import 'package:pct_mark/core/app_data/data_model/tenant_data_model.dart';
import 'package:pct_mark/features/auth/data/storage_manager.dart';

class TenantDataService {
  final StorageManager _storageManager;

  TenantDataService(this._storageManager);

  Future<void> saveTenantData(TenantData tenantData) async {
    await _storageManager.saveTenantData(tenantData);
  }

  Future<TenantData?> getTenantData() async {
    return await _storageManager.getTenantData();
  }
}
