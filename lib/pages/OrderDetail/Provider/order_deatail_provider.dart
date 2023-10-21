import 'package:managerapp/pages/OrderDetail/Model/Request/order_details_req.dart';
import 'package:managerapp/webservices/api_request.dart';
import 'package:managerapp/webservices/response_model.dart';

import '../../../webservices/url_constants.dart';

class OrderDetailProvider {
  getOrderDetail(
      {OrderDetailsReq? orderDetailsReq,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.ORDER_DETAILSURL, data: orderDetailsReq)
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
