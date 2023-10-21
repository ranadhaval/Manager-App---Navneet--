import 'package:managerapp/util/constant.dart';

class UrlConstants {
  // Live
  /* static const MAIN_URL = "https://sfasapkmgr.navneet.com";
  static bool isDemoApk=true;*/

  // dev

  static const MAIN_URL = "https://sfasapkmgrdev.navneet.com";
  static bool isDemoApk = false;

  static const image_upload = "${MAIN_URL}/api/FileUpload/"; //98

  static const LOGIN_URL = "$MAIN_URL/loginmanagers.aspx";

  static const REQ_SUB_ROOT_URL = "$MAIN_URL/updateroutes.aspx";
  static const UPDATEOUTLETURL = "$MAIN_URL/updateoutlets.aspx";
  static const ADD_MCC_URL = "$MAIN_URL/MCCRetailer_MGR.aspx";

  static const SUB_SEARCH_ORDERURL = "$MAIN_URL/searchDateOrder.aspx";
  static const ORDER_DETAILSURL = "$MAIN_URL/vieworder.aspx";

  static const RCENT_ORDER_DETAILURL = "$MAIN_URL/recentorder.aspx";
  static const REQ_RETAILER_CLASS = "$MAIN_URL/Retailer_Class_MGR.aspx";
  static const REQ_RETAILER_LISTING_TYPE = "$MAIN_URL/Update_Listing_type.aspx";
  static const REQ_RETAILER_SHOP_TYPE = "$MAIN_URL/Update_Shop_Type.aspx";
  static const VIEW_MCC_RETAILER_URL = "$MAIN_URL/ViewMCCRetailer_MGR.aspx";

  static const REQ_SUB_GET_OUTLET_URL = "$MAIN_URL/getoutlet.aspx";
  static const REQ_CHECK_IN_URL = "$MAIN_URL/NewOrderCheck_In_Req_DSR_Mgr.aspx";
  static const DELETE_PHOTO_URL = "$MAIN_URL/Delete_Image_Mgr.aspx";

  static const REQ_PRODUCT_CAT_URL = "$MAIN_URL/updateCategoryProduct.aspx";
  static const REQ_ORDER_SCHEME_URL = "$MAIN_URL/updatescheme.aspx";
  static const TAG_DISTRIBUTORS_URL = "$MAIN_URL/UpdateDistributorSEDsr.aspx";
  static const TAG_SUBMIT_ORDER_NEW = "$MAIN_URL/DSR_SubmitOrder.aspx";
  static const TAG_EDIT_OREDER_NEW = "$MAIN_URL/DSR_EditOrder.aspx";
  static const REQ_REGION_URL = "$MAIN_URL/Region.aspx";
  static const REQ_DISTRICT_URL = "$MAIN_URL/District.aspx";
  static const REQ_CITY_URL = "$MAIN_URL/City.aspx";
  static const REQ_POTENTIAL_TYPE_URL =
      "$MAIN_URL/Retailer_Potential_Type.aspx";
  static const TAG_CONTACT_DESIGNATION =
      "$MAIN_URL/Update_Contact_Designation_Type.aspx";

  static const REQ_RETAILER_IMAGE_URL = "$MAIN_URL/Retailer_Image_Mgr.aspx";

  static const TAG_EDIT_OUTLET = "$MAIN_URL/editoutlet.aspx";
  static const REQ_POTENTIAL_LIST_URL =
      "$MAIN_URL/View_Retailer_Potential.aspx";
  static const REQ_ADD_POTENTIAL_URL =
      "$MAIN_URL/Submit_Retailer_Potential_Detail.aspx";
  static const REQ_ADD_RETAILER_CLASS_URL =
      "$MAIN_URL/Add_RetailerClass_MGR.aspx";
}
