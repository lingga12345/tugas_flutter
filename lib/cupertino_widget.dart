import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPickerView extends StatefulWidget {
  const CupertinoPickerView({Key? key}) : super(key: key);

  @override
  _CupertinoPickerViewState createState() => _CupertinoPickerViewState();
}

class _CupertinoPickerViewState extends State<CupertinoPickerView> {
  double _kPickerSheetHeight = 216.0;
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 30,right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                showCupertinoModalPopup<void>(
                    context: context, builder: (BuildContext context){
                  return _buildBottomPicker(
                     _buildDateTimePicker()
                  );
                });
              },
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width:MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue
                    ),
                    child: Center(
                      child: Text("Cupertino Date Picker",
                      style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8,bottom: 8),
                   // selectItem!=null?selectItem:'Set Picker',
                    child: Text(dateTime == null ? 'No Date Chosen'
                        : ' ${dateTime}',
                      style: TextStyle(
                          color: Colors.black
                      ),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimePicker() {
    return  CupertinoDatePicker(
        mode: CupertinoDatePickerMode.dateAndTime,
        initialDateTime: dateTime,
        onDateTimeChanged:(DateTime newDataTime){
          if(mounted){
            setState(() {
              dateTime=newDataTime;
            });
          }
        });
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
}