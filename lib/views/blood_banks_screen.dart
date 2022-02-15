import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plasma_donor_app2/views/custom_drawer.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/background_image.dart';

import '../app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/indirectPhoneCall.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class BloodBanksScreen extends StatelessWidget {
  const BloodBanksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffoldkey = GlobalKey<ScaffoldState>();
    return Stack(
      children: [
        BackgroundImage(imgPath: 'assets/images/signin_bg_img.jpeg'),
        Scaffold(
          key: _scaffoldkey,
          drawer: CustomDrawer(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Blood Banks',
              style: kBodyText.copyWith(color: Colors.white),
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
                color: Colors.white,
              ),
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('BloodCompatibilityScreen');
                    },
                    icon: Icon(
                      Icons.info,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _scaffoldkey.currentState!.openDrawer();
                    },
                    icon: Icon(Icons.menu),
                  ),
                ],
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                  'Find out which Blood Banks are closer to you.',
                  style: kBodyText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Expanded(
                  // child: ListView.separated(
                  //     itemBuilder: (context, index) {
                  //       return BloodBankCard();
                  //     },
                  //     separatorBuilder: (context, index) {
                  //       return SizedBox(height: 10);
                  //     },
                  //     itemCount: 20),

                  //stream
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Blood Banks')
                        .snapshots(),
                    builder: (_,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        if (snapshot.data!.docs.isNotEmpty) {
                          return ListView.separated(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> docData =
                                  snapshot.data!.docs[index].data();
                              //
                              if (docData.isEmpty) {
                                return Text(
                                  'Document is empty',
                                  textAlign: TextAlign.center,
                                );
                              }
                              //
                              String bloodBankName = snapshot.data!.docs
                                  .elementAt(index)
                                  .get("bloodbankname");

                              //address
                              String address = snapshot.data!.docs
                                  .elementAt(index)
                                  .get("address");

                              //contact
                              String contact = snapshot.data!.docs
                                  .elementAt(index)
                                  .get("phoneNumber");
                              return BloodBankCard(
                                bloodBankname: bloodBankName,
                                address: address,
                                phoneNumber: contact,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 10);
                            },
                          );
                        } else {
                          return Center(
                            child: Text('No Blood Banks Found'),
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
          ),
        )
      ],
    );
  }
}

class BloodBankCard extends StatelessWidget {
  final String bloodBankname;
  final String address;
  final String phoneNumber;
  const BloodBankCard({
    Key? key,
    required this.bloodBankname,
    required this.address,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        constraints: BoxConstraints(
          minHeight: 50,
          minWidth: 100,
          maxHeight: 200,
          maxWidth: 240,
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name:',
                      style:
                          kBodyText.copyWith(color: Colors.black, fontSize: 16),
                    ),
                    // Text('Hamza Foundation'),
                    Container(
                      constraints: BoxConstraints(
                        minHeight: 50,
                        minWidth: 100,
                        maxHeight: 80,
                        maxWidth: 240,
                      ),
                      child: Text(
                        bloodBankname,
                        style: kBodyText.copyWith(
                            color: Colors.green, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address:',
                      style:
                          kBodyText.copyWith(color: Colors.black, fontSize: 16),
                    ),
                    // Text(
                    //     'Hamza Foundation, 33-F, khushal\nkhan khattak road, old bara\nroad, Peshawar, Pakistan.'),
                    Container(
                      constraints: BoxConstraints(
                        minHeight: 50,
                        minWidth: 100,
                        maxHeight: 80,
                        maxWidth: 240,
                      ),
                      child: Text(
                        address,
                        style: kBodyText.copyWith(
                            color: Colors.green, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Contact:',
                      style:
                          kBodyText.copyWith(color: Colors.black, fontSize: 16),
                    ),
                    // Text('03219006003'),
                    Text(
                      phoneNumber,
                      style:
                          kBodyText.copyWith(color: Colors.green, fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            //
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () async {
                      // var phoneNumber = '+923085401482';
                      // launch('tell://$phoneNumber');
                      // await FlutterPhoneDirectCaller.callNumber(phoneNumber);
                      // await launch(phoneNumber);

                      //indirect phone call
                      IndirectPhoneCall().openUrl('tel://${phoneNumber}');
                    },
                    icon: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
