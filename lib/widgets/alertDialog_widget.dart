import 'package:praktpm_tugas2/utils/global.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget {
  String title;
  String message;
  String type;

  AlertDialogWidget(this.title, this.message, this.type);

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        children: [
          (type == "error") ?
          Icon(
            Icons.error,
            color: Colors.red,
            size: 64,
          ) :
          Icon(
            Icons.done_rounded,
            color: Colors.green,
          ),
          SizedBox(height: 16,),
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8,),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    showDialog(context: context, builder: (BuildContext context) {
      return alert;
    });
  }
}
