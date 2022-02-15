import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plasma_donor_app2/app_styles.dart';
import 'package:plasma_donor_app2/views/custom_drawer.dart';
import 'package:plasma_donor_app2/widgets/signin_widgets/background_image.dart';
import 'package:plasma_donor_app2/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldkey =
        new GlobalKey<ScaffoldState>();

    //
    List homeScreenItemsNames = [
      'Add Donor',
      'Blood Donors',
      'Add Plasma Request',
      'Plasma Request',
      'Reminder',
      'Blood Banks',
      'Share App',
      'Contact Us',
    ];
    //
    List homeScreenItemsIcons = [
      Icons.person_add_alt_1_rounded,
      Icons.search,
      Icons.description_rounded,
      Icons.request_page,
      Icons.access_alarms_rounded,
      Icons.bloodtype_outlined,
      Icons.share_rounded,
      Icons.call,
    ];
    //
    List homeScreenRoutesNames = [
      'AddDonorScreen',
      'PlasmaDonors',
      'PlasmaRequestScreen',
      'PlasmaRequests',
      'ReminderScreen',
      'BloodBanksScreen',
      'SearchListExample',
      'ContactUsScreen',
    ];
    return Stack(
      children: [
        BackgroundImage(imgPath: 'assets/images/signin_bg_img.jpeg'),
        Scaffold(
          key: _scaffoldkey,
          drawer: CustomDrawer(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back_ios_new),
            //   color: kWhite,
            //   onPressed: () {},
            // ),
            title: Text(
              'Plasma Donor App',
              style: kBodyText,
            ),
            centerTitle: true,
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
          // body: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).pushNamed('AddDonorScreen');
          //           },
          //           child: HomeScreenItem(
          //             txt: 'Add Donor',
          //             icon: Icons.person_add_alt_1_rounded,
          //           ),
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).pushNamed('PlasmaDonors');
          //           },
          //           child: HomeScreenItem(
          //             txt: 'Blood Donors',
          //             icon: Icons.search,
          //           ),
          //         ),
          //       ],
          //     ),
          //     //
          //     SizedBox(height: size.width * 0.06),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         // SizedBox(width: size.width * 0.13),
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).pushNamed('PlasmaRequestScreen');
          //           },
          //           child: HomeScreenItem(
          //             txt: 'Add Blood\nRequest',
          //             icon: Icons.description_rounded,
          //           ),
          //         ),
          //         // SizedBox(width: size.width * 0.12),
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).pushNamed('PlasmaRequests');
          //           },
          //           child: HomeScreenItem(
          //             txt: 'Plasma Requests',
          //             icon: Icons.request_page,
          //           ),
          //         ),
          //         // SizedBox(width: size.width * 0.05),
          //       ],
          //     ),
          //     //
          //     SizedBox(height: size.width * 0.06),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).pushNamed('ReminderScreen');
          //           },
          //           child: HomeScreenItem(
          //             txt: 'Reminder',
          //             icon: Icons.access_alarms_rounded,
          //           ),
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).pushNamed('BloodBanksScreen');
          //           },
          //           child: HomeScreenItem(
          //             txt: 'Blood Banks',
          //             icon: Icons.bloodtype_outlined,
          //           ),
          //         ),
          //       ],
          //     ),
          //     //
          //     SizedBox(height: size.width * 0.06),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         HomeScreenItem(
          //           txt: 'Share App',
          //           icon: Icons.share_rounded,
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).pushNamed('ContactUsScreen');
          //           },
          //           child: HomeScreenItem(
          //             txt: 'Contact Us',
          //             icon: Icons.call,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),

          //new grid view for homescree
          body: Column(
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: GridView.count(
                  // physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.4,
                  padding:
                      EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
                  shrinkWrap: true,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  // mainAxisSpacing: 40,
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 2,

                  // crossAxisSpacing: 4.0,
                  // mainAxisSpacing: 0.0,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(homeScreenItemsNames.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(homeScreenRoutesNames[index]);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (ctx) => PlasmaRequestsScreen(
                        //         bloodGroup: bloodGroupList[index])));
                      },
                      child: HomeScreenItem(
                          txt: homeScreenItemsNames[index],
                          icon: homeScreenItemsIcons[index]),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
