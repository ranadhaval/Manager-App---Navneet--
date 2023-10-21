import 'package:managerapp/pages/MccRetailer_Screen/Model/Request/mccretailer_req.dart';
import 'package:managerapp/webservices/api_request.dart';
import 'package:managerapp/webservices/response_model.dart';

import '../../../webservices/url_constants.dart';

class MccRetailerProvider {
  getMccRetailerDetail(
      {MccRetailerReq? mccRetailerReq,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.VIEW_MCC_RETAILER_URL, data: mccRetailerReq)
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

  // getMccRetailerDetail(
  //     {MccRetailerReq? mccRetailerReq,
  //     Function()? beforeSend,
  //     Function(ResponseModel responseModel)? onSuccess,
  //     Function(ResponseModel responseModel)? onError}) {
  //   ApiRequest(url: UrlConstants.VIEW_MCC_RETAILER_URL, data: mccRetailerReq)
  //       .postRequest(
  //           beforeSend: () => {if (beforeSend != null) beforeSend()},
  //           onSuccess: (data) {
  //             !(data);
  //           },
  //           onError: (error) => print(error));
  // }
}
