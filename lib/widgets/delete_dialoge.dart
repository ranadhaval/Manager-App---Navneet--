import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Model/image_detail/image_detail_model.dart';

import 'package:managerapp/pages/delete_dialoge/delete_controller.dart';
import 'package:managerapp/pages/outletsAction/outlet_action_response.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../theme/app_theme.dart';

final deleteController = Get.put(DeleteController());

List<int> j = [1, 2, 3, 4, 5, 6];

class DeleteDialog extends StatefulWidget {
  DeleteDialog(
      {super.key,
      required this.detailImageList,
      required this.deleteController,
      required this.deletAction,
      required this.simpleImageList,
      required this.index,
      required this.isDetailImage});
  bool isDetailImage;
  List<ImgDetail> detailImageList;
  List<Lstimage> simpleImageList;
  DeleteController deleteController;
  DeletAction deletAction;
  int index;

  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  PageController pageController = PageController();
  List<String> deletedImageId = [];

  @override
  void initState() {
    pageController = PageController(initialPage: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder(
        init: deleteController,
        builder: (control) {
          return Dialog(
            insetPadding: const EdgeInsets.all(15),
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Material(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  height: height / 1.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 4,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: widget.isDetailImage
                              ? widget.detailImageList.length
                              : widget.simpleImageList.length,
                          // itemCount: detailImageList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                height: height / 1.5,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  image: widget.isDetailImage
                                      ? DecorationImage(
                                          image: (widget.detailImageList[index]
                                                      .isFileLocal ??
                                                  false)
                                              ? FileImage(widget
                                                      .detailImageList[index]
                                                      .file as File)
                                                  as ImageProvider
                                              : NetworkImage(widget
                                                      .detailImageList[index]
                                                      .imagepath
                                                      .toString()
                                                  // detailImageList[index]
                                                  ),
                                          fit: BoxFit.cover)
                                      : DecorationImage(
                                          image: NetworkImage(widget
                                              .simpleImageList[index]
                                              .filePathName
                                              .toString()),
                                          fit: BoxFit.cover),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (widget.detailImageList[index]
                                            .isFileLocal!) {
                                          widget.deletAction.deleteAction(
                                              file: widget
                                                  .detailImageList[index].file);
                                          setState(() {
                                            widget.detailImageList
                                                .removeAt(index);
                                          });
                                        } else if (!widget.isDetailImage) {
                                          widget.deletAction.deleteAction(
                                              file: widget
                                                  .detailImageList[index].file);
                                          setState(() {
                                            widget.simpleImageList
                                                .removeAt(index);
                                          });
                                        } else {
                                          widget.deleteController.getdelete(
                                              imageID: widget
                                                  .detailImageList[index].imgId
                                                  .toString());
                                          widget.deletAction.deleteAction(
                                              id: widget
                                                  .detailImageList[index].imgId
                                                  .toString());
                                        }
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Card(
                                            color: Colors.red,
                                            child: Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 17,
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 70,
                            width: double.infinity,
                            child: Column(
                              children: [
                                SmoothPageIndicator(
                                  effect: const ScrollingDotsEffect(
                                      spacing: 20,
                                      dotHeight: 1.5,
                                      dotWidth: 25,
                                      radius: 25,
                                      dotColor: Colors.grey,
                                      activeDotColor: AppTheme.colorWhite),
                                  controller: pageController,
                                  count: widget.isDetailImage
                                      ? widget.detailImageList.length
                                      : widget.simpleImageList.length,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, top: 10, bottom: 30),
                                  child: Container(
                                    height: 0.3,
                                    color: Colors.white54,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.back(result: deletedImageId);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Go Back',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Comfortaa',
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                )),
          );
        });
  }
}

abstract class DeletAction {
  void deleteAction({String? id, File? file}) {}
}
