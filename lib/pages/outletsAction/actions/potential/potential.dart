import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/potential_controller.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/potential_response.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';

class Potential extends StatefulWidget {
  const Potential({super.key});

  @override
  State<Potential> createState() => _PotentialState();
}

class _PotentialState extends State<Potential> {
  final potentialController = Get.put(PotentialController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetBuilder<PotentialController>(builder: (_) {
        return Scaffold(
          backgroundColor: AppTheme.colorWhite,
          appBar: _appbar(),
          body: ListView.builder(
              itemCount: potentialController.potentialBatchList.length,
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                Listbatch item = potentialController.potentialBatchList[index];
                return Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: const EdgeInsets.all(Constant.MEDIUM_PADDING),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          Constant.LIST_TILE_ROUNDED_CORNER),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 2),
                            blurRadius: 3,
                            spreadRadius: 1,
                            color: AppTheme.colorGray)
                      ]),
                  child: ExpansionTile(
                      backgroundColor: AppTheme.colorWhite,
                      collapsedBackgroundColor: AppTheme.colorWhite,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                      iconColor: AppTheme.colorPrimary,
                      collapsedIconColor: AppTheme.colorPrimary,
                      title: CustomText(
                        title: item.headertxt,
                        textAlign: TextAlign.start,
                        fontSize: AppTheme.medium,
                        colors: AppTheme.colorPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                      childrenPadding: const EdgeInsets.all(10),
                      children: item.listpoten!
                          .map<Widget>((e) => listTileItem(e))
                          .toList()),
                );

                //listTileItem(item, index);
              }),
          floatingActionButton: InkWell(
            onTap: () async {
              var rfrsh = await Get.toNamed(AppRoutes.ADDPOTENTIAL,
                  arguments: {"outid": potentialController.outid});
              if (rfrsh != null && rfrsh == true) {
                potentialController.getPotentialList();
              }
            },
            child: Container(
              margin: EdgeInsets.only(bottom: Constant.MEDIUM_PADDING),
              padding: const EdgeInsets.all(Constant.LARGE_PADDING),
              decoration: BoxDecoration(
                  color: AppTheme.colorPrimary, shape: BoxShape.circle),
              child: const Icon(
                Icons.add,
                color: AppTheme.colorWhite,
              ),
            ),
          ),
        );
      }),
    );
  }

  listTileItem(Listpoten item) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: Constant.VERY_SMALL_PADDING),
      padding: const EdgeInsets.all(Constant.MEDIUM_PADDING),
      decoration: BoxDecoration(
        color: AppTheme.colorPrimary.withOpacity(.03),
        borderRadius: BorderRadius.circular(Constant.LIST_TILE_ROUNDED_CORNER),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            VerticalDivider(
              color: AppTheme.colorPrimary,
              width: 20,
              thickness: 1.5,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textAlign: TextAlign.start,
                    title: "Potential Type: ${item.potentialType}",
                    colors: AppTheme.titleDark,
                    fontSize: AppTheme.medium,
                  ),
                  const SizedBox(
                    height: Constant.SMALL_PADDING,
                  ),
                  CustomText(
                    title: "Amount: ${item.amount}",
                    colors: AppTheme.titleDark,
                    fontSize: AppTheme.medium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appbar() {
    return DynamicAppBar(
      'Potential ',
      '',
      AppTheme.colorWhite,
      false,
      () => Get.back(),
      [],
      fontColors: AppTheme.titleDark,
      fontWeight: FontWeight.w400,
      title2: 'List',
    );
  }
}
