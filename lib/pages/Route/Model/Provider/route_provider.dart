import 'package:managerapp/pages/Route/Model/Request/route_request.dart';
import '../../../../webservices/api_request.dart';
import '../../../../webservices/response_model.dart';
import '../../../../webservices/url_constants.dart';

class RoutesProvider {
  RoutesProvider(
      {RoutesRequestModel? updateRoutesRequestModel,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.REQ_SUB_ROOT_URL, data: updateRoutesRequestModel)
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
