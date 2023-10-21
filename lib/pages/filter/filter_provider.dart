import 'package:managerapp/pages/filter/filter_request_model.dart';
import 'package:managerapp/webservices/api_request.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/webservices/url_constants.dart';

class FilterProvider {
  filterClassProvider(
      {BasicRequest? filterRequestModel,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.REQ_RETAILER_CLASS, data: filterRequestModel)
        .postRequest(
            beforeSend: () => {if (beforeSend != null) beforeSend()},
            onSuccess: (data) {
              onSuccess!(data);
            },
            onError: (error) {
              onError!(error);
            });
  }

  filterListingTypeProvider(
      {BasicRequest? filterRequestModel,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.REQ_RETAILER_LISTING_TYPE,
            data: filterRequestModel)
        .postRequest(
            beforeSend: () => {if (beforeSend != null) beforeSend()},
            onSuccess: (data) {
              onSuccess!(data);
            },
            onError: (error) {
              onError!(error);
            });
  }

  filterShopTypeProvider(
      {BasicRequest? filterRequestModel,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.REQ_RETAILER_SHOP_TYPE, data: filterRequestModel)
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
