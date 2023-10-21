import 'package:managerapp/pages/login/Model/Request/login_request.dart';
import 'package:managerapp/webservices/api_request.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/webservices/url_constants.dart';

class CheckLoginProvider {
  void loginProvider(
      {LoginRequestModel? loginRequestModel,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.LOGIN_URL, data: loginRequestModel)
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
