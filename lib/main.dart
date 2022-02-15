import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plasma_donor_app2/views/add_donor_screen.dart';
import 'package:plasma_donor_app2/views/add_plasma_request_screen.dart';
import 'package:plasma_donor_app2/views/blood_banks_screen.dart';
import 'package:plasma_donor_app2/views/blood_compatibility_screen.dart';
import 'package:plasma_donor_app2/views/blood_donors_screen.dart';
import 'package:plasma_donor_app2/views/contact_us_screen.dart';
import 'package:plasma_donor_app2/views/home_screen.dart';
import 'package:plasma_donor_app2/views/pages.dart';
import 'package:plasma_donor_app2/views/plasma_requests/plasma_requests_BG.dart';
import 'package:plasma_donor_app2/views/plasma_requests/plasma_requests_screen.dart';
import 'package:plasma_donor_app2/views/reminder_screen.dart';
import 'package:plasma_donor_app2/views/search_list_example.dart';
import 'package:plasma_donor_app2/views/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // // to show status bar
  // SystemChrome.setEnabledSystemUIOverlays([]);

  // to load splash screen for the first time only
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard =
      pref.getBool('seenOnboard') ?? false; //if null then set to false
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plasma donr app',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: seenOnboard == true ? SignInScreen() : OnBoardingPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => InitializerWidget(),
        'SignInScreen': (context) =>
            seenOnboard == true ? SignInScreen() : OnBoardingPage(),
        'ForgotPassword': (context) => ForgotPassword(),
        'CreateNewAccount': (context) => CreateNewAccount(),
        'HomeScreen': (context) => HomeScreen(),
        'AddDonorScreen': (context) => AddDonorScreen(),
        'PlasmaDonors': (context) => PlasmaDonorsScreenBG(),
        'PlasmaRequestScreen': (context) => AddPlasmaRequestScreen(),
        'PlasmaRequests': (context) => PlasmaRequestsBGScreen(),
        'PlasmaRequestsScreen': (context) => PlasmaRequestsScreen(),
        'ReminderScreen': (context) => ReminderScreen(),
        'BloodBanksScreen': (context) => BloodBanksScreen(),
        'ContactUsScreen': (context) => ContactUsScreen(),
        'BloodCompatibilityScreen': (context) => BloodCompatibilityScreen(),
        'SearchListExample': (context) => SearchListExample(),
      },
    );
  }
}

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);

  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth? _auth;

  User? _user;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _auth = FirebaseAuth.instance;
    _user = _auth?.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: SpinKitWave(
                size: 30,
                color: Colors.green,
              ),
            ),
          )
        : _user == null
            ? seenOnboard == true
                ? SignInScreen()
                : OnBoardingPage()
            : HomeScreen();
  }
}
