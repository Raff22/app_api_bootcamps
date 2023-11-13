import 'package:flutter/material.dart';
import 'package:testapp_aoi/utils/Layaout.dart';

class UserIDAndNameWidget extends StatelessWidget {
  const UserIDAndNameWidget(
      {super.key,
      required this.nameUser,
      required this.idUser,
      this.position = '-----'});
  final String nameUser;
  final String idUser;
  final String position;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 110,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              idUser.toString(),
              style: const TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.bold),
            ),
          ),
          layoutH8,
          Text(
            nameUser.toString(),
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            position.toString(),
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
