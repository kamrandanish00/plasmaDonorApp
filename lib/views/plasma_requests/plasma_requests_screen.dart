import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_styles.dart';
import '../../services/indirectPhoneCall.dart';
import '../../size_configs.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PlasmaRequestsScreen extends StatefulWidget {
  PlasmaRequestsScreen({Key? key, this.bloodGroup}) : super(key: key);
  final String? bloodGroup;

  @override
  State<PlasmaRequestsScreen> createState() => _PlasmaRequestsScreenState();
}

class _PlasmaRequestsScreenState extends State<PlasmaRequestsScreen> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizedH!;
    double sizeV = SizeConfig.blockSizeV!;
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
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
          ),
          //
          SizedBox(height: 20),
          Expanded(
            // child: ListView.separated(
            //   itemCount: 100,
            //   itemBuilder: (context, index) {
            //     return PlasmaRequiredCard();
            //   },
            //   separatorBuilder: (BuildContext context, int index) {
            //     return SizedBox(height: 30);
            //   },
            // ),
            //
            child: StreamBuilder(
              stream:
                  // FirebaseFirestore.instance.collection("Donors").snapshots(),
                  //
                  (name != '' && name != null)
                      ? FirebaseFirestore.instance
                          .collection('plasmaRequests')
                          .where('city', isEqualTo: name)
                          .snapshots()
                      : FirebaseFirestore.instance
                          .collection('plasmaRequests')
                          .where('bloodGroup', isEqualTo: widget.bloodGroup)
                          .snapshots(),
              builder: (_,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  print("Total Documents: == ${snapshot.data?.docs.length}");
                  print('This is BloodGroup ==== ${widget.bloodGroup}');
                  if (snapshot.data!.docs.isNotEmpty) {
                    return ListView.separated(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (__, index) {
                        Map<String, dynamic> docData =
                            snapshot.data!.docs[index].data();

                        if (docData.isEmpty) {
                          return Text(
                            'Document is empty',
                            textAlign: TextAlign.center,
                          );
                        }
                        String fullName = snapshot.data!.docs
                            .elementAt(index)
                            .get("fullName");
                        String city =
                            snapshot.data!.docs.elementAt(index).get("city");
                        //hospital name
                        String hospitalName = snapshot.data?.docs
                            .elementAt(index)
                            .get('hospitalName');
                        //bloodbags required
                        String numberOfBloodBags = snapshot.data?.docs
                            .elementAt(index)
                            .get('numberOfBloodBags');
                        //phone number
                        String phoneNumber = snapshot.data?.docs
                            .elementAt(index)
                            .get('phoneNumber');
                        //posted date
                        String postedDate = snapshot.data?.docs
                            .elementAt(index)
                            .get("postedDate");
                        // print('Posted Date ===== $postedDate');
                        // // DateTime now = DateTime.now();
                        // String formattedDate =
                        //     DateFormat('yyyy-MM-dd – kk:mm').format(postedDate);

                        String bloodGroup = snapshot.data!.docs
                            .elementAt(index)
                            .get("bloodGroup");
                        // .toDate();
                        // return PlasmaRequiredCard();
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
                                    // 'Kamran Mehsood',
                                    fullName,
                                    style: kBodyText.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle: Text(
                                    // 'January 14, 2022',
                                    // postedDate.toString(),
                                    postedDate,
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
                                    // child: Text('A+'),
                                    child: Text(bloodGroup),
                                  ),
                                ),
                              ),
                              Container(
                                // height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.house,
                                                  color: Colors.green,
                                                  size: 30,
                                                ),
                                                SizedBox(width: 10),
                                                SizedBox(
                                                  width: 250,
                                                  child: Text(
                                                    // 'Civil Hospital',
                                                    hospitalName,
                                                    style: kBodyText.copyWith(
                                                        color: Colors.green),
                                                  ),
                                                ),
                                              ],
                                            ),
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
                                                // 'Peshawar',
                                                city,
                                                style: kBodyText.copyWith(
                                                    color: Colors.green),
                                              ),
                                            ],
                                          ),
                                          //
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.format_bold_rounded,
                                                color: Colors.red,
                                                size: 30,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                // '3',
                                                numberOfBloodBags,
                                                style: kBodyText.copyWith(
                                                    color: Colors.green),
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
                                        child: IconButton(
                                          onPressed: () async {
                                            // launch('tell://$phoneNumber');
                                            // await FlutterPhoneDirectCaller
                                            //     .callNumber(phoneNumber);
                                            // await launch(phoneNumber);

                                            //indirect phone call
                                            IndirectPhoneCall().openUrl(
                                                'tel://${phoneNumber}');
                                          },
                                          icon: Icon(
                                            Icons.call,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 30);
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                          'Plasma requests for ${widget.bloodGroup} are not available right now'),
                    );
                  }
                } else {
                  return Center(
                    // child: Text('Getting Error'),
                    // child: CircularProgressIndicator(),
                    child: SpinKitWave(
                      size: 30,
                      color: Colors.green,
                    ),
                  );
                }
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
