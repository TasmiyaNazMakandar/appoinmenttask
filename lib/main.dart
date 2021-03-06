import 'dart:convert';

import 'package:appoinmenttask/Screen/searchpage.dart';
import 'package:appoinmenttask/Screen/upperpart.dart';
import 'package:appoinmenttask/colors/colors.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//Text(widget.title)
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DoctorPage(),
    );
  }
}

class DoctorPage extends StatefulWidget {

  @override

  State<StatefulWidget> createState() {

    // TODO: implement createState

    return DoctorPageState();

  }

}
class DoctorPageState extends State<DoctorPage> {
  @override
  //init method
  void initState() {
    super.initState();
    this.getjsondata();
  }

//To get JSON Data
  Future<String> getjsondata() async {
    String jsonData =
    await DefaultAssetBundle.of(context).loadString("assets/user.json");
    final jsonResult = json.decode(jsonData);
    allData = jsonResult;
    appointmentData = allData;
    setState(() {});
  }

       //Method to get the data
  getSelectedDateAppointments() {
    appointmentData = allData.where((element) {
      print(element);

      Map<String, dynamic> appItem = element;

      return appItem['Date'] == _selectedValue.toString();
    }).toList();

    setState(() {});
  }


  DatePickerController _controller = DatePickerController();
 //selecting the date
  DateTime _selectedValue = DateTime.now();
  final String url = "assets/user.json";
  List<dynamic> allData = [];
  List<dynamic> appointmentData = [];
  Map<String, dynamic> appointment;
  var isLoading = false;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

      body: ListView(children: [
//calling customeclass to displayupper part
        CustomClass(),

        Container(

          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.10,

          child: ListView(

            children: [
              //creating the calender

              DatePicker(

                DateTime.now(),

                initialSelectedDate: DateTime.now(),

                selectionColor: Color.fromRGBO(34, 82, 160, 1),

                selectedTextColor: Colors.white,
                //called when user select different dates
                onDateChange: (date) {
                  setState(() {
                    _selectedValue = date;
                    getSelectedDateAppointments();
                  });
                },

              ),

            ],

          ),

        ),

        Stack(children: [

          Container(

            height: MediaQuery
                .of(context)
                .size
                .height - 80.0,

            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),

          Positioned(
              top: 20.0,

              child: Container(

                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.only(

                        topLeft: Radius.circular(45.0),

                        topRight: Radius.circular(45.0),

                      ),

                      color: Color.fromRGBO(255, 255, 255, 1)),

                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,

                  child: ListView(children: [

                    SizedBox(height: 10,),

                    Text("HEASC 54-DEAN (4)",
                      textAlign: TextAlign.center,

                      style: TextStyle(

                          fontWeight: FontWeight.bold, fontSize: 18.0),

                    ),

                    Container(
                      child: Stack(
                        children: [
                          Container(
                            //providing height width and color
                              height: MediaQuery.of(context).size.height - 82.0,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent),
                          Positioned(
                            //setting the possion
                              top: 75.0,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(

                                        topLeft: Radius.circular(45.0),

                                        topRight: Radius.circular(45.0),

                                      ),
                                      color: Colors.white),
                                  height: MediaQuery.of(context).size.height - 100.0,
                                  width: MediaQuery.of(context).size.width)),
                          //Checking the condtion the weather appointmentData has data or it is null
                          appointmentData != null &&
                              appointmentData.isNotEmpty
                              ? ListView.separated(
                            separatorBuilder: (context, index) =>
                                Divider(
                                  color: Colors.black,
                                ),
                            shrinkWrap: true,
                            itemCount: appointmentData.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> item =
                              appointmentData[index];
                              return ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  leading: Icon(
                                    Icons.bookmark,
                                    color: Colors.green,
                                  ),
                                  title: Text(item["patientName"]),
                                  subtitle: Text(item["doctorName"] + "\n" + item["status"]),
                                  trailing: Column(
                                      children: [
                                        Text(item["time"]),

                                        Spacer(),
                                        RichText(
                                          text: TextSpan(
                                            text: '• ',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 14),

                                            children: <TextSpan>[
                                              TextSpan(text: '' + "" +"" + item["Dictation"],),

                                            ],

                                          ),

                                        )

                                      ])

                              );
                            },

                          )
                              : Divider(color: Colors.white,),

                        ],

                      ),

                    ),

                  ])

              ))

        ]),

      ]),

      floatingActionButton: FloatingActionButton(

        child: Icon(
          Icons.add,
        ),
        onPressed: (){
          //Moving to next screen
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>  AudioScreen()));
        },
        backgroundColor: Color.fromRGBO(34, 82, 160, 1),

      ),

    );
  }
}