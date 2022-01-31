import 'package:flutter/material.dart';
import 'package:plasma_donor_app2/app_styles.dart';

class BloodCompatibilityScreen extends StatelessWidget {
  const BloodCompatibilityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Blood Compatibility',
            style: kBodyText.copyWith(color: Colors.black),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
        ),
        body: ListView(children: <Widget>[
          SizedBox(height: 20),
          Center(
              child: Text(
            'People-Chart',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          DataTable(
            columns: [
              DataColumn(
                  label: FittedBox(
                child: Text('Blood Group',
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              )),
              DataColumn(
                  label: Text('Donate To',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: FittedBox(
                child: Text('Accept From',
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              )),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('A+')),
                DataCell(Text('A+, AB+')),
                DataCell(FittedBox(child: Text('A+, A-, O+, O-'))),
              ]),
              DataRow(cells: [
                DataCell(Text('A-')),
                DataCell(FittedBox(child: Text('A+, A-, AB+, AB-'))),
                DataCell(Text('A-, O-')),
              ]),
              DataRow(cells: [
                DataCell(Text('B+')),
                DataCell(Text('B+, AB+')),
                DataCell(Text('B+, B-, O+, O-')),
              ]),
              DataRow(cells: [
                DataCell(Text('B-')),
                DataCell(Text('B+, B-, AB+, AB-')),
                DataCell(Text('B-, O-')),
              ]),
              DataRow(cells: [
                DataCell(
                  Text('AB+'),
                ),
                DataCell(
                  Text('AB+'),
                ),
                DataCell(
                  Text('ANYONE'),
                ),
              ]),
              DataRow(cells: [
                DataCell(
                  Text('AB-'),
                ),
                DataCell(
                  Text('AB+, AB-'),
                ),
                DataCell(
                  Text('AB-, A-, B-, O-'),
                ),
              ]),
              DataRow(cells: [
                DataCell(
                  Text('O+'),
                ),
                DataCell(
                  Text('A+, B+, O+, AB+'),
                ),
                DataCell(
                  Text('O+, O-'),
                ),
              ]),
              DataRow(cells: [
                DataCell(
                  Text('O-'),
                ),
                DataCell(
                  Text('ANYONE'),
                ),
                DataCell(
                  Text('O-'),
                ),
              ])
            ],
          ),
        ]));
  }
}
