import 'package:managerapp/pages/outletsAction/actions/potential/potential_request.dart';
import 'package:managerapp/webservices/api_request.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/webservices/url_constants.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class PotentialProvider {
  potentialListProvider(
      {PotentialListRequest? potentialListRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.REQ_POTENTIAL_LIST_URL,
            data: potentialListRequest)
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

  potentialTypeProvider(
      {PotentialTypeRequest? potentialTypeRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.REQ_POTENTIAL_TYPE_URL,
            data: potentialTypeRequest)
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

  addpotentialProvider(
      {AddPotentialRequest? addPotentialRequest,
      Function()? beforeSend,
      Function(ResponseModel response)? onSuccess,
      Function(ResponseModel response)? onError}) {
    ApiRequest(
            url: UrlConstants.REQ_ADD_POTENTIAL_URL, data: addPotentialRequest)
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
