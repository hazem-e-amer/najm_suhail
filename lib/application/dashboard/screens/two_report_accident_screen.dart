import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:najm_suhail/application/dashboard/screens/location_report_accident_screen.dart';
import 'package:najm_suhail/application/dashboard/screens/three_report_accident_screen.dart';
import 'package:najm_suhail/utils/functions.dart';

import '../../home/widgets/app_bar_widget.dart';

class TwoReportAccidentScreen extends StatefulWidget {
  const TwoReportAccidentScreen({super.key});

  @override
  State<TwoReportAccidentScreen> createState() =>
      _TwoReportAccidentScreenState();
}

class _TwoReportAccidentScreenState extends State<TwoReportAccidentScreen> {
  TextEditingController? carFormNumberController = TextEditingController();
  TextEditingController? insuranceCompanyController = TextEditingController();
  TextEditingController? carPlateNumberController = TextEditingController();
  TextEditingController? carFormNumberOfTheOtherPartyController =
      TextEditingController();
  TextEditingController? carCompanyController = TextEditingController();
  TextEditingController? carModelController = TextEditingController();

  Future getPermission() async {
    LocationPermission locationPermission;
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    } else if (locationPermission == LocationPermission.whileInUse ||
        locationPermission == LocationPermission.always) {
      getCurrentLocation();
    }
  }

  Future getCurrentLocation() async {
    Functions.showLoaderFunction(context: context);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationReportAccidentScreen(
              latitude: position.latitude, longitude: position.longitude),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onTap: () async {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Primary questions',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.language,
                    color: Colors.green,
                  ),
                  Text(
                    'عربي',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
        ],
        backgroundColor: Colors.grey.withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 75.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please enter vehicle information:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Car form number',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: TextField(
                  controller: carFormNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.5, horizontal: 10.0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Text(
                'Insurance company',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: TextField(
                  controller: insuranceCompanyController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.5, horizontal: 10.0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Text(
                'Car plate number',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: TextField(
                  controller: carPlateNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.5, horizontal: 10.0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Text(
                'Car form number of the other party',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: TextField(
                  controller: carFormNumberOfTheOtherPartyController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.5, horizontal: 10.0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Text(
                'Car company',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: TextField(
                  controller: carCompanyController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.5, horizontal: 10.0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Text(
                'Car model',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: TextField(
                  controller: carModelController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.5, horizontal: 10.0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Share the accident location',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.green,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              GestureDetector(
                onTap: () async {
                  await getPermission();
                },
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Image.asset(
                    'assets/images/map.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThreeReportAccidentScreen(),
                      ));
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: 40.0, right: 100.0, left: 100.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: const Offset(0.0, 1.0),
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: const Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
