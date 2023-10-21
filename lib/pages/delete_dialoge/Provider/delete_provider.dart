import 'package:managerapp/pages/delete_dialoge/Model/Request/delete_image_req.dart';
import 'package:managerapp/webservices/api_request.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/webservices/url_constants.dart';

class DeleteProvider {
  void getDeleteProvider(
      {DeleteImageReq? deleteImageReq,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(url: UrlConstants.DELETE_PHOTO_URL, data: deleteImageReq)
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
