import 'package:managerapp/pages/outlets_page/Model/Request/outlets_request.dart';
import '../../../../../webservices/api_request.dart';
import '../../../../../webservices/response_model.dart';
import '../../../../../webservices/url_constants.dart';

class OutletsProvider {
  OutletsProvider(
      {OutletsRequestModel? updateOutletRequestModel,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.UPDATEOUTLETURL, data: updateOutletRequestModel)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!(data);
      },
      onError: (error) {
        print(error);
      },
    );
  }
}
