import 'package:flutter/material.dart';

import '../../app_styles.dart';

class PlasmaRequestsScreen extends StatelessWidget {
  const PlasmaRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'People in need',
          style: kBodyText.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            shadowColor: Colors.black,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search by location',
                border: InputBorder.none,
              ),
            ),
          ),
          //
          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: 100,
              itemBuilder: (context, index) {
                return PlasmaRequiredCard();
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 30);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PlasmaRequiredCard extends StatelessWidget {
  const PlasmaRequiredCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 80,
            color: Colors.green,
            child: ListTile(
              leading: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
              title: Text(
                'Kamran Mehsood',
                style: kBodyText.copyWith(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'January 14, 2022',
                style: TextStyle(
                  color: kWhite,
                ),
              ),
              trailing: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Text('A+'),
              ),
            ),
          ),
          Container(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.house,
                            color: Colors.green,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Civil Hospital',
                            style: kBodyText.copyWith(color: Colors.green),
                          ),
                        ],
                      ),
                      //
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Peshawar',
                            style: kBodyText.copyWith(color: Colors.green),
                          ),
                        ],
                      ),
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.format_bold_rounded,
                            color: Colors.green,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '3',
                            style: kBodyText.copyWith(color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
