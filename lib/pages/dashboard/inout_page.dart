import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:managerapp/pages/Dashboard/inout_controller.dart';

class InOutPage extends StatefulWidget {
  const InOutPage({super.key});

  @override
  State<InOutPage> createState() => _InOutState();
}

class _InOutState extends State<InOutPage> {

  final inOutController = Get.put(InOutController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: GetBuilder<InOutController>(builder: ((controller) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text("In Out"),
                    ),
                  )
                ],
              ),
            ),
          );
        }),),);

  }
}
