import 'dart:ui';
import 'package:flutter/material.dart';

class BlurryDialog extends StatelessWidget {
  String title;
  String content;
  VoidCallback continueCallBack;

  BlurryDialog(this.title, this.content, this.continueCallBack);
  TextStyle textStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: new Text(
            title,
            style: textStyle,
          ),
          content: new Text(
            content,
            style: textStyle,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                new IconButton(
                  icon: new Icon(
                    Icons.cancel,
                    color: Colors.red,
                    size: 30,
                  ),
                  onPressed: () {
                    continueCallBack();
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.done_rounded,
                    color: Colors.green,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigator.of(context).pushReplacementNamed('HomeScreen');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        ));
  }
}
