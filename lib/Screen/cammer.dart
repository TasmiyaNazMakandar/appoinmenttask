import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.camera,color: Colors.blue,),
              SizedBox(width: 45,),
              Text("Camera"),
            ],
          ),
          onPressed: () {
            print("Camera clicked");
          },
        ),
        CupertinoActionSheetAction(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Icon(Icons.library_books_rounded,color: Colors.blue,),
              SizedBox(width: 45,),
              Center(child: Text("Photo Library",textAlign: TextAlign.left,)),
            ],
          ),
          onPressed: () {
            print("Photo Library clicked");
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
