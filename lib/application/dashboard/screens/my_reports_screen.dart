import 'package:flutter/material.dart';

import '../widgets/my_reports_screen_button_widget.dart';
import '../widgets/report_widget.dart';

const List<ReportWidget> previousReportsList = [
  ReportWidget(
    reportId: '3275',
    date: '12/6/2023',
    location: 'Prince Muhammad Ibn Saad Ibn Abdulaziz Rd, Riyadh 13511',
    decisionPercentage: '50',
    reasoning:
        'The 50% decision percentage was assigned to both John and Sarah due to shared fault in the accident. Both drivers contributed to the collision, with John needing to exercise additional caution and Sarah failing to yield. The decision aimed to distributed liability evenly between the two parties based on the available evidence.',
  ),
  ReportWidget(
    reportId: '9370',
    date: '4/1/2023',
    location: 'King Fahd Branch Rd, As Sahafah, Riyadh 13321',
    decisionPercentage: '',
    reasoning: '',
  ),
  ReportWidget(
    reportId: '8257',
    date: '23/9/2022',
    location: 'King Abdul Aziz Branch Rd, Al Aarid, Riyadh 13342',
    decisionPercentage: '',
    reasoning: '',
  ),
];

const List<ReportWidget> currentReportsList = [];

class MyReportsScreen extends StatefulWidget {
  const MyReportsScreen({super.key});

  @override
  State<MyReportsScreen> createState() => _MyReportsScreenState();
}

class _MyReportsScreenState extends State<MyReportsScreen> {
  bool previousReports = true;
  bool currentReports = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'My reports',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.green,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyReportsScreenButtonWidget(
                onTap: () {
                  setState(() {
                    previousReports = true;
                    currentReports = false;
                  });
                },
                isActive: previousReports,
                data: 'Previous reports'),
            MyReportsScreenButtonWidget(
                onTap: () {
                  setState(() {
                    previousReports = false;
                    currentReports = true;
                  });
                },
                isActive: currentReports,
                data: 'Current reports'),
          ],
        ),
        Visibility(
          visible: previousReports,
          child: Expanded(
            child: previousReportsList.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) => previousReportsList[index],
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5.0),
                    itemCount: previousReportsList.length,
                  )
                : const Center(
                    child: Text(
                      'No reports found',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.green,
                      ),
                    ),
                  ),
          ),
        ),
        Visibility(
          visible: currentReports,
          child: Expanded(
            child: currentReportsList.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) => currentReportsList[index],
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5.0),
                    itemCount: previousReportsList.length,
                  )
                : const Center(
                    child: Text(
                      'No reports found',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.green,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
