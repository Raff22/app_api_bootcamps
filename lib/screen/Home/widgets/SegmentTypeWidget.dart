import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

///
///
///
///
class SegmentModel {
  int id;
  Widget title;
  Widget widget;

  SegmentModel({required this.id, required this.title, required this.widget});
}

///
///
///
///
///
class SegmentTypeWidget extends StatefulWidget {
  const SegmentTypeWidget(
      {super.key, this.controller, required this.widgetWidget});
  final CustomSegmentedController<int>? controller;
  final List<SegmentModel> widgetWidget;
  @override
  State<SegmentTypeWidget> createState() => _SegmentTypeWidgetState();
}

class _SegmentTypeWidgetState extends State<SegmentTypeWidget> {
  BorderRadius dynamicBorder = const BorderRadius.only(
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
  );
  Map<int, Widget> object = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.widgetWidget.map((e) => object[e.id] = e.title).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: CustomSlidingSegmentedControl<int>(
            controller: widget.controller,
            fromMax: true,
            height: 30,
            innerPadding: EdgeInsets.zero,
            children: object,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            thumbDecoration: BoxDecoration(
              borderRadius: dynamicBorder,
              color: Colors.white,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.7, 0.0),
                colors: [
                  Color(0xff5851db),
                  Color(0xffe1306c),
                ],
              ),
            ),
            onValueChanged: (int value) {
              setState(() {
                dynamicBorder = const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                );
              });
            },
          ),
        ),
        widget.widgetWidget[widget.controller!.value!].widget
      ],
    );
  }
}
