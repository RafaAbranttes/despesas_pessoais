import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {


  final DateTime selectedDate;
  final Function (DateTime) onDateChange;

  AdaptativeDatePicker({
    this.selectedDate,
    this.onDateChange,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      
      onDateChange(pickedDate);

    });
  }


  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ?  Container(
      height: 180,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime : DateTime.now(),
        minimumDate: DateTime(2019),
        maximumDate: DateTime.now(),
        onDateTimeChanged: onDateChange,
        
      ),
    ) : Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(selectedDate == null
                          ? 'Nehuma data selecionada!'
                          : ' Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}'),
                    ),
                    FlatButton(
                        textColor: Colors.orange,
                        child: Text(
                          'Selecionar Data',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () =>  _showDatePicker(context)),
                  ],
                ),
              );
  }
}