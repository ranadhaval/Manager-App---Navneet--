import 'package:get/get.dart';
import 'package:managerapp/pages/MccRetailer_Screen/mccretailer_screen.dart';
import 'package:managerapp/pages/OrderDetail/order_detail_screen.dart';
import 'package:managerapp/pages/Recent_Order/recent_order_screen.dart';
import 'package:managerapp/pages/Dashboard/Home.dart';
import 'package:managerapp/pages/Route/route.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/add_mcc_retailer_screen.dart';
import 'package:managerapp/pages/outletsAction/actions/imagesActions/images_screen.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/new_order.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/scheme.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/select_product_screen.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/add_potential.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/potential.dart';
import 'package:managerapp/pages/outletsAction/actions/view/view_edit_screen.dart';
import 'package:managerapp/pages/outletsAction/outlets_actions_screen.dart';
import 'package:managerapp/pages/filter/filter.dart';
import 'package:managerapp/pages/login/login_screen.dart';
import 'package:managerapp/pages/outlets_page/outlets_screen.dart';
import 'package:managerapp/pages/splash/splash.dart';
import 'package:managerapp/pages/subordinate/sub_ordinate_screen.dart';
import 'package:managerapp/routes/app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const RouteScreen(),
    ),
    GetPage(
      name: AppRoutes.ROUTEPAGE,
      page: () => const OutletsScreen(),
    ),
    GetPage(
      name: AppRoutes.TESTPAGE,
      page: () => const OutletsActionScreen(),
    ),
    GetPage(
      name: AppRoutes.DEMO,
      page: () => Home(),
    ),
    GetPage(
      name: AppRoutes.SUBORDINATE,
      page: () => SubOrdinateScreen(),
    ),
    GetPage(
      name: AppRoutes.ORDER_SCREEN,
      page: () => OrderDetailScreen(),
    ),
    GetPage(
      name: AppRoutes.FILTER,
      page: () => const FilterScreen(),
    ),
    GetPage(
      name: AppRoutes.NEWORDER,
      page: () => const NewOrderScreen(),
    ),
    GetPage(
      name: AppRoutes.RECENT_ORDER_SCREEN,
      page: () => const RecentOrderDetailScreen(),
    ),
    GetPage(
      name: AppRoutes.MCC_RETAILER_SCREEN,
      page: () => const MccRetailer_screen(),
    ),
    GetPage(
      name: AppRoutes.ADD_MCC_RETAILER_SCREEN,
      page: () => AddMccRetailer(),
    ),
    GetPage(
      name: AppRoutes.SELECTPRODUCT,
      page: () => const SelectProduct(),
    ),
    GetPage(
      name: AppRoutes.SELECTSCHEME,
      page: () => const Scheme(),
    ),
    GetPage(
      name: AppRoutes.VIEWEDITACTION,
      page: () => const ViewEditAction(),
    ),
    GetPage(
      name: AppRoutes.POTENTIAL,
      page: () => const Potential(),
    ),
    GetPage(
      name: AppRoutes.IMAGES,
      page: () => const ImagesScreen(),
    ),
    GetPage(
      name: AppRoutes.ADDPOTENTIAL,
      page: () => const AddPotential(),
    ),
  ];
}
