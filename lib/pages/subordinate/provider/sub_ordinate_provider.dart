

import 'package:managerapp/pages/Subordinate/Model/Request/SubordinateRequest.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/webservices/url_constants.dart';

import '../../../webservices/api_request.dart';

class SubordinateProvider {
  void getSubOrdinateList(
      {SubordinateRequest? subordinateRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.SUB_SEARCH_ORDERURL, data: subordinateRequest)
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