import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:najm_suhail/application/dashboard/screens/two_report_accident_screen.dart';

import '../../home/widgets/app_bar_widget.dart';

const List<String> oneGroupValueList = ['Yes', 'No'];

const List<String> twoGroupValueList = ['Yes', 'No'];

class ReportAccidentScreen extends StatefulWidget {
  const ReportAccidentScreen({super.key});

  @override
  State<ReportAccidentScreen> createState() => _ReportAccidentScreenState();
}

class _ReportAccidentScreenState extends State<ReportAccidentScreen> {
  String oneGroupValue = '';
  String twoGroupValue = '';
  TextEditingController? numberOfPartiesInvolvedInTheIncidentController =
      TextEditingController();

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
                'Are there any injuries in the accident?',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              RadioGroup<String>.builder(
                groupValue: oneGroupValue,
                onChanged: (value) => setState(() {
                  oneGroupValue = value ?? '';
                }),
                items: oneGroupValueList,
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
                fillColor: Colors.green,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Do you have valid insurance?',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              RadioGroup<String>.builder(
                groupValue: twoGroupValue,
                onChanged: (value) => setState(() {
                  twoGroupValue = value ?? '';
                }),
                items: oneGroupValueList,
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
                fillColor: Colors.green,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Please specify the number of parties involved in the incident.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
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
                  controller: numberOfPartiesInvolvedInTheIncidentController,
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TwoReportAccidentScreen(),
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
