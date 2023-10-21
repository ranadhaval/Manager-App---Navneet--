import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/add_potential_controller.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/potential_controller.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/potential_response.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/widgets/Bottom_button.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:managerapp/widgets/error_dialog.dart';
import 'package:managerapp/widgets/input_textfield.dart';
import 'package:managerapp/widgets/progress_bar.dart';
import 'package:managerapp/widgets/title_widge.dart';

class AddPotential extends StatefulWidget {
  const AddPotential({super.key});

  @override
  State<AddPotential> createState() => _AddPotentialState();
}

class _AddPotentialState extends State<AddPotential> {
  final addpotentialController = Get.put(AddPotentialController());
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
      child: GetBuilder<AddPotentialController>(builder: (_) {
        return Scaffold(
          backgroundColor: AppTheme.colorWhite,
          appBar: _appbar(),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Constant.LARGE_PADDING,
                    horizontal: Constant.SMALL_PADDING,
                  ),
                  child: ListView.builder(
                      itemCount:
                          addpotentialController.potentialTypeList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        Listdata item =
                            addpotentialController.potentialTypeList[index];
                        Ctrl ctrl = addpotentialController.ctrlList[index];
                        return formrowwithtextfield(
                            item.potentialType!, ctrl.ctrl);
                        //listTileItem(item, index);
                      }),
                ),
              ),
              BottomCardButton(
                  height: 60,
                  title: "ADD",
                  onTap: () {
                    addpotentialController.addPotential();
                  }),
              ProgressBar(isLoader: addpotentialController.isLoading)
            ],
          ),
        );
      }),
    );
  }

  formrowwithtextfield(
    String title,
    TextEditingController ctrl,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Constant.VERY_SMALL_PADDING),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputTitleRequire(
            title: "$title:",
            require: false,
          ),
          const SizedBox(
            height: Constant.SMALL_PADDING,
          ),
          CoustomTextField(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: Constant.SMALL_PADDING,
                vertical: Constant.MEDIUM_PADDING),
            fontWeight: FontWeight.w400,
            fontSize: AppTheme.medium,
            labelText: title,
            hintColor: AppTheme.colorGray,
            borderEnableColors: AppTheme.textfieldbordercolor,
            borderFocusColors: AppTheme.textfieldbordercolor,
            textEditingController: ctrl,
            readOnly: false,
            keyboardType: TextInputType.number,
            onTextValidator: (_) {},
            onChanged: (_) {},
          )
        ],
      ),
    );
  }

  _appbar() {
    return DynamicAppBar(
      'Add ',
      '',
      AppTheme.colorWhite,
      false,
      () => Get.back(),
      [],
      fontColors: AppTheme.titleDark,
      fontWeight: FontWeight.w400,
      title2: 'Potential',
    );
  }
}
