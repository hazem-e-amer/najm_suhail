import 'package:flutter/material.dart';
import 'package:najm_suhail/application/dashboard/screens/chat_screen.dart';

import 'package:najm_suhail/application/dashboard/screens/report_accident_screen.dart';
import 'package:najm_suhail/application/dashboard/screens/track_accident_report_screen.dart';

import '../../../utils/functions.dart';
import '../widgets/card_widget.dart';
import 'customer_service_faq_screen.dart';
import 'my_reports_screen.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
              onTap: () {
                Functions.showDialogFunction(
                  context: context,
                  data: 'Do you want to report an accident?',
                  onTapYes: () {
                    Navigator.of(context, rootNavigator: true)
                        .push(MaterialPageRoute(
                      builder: (context) => ReportAccidentScreen(),
                    ));
                  },
                );
              },
              child: const CardWidget(
                  icon: Icons.car_crash, data: 'Report accident')),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TrackAccidentReportScreen(),
                  ));
            },
            child: const CardWidget(
                icon: Icons.event_repeat_outlined,
                data: 'Track accident Report'),
          ),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
              onTap: () {
                Functions.showDialogFunction(
                  context: context,
                  data: 'Do you want to start a new chat?',
                  onTapYes: () {
                    Navigator.of(context, rootNavigator: true)
                        .push(MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ));
                  },
                );
              },
              child: const CardWidget(
                  icon: Icons.headset_mic, data: 'Start a live chat')),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyReportsScreen(),
                    ));
              },
              child: const CardWidget(
                  icon: Icons.book_outlined, data: 'My reports')),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerServiceFAQScreen(),
                    ));
              },
              child: const CardWidget(
                  icon: Icons.chat, data: 'Customer service FAQ')),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
