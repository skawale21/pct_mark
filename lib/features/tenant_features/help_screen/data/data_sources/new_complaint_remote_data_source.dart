import 'package:pct_mark/core/common/resources/api_endpoints.dart';
import 'package:pct_mark/core/common/services/http_service.dart';
import 'package:pct_mark/core/error/exceptions.dart';
import 'package:pct_mark/features/tenant_features/help_screen/data/models/new_complaint_model.dart';

abstract interface class NewComplaintRemoteDataSource {
  Future<NewComplaintModel> newComplaint({
    required String tenentId,
    required String message,
  });
}

class NewComplaintRemoteDataSourceImpl implements NewComplaintRemoteDataSource {
  final HttpService httpService;

  NewComplaintRemoteDataSourceImpl(this.httpService);
  // String myToken =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YWRkNDI3NmQzNzcyNmVhYzgzY2Q3YSIsImlhdCI6MTcyMjg1NDU3Nn0.Ehb20WieENDk_I6RzYfE_lDqzyteRx9U6X3iNvRAZbk";
  @override
  Future<NewComplaintModel> newComplaint(
      {required String tenentId, required String message}) async {
    try {
      // httpService.setToken(myToken);
      final response = await httpService.post(
        ApiEndPoints.tenantNewComplaint,
        data: {'tenentId': tenentId, 'message': message},
      );
      if (response == null) {
        throw ServerException('User is null');
      }
      return NewComplaintModel.fromJson(
          response); //use .fromJson form model class
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
