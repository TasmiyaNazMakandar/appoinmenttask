import 'package:appoinmenttask/Screen/cammer.dart';
import 'package:appoinmenttask/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
   bool isSwitched = false;

    return Scaffold(
      appBar: AppBar(
        title: Text("Kdhkjdsdds,Khfdk Dfdfkjh"),
      backgroundColor:ColorsCo.color2 ,
      ),
   backgroundColor:ColorsCo.color3,body: ListView(
     children: [
       Container(
         child: Row(
           children: [
           Container(
               margin: const EdgeInsets.fromLTRB(20,20, 0, 10),
             width: 100,
             height: 100,

          decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3rzr5yCjWIMDSeo2uKEkNUIx3yOSwwBZP8w&usqp=CAU',),
              fit: BoxFit.fill
          ),
      ),
   ),
               Container(
                 margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                 height: 100,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('02-12-2021',style: TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.bold
                     ),),
                     Text('PC-MD',textAlign:TextAlign.left,style: TextStyle(
                       fontSize: 12,
                     ),),
                     Text("Kdhkjdsdds,Khfdk Dfdfkjh",style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.bold
                     ),),
                     Text('(Male,12K)\nPending')
                   ],
                 ),
               ),
           ],
         ),
       ),
      Container(
        margin: const EdgeInsets.fromLTRB(200, 0, 0, 0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text('Is Start'),
               SizedBox(width: 20,),
               Switch(
                  value: isSwitched,
                        onChanged: (value) {
                        setState(() {
                     isSwitched = value;
                   print(isSwitched);
                       });
                  },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
                   inactiveThumbColor:Colors.blue
               ),

             ],
           ),
      ),
       SizedBox(height: 12,),
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           RawMaterialButton(
             onPressed: () {},
             elevation: 2.0,
             fillColor: Colors.blue,
             child: Icon(
               Icons.mic,
               size: 35.0,
               color: Colors.white,
             ),
             padding: EdgeInsets.all(15.0),
             shape: CircleBorder(),
           ),
           RawMaterialButton(
             onPressed: () {
               // calling Customecamera class
               final action = CustomCamera();
               showCupertinoModalPopup(
                   context: context, builder: (context) => action);

             },
             elevation: 2.0,
             fillColor: Colors.blue,
             child: Icon(
               Icons.camera_alt,
               size: 35.0,
               color: Colors.white,
             ),
             padding: EdgeInsets.all(15.0),
             shape: CircleBorder(),
           )
         ],
       ),
       SizedBox(height: 12,),
       Container(
         color:ColorsCo.color3 ,
         margin: const EdgeInsets.fromLTRB(40, 10, 40,10),
         child: Card(
           color:ColorsCo.color3 ,
          child: Column(
            children: [
              ListTile(title: Text('Bate Of Birth'),
              trailing: Text('12/04/2003'),),
              ListTile(title: Text('Case No'),
                trailing: Text('Y12W78'),),
              ListTile(title: Text('PC-MD'),
                trailing: Text('Checked Out'),),
            ],
          ) ,
         ),
       ),
       Container(
         width: 310,
         height: 80,
         margin: const EdgeInsets.fromLTRB(40, 10, 40,10),
         child: Card(
           color: ColorsCo.color4,
           child:Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Icon(Icons.file_copy,color: Colors.black,),
               SizedBox(width: 20,),
               Text('Supper Bill',style: TextStyle(
                 fontWeight:FontWeight.bold,
                 fontSize: 23,
               ),),

             ],
           ) ,
             // title: Text('Supper Bill',style: TextStyle(
             //   fontWeight:FontWeight.bold,
             //   fontSize: 23,
             //
             // ),),
            //

         ),
       )



     ],
   ),
    );
  }
}
