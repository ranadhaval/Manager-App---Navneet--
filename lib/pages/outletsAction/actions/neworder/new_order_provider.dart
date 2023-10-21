import 'package:managerapp/pages/outletsAction/actions/neworder/new_order_request.dart';
import 'package:managerapp/pages/outletsAction/outlet_action_request.dart';
import 'package:managerapp/webservices/api_request.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/webservices/url_constants.dart';

class NewOrderProvider {
  productListProvider(
      {ProductListRequest? productListRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.REQ_PRODUCT_CAT_URL, data: productListRequest)
        .postRequest(
            beforeSend: () => {if (beforeSend != null) beforeSend()},
            onSuccess: (data) {
              onSuccess!(data);
            },
            onError: (error) {
              onError!(error);
            });
  }

  schemeListProvider(
      {SchemeListRequest? schemeListRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.REQ_ORDER_SCHEME_URL, data: schemeListRequest)
        .postRequest(
            beforeSend: () => {if (beforeSend != null) beforeSend()},
            onSuccess: (data) {
              onSuccess!(data);
            },
            onError: (error) {
              onError!(error);
            });
  }

  destributorListProvider(
      {OutletDataRequest? distributorListRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.TAG_DISTRIBUTORS_URL,
            data: distributorListRequest)
        .postRequest(
            beforeSend: () => {if (beforeSend != null) beforeSend()},
            onSuccess: (data) {
              onSuccess!(data);
            },
            onError: (error) {
              onError!(error);
            });
  }

  submitOrderProvider(
      {SubmitEditOrderRequest? submitEditOrderRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.TAG_SUBMIT_ORDER_NEW,
            data: submitEditOrderRequest)
        .postRequest(
            beforeSend: () => {if (beforeSend != null) beforeSend()},
            onSuccess: (data) {
              onSuccess!(data);
            },
            onError: (error) {
              onError!(error);
            });
  }

  editOrderProvider(
      {SubmitEditOrderRequest? submitEditOrderRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.TAG_EDIT_OREDER_NEW, data: submitEditOrderRequest)
        .postRequest(
            beforeSend: () => {if (beforeSend != null) beforeSend()},
            onSuccess: (data) {
              onSuccess!(data);
            },
            onError: (error) {
              onError!(error);
            });
  }
}
