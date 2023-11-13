import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:testapp_aoi/utils/Layaout.dart';

class CardProject extends StatelessWidget {
  const CardProject(
      {super.key,
      this.name = "Example name",
      this.description = "Example description here",
      this.state = "Other",
      this.onTapDelete});
  final String name;
  final String description;
  final String state;
  final bool Function()? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Card(
          margin: EdgeInsets.zero,
          child: SwipeActionCell(
            key: UniqueKey(),
            trailingActions: <SwipeAction>[
              SwipeAction(

                  /// this is the same as iOS native
                  performsFirstActionWithFullSwipe: true,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onTap: (CompletionHandler handler) async {
                    if (onTapDelete != null) {
                      handler(onTapDelete!());
                    } else {
                      handler(false);
                    }
                  },
                  color: Colors.red),
            ],
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        name.toString(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      state.toString(),
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
              subtitle: Text(description.toString()),
            ),
          )),
    );
  }
}
