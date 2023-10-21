import 'package:managerapp/pages/outletsAction/actions/retailerclass/retailer_class_request.dart';
import 'package:managerapp/webservices/api_request.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/webservices/url_constants.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class RetailerClassProvider {
  updateRetailerClassProvider(
      {UpdateRetailerClassRequest? updateRetailerClassRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.REQ_ADD_RETAILER_CLASS_URL,
            data: updateRetailerClassRequest)
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
