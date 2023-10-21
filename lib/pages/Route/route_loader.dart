import 'package:flutter/material.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:shimmer/shimmer.dart';

class RouteLoader extends StatelessWidget {
  const RouteLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: Constant.EXTRA_LARGE_PADDING,
        left: Constant.MEDIUM_PADDING,
        right: Constant.MEDIUM_PADDING,
      ),
      child: ListView.builder(
          itemCount: 20,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, int index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.2),
              highlightColor: Colors.white,
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: 3,
                      color: AppTheme.colorWhite,
                      height: Constant.LIST_TILE_HEIGHT,
                    ),
                    Positioned.fill(
                      //left: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(
                              width: Constant.LARGE_PADDING,
                            ),
                            Container(
                                padding: const EdgeInsets.all(
                                    Constant.SMALL_PADDING),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.colorWhite,
                                  // Colors.amber.shade200,
                                ),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  color: AppTheme.colorWhite,
                                )),
                            const SizedBox(
                              width: Constant.SMALL_PADDING,
                            ),
                            Container(
                              height: 16,
                              width: 180,
                              color: AppTheme.colorWhite,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
