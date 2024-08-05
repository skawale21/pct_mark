import 'package:pct_mark/core/app_data/data_model/tenant_data_model.dart';
import 'package:pct_mark/init_dependencies.dart';

class TenantDataService {
  TenantData? _tenantData;

  void saveTenantData(TenantData tenantData) {
    _tenantData = tenantData;
  }

  TenantData? getTenantData() {
    return _tenantData;
  }

  void clearTenantData() {
    _tenantData = null;
  }
}

final TenantDataService tenantDataService = serviceLocator<TenantDataService>();
