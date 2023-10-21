import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Model/image_detail/image_detail_model.dart';
import 'package:managerapp/pages/delete_dialoge/delete_controller.dart';
import 'package:managerapp/pages/outletsAction/actions/imagesActions/images_controller.dart';
import 'package:managerapp/pages/outletsAction/outlets_action_controller.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/Permissions.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/widgets/Bottom_button.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:managerapp/widgets/file_selection_dialoge.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  ImagesController imagesController = Get.put(ImagesController());
  DeleteController deleteController = Get.put(DeleteController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImagesController>(builder: (controller) {
      return Scaffold(
        appBar: _appbar(),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(Constant.MEDIUM_PADDING),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StaggeredGridView.countBuilder(
                        crossAxisCount: 3,
                        crossAxisSpacing: Constant.SMALL_PADDING,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        mainAxisSpacing: Constant.SMALL_PADDING,
                        itemCount: imagesController.images!.length,
                        staggeredTileBuilder: (index) {
                          return const StaggeredTile.fit(1);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          ImgDetail item = imagesController.images![index];
                          return Stack(children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: (item.isFileLocal ?? false)
                                  ? FileImage(item.file as File)
                                      as ImageProvider
                                  : NetworkImage(item.imagepath!),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 20,
                              child: GestureDetector(
                                onTap: () {
                                  if (item.isFileLocal!) {
                                    imagesController.images!.remove(item);
                                    imagesController.update();
                                  } else {
                                    deleteController.getdelete(
                                        imageID: item.imgId.toString());
                                    imagesController.images!.remove(item);
                                    imagesController.update();
                                  }
                                  imagesController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(
                                      Constant.VERY_SMALL_PADDING),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppTheme.colorPrimary),
                                  child: const Icon(
                                    Icons.delete,
                                    color: AppTheme.colorWhite,
                                    size: 15,
                                  ),
                                ),
                              ),
                            )
                          ]);
                        }),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () async {
                          bool permission = await PermissionService()
                              .cameraAndStoragePermission();
                          if (permission) {
                            List<File> selected = await showDialog(
                                context: context,
                                builder: (s) {
                                  return Diloagbox();
                                });

                            if (selected != null && selected.isNotEmpty) {
                              imagesController.isImageAdded = true;
                              imagesController.images!
                                  .addAll(selected.map<ImgDetail>((e) {
                                return ImgDetail(
                                    isFileLocal: true,
                                    file: e,
                                    filepath: e.path);
                              }));
                              imagesController.update();
                            }
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: Constant.BTM_BTN_PADDING + 20,
                          ),
                          padding: const EdgeInsets.all(Constant.LARGE_PADDING),
                          decoration: BoxDecoration(
                              color: AppTheme.colorPrimary,
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.add_a_photo,
                            color: AppTheme.colorWhite,
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: Constant.BTM_BTN_PADDING,
                    // ),
                  ],
                ),
              ),
            ),
            BottomCardButton(
                height: 60,
                title: "Submit",
                onTap: () {
                  upLoadImage();
                })
          ],
        ),
      );
    });
  }

  _appbar() {
    return DynamicAppBar(
      "Shop ",
      '',
      AppTheme.colorWhite,
      false,
      () => Get.back(),
      [],
      fontColors: AppTheme.titleDark,
      fontWeight: FontWeight.w400,
      title2: 'Images',
    );
  }

  upLoadImage() {
    List<String> localImage = [];
    if (imagesController.isImageAdded) {
      imagesController.images!.forEach((element) {
        if (element.isFileLocal == true &&
            element.filepath != null &&
            element.filepath!.isNotEmpty) {
          localImage.add(element.filepath!);
        }
      });
      if (localImage != null && localImage.isNotEmpty) {
        imagesController.fileUpload(localImage);
      }
    } else {
      Get.back(result: true);
    }
  }
}
