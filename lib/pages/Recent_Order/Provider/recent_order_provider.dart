import 'package:managerapp/pages/Recent_Order/Model/Request/recent_order_detail_req.dart';
import 'package:managerapp/webservices/api_request.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/webservices/url_constants.dart';

class RecentOrderDetailProvider {
  void recentOrderDetailProvider(
      {RecentOrderReq? recentOrderReq,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.RCENT_ORDER_DETAILURL, data: recentOrderReq)
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
