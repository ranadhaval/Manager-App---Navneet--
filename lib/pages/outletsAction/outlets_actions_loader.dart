import 'package:flutter/material.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:shimmer/shimmer.dart';

class OutletActionLoader extends StatelessWidget {
  const OutletActionLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, int index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.2),
            highlightColor: Colors.white,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: Constant.MEDIUM_PADDING,
                    left: Constant.MEDIUM_PADDING,
                    right: Constant.MEDIUM_PADDING),
                child: Column(children: [
                  actionCard([1, 1, 1, 1]),
                ]),
              ),
            ),
          );
        });
  }

  Container actionCard(List list) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constant.ROUNDED_CORNER),
          border: Border.all(color: AppTheme.colorGray)),
      width: double.infinity,
      child: Column(
        children: [
          Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: AppTheme.bgActionTitle,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(Constant.ROUNDED_CORNER))),
              padding: const EdgeInsets.all(Constant.MEDIUM_PADDING),
              width: double.infinity,
              child: Container(
                color: AppTheme.colorWhite,
                height: 14,
                width: 200,
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: list.map((item) {
              return Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: Constant.MEDIUM_PADDING,
                            bottom: Constant.SMALL_PADDING),
                        padding:
                            const EdgeInsets.all(Constant.SMALL_PADDING + 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.colorPrimary,
                        ),
                        height: 40,
                        width: 40,
                      ),
                      Container(
                        color: AppTheme.colorWhite,
                        height: 12,
                        width: 50,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: AppTheme.colorWhite,
                        height: 12,
                        width: 50,
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
