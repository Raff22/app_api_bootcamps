import 'package:flutter/material.dart';

class DropMenuWidget extends StatefulWidget {
  const DropMenuWidget({
    super.key,
    this.onChanged,
    this.menuItem = const ["Item", "Item"],
  });
  final Function(String?)? onChanged;
  final List<String> menuItem;

  @override
  State<DropMenuWidget> createState() => _DropMenuWidgetState();
}

class _DropMenuWidgetState extends State<DropMenuWidget> {
  @override
  String? value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = widget.menuItem[0];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: SizedBox(
          width: 250,
          child: DropdownButton(
              hint: Text(value!),
              value: value,
              isExpanded: true,
              borderRadius: BorderRadius.circular(20),
              underline: null,
              iconSize: 30.0,
              padding: const EdgeInsets.all(8),
              isDense: false,
              itemHeight: 50,
              // menuMaxHeight: 250,
              style: const TextStyle(color: Colors.blue),
              items: widget.menuItem.map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(
                      val,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ).toList(),
              onChanged: (valueSelected) {
                value = valueSelected;
                setState(() {});
                if (widget.onChanged != null) {
                  widget.onChanged!(valueSelected);
                }
              }),
        ),
      ),
    );
  }
}
