import 'package:managerapp/pages/outletsAction/outlet_action_request.dart';
import 'package:managerapp/webservices/api_request.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/webservices/url_constants.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class OutletsActionProvider {
  OutletsActionProvider(
      {OutletDataRequest? outletDataRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.REQ_SUB_GET_OUTLET_URL, data: outletDataRequest)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!(data);
      },
      onError: (error) {
        errorDialog(error);
      },
    );
  }
}

class IsCheckedInProvider {
  IsCheckedInProvider(
      {OutletDataRequest? outletDataRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.REQ_CHECK_IN_URL, data: outletDataRequest)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!(data);
      },
      onError: (error) {
        errorDialog(error);
      },
    );
  }
}
