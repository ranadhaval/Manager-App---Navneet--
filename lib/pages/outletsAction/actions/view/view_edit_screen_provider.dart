import 'package:managerapp/pages/filter/filter_request_model.dart';
import 'package:managerapp/pages/outletsAction/actions/view/view_edit_request.dart';
import 'package:managerapp/pages/outletsAction/outlet_action_request.dart';
import 'package:managerapp/webservices/api_request.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/webservices/url_constants.dart';
import 'package:managerapp/widgets/error_dialog.dart';
import 'package:dio/dio.dart' as multi;

class ViewEditProvider {
  viewEditProvider(
      {BasicRequest? regionRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.REQ_REGION_URL, data: regionRequest)
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

  districtListProvider(
      {DistrictRequest? districtRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.REQ_DISTRICT_URL, data: districtRequest)
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

  cityListProvider(
      {CityRequest? cityRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.REQ_CITY_URL, data: cityRequest).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!(data);
      },
      onError: (error) {
        errorDialog(error);
      },
    );
  }

  designationListProvider(
      {BasicRequest? designationRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.TAG_CONTACT_DESIGNATION, data: designationRequest)
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

  uploadImageProvider(
      {UploadRetailerImageReq? uploadRetailerImageReq,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.REQ_RETAILER_IMAGE_URL,
            data: uploadRetailerImageReq)
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

  void uploadImageFile({
    required multi.FormData formData,
    Function()? beforeSend,
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel error)? onError,
  }) {
    ApiRequest(
            url: UrlConstants.image_upload,
            formData: formData,
            isFormData: true)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!(data);
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  submitDataProvider(
      {UpdateOutletDataRequest? updateOutletDataRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.TAG_EDIT_OUTLET, data: updateOutletDataRequest)
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
