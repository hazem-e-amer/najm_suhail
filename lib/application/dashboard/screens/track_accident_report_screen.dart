import 'package:flutter/material.dart';

import '../widgets/track_accident_report_widget.dart';

const List<TrackAccidentReportWidget> trackReportAccidentList = [
  TrackAccidentReportWidget(
    reportId: '3275',
    date: '12/6/2023',
    reportStatus: 'Submitted',
  ),
  TrackAccidentReportWidget(
    reportId: '9370',
    date: '4/1/2023',
    reportStatus: 'Under processing',
  ),
];

class TrackAccidentReportScreen extends StatefulWidget {
  const TrackAccidentReportScreen({super.key});

  @override
  State<TrackAccidentReportScreen> createState() =>
      _TrackAccidentReportScreenState();
}

class _TrackAccidentReportScreenState extends State<TrackAccidentReportScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => trackReportAccidentList[index],
      separatorBuilder: (_, index) => const SizedBox(
        height: 10.0,
      ),
      itemCount: trackReportAccidentList.length,
    );
  }
}
