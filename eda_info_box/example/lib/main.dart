import 'package:eda_info_box/eda_info_box.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'EDA INFO BOX',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EDA INFO BOX'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Loading Position',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            ...LoadingPosition.values.map(
              (position) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: EdaInfoBox(
                  isVisible: true,
                  info: position.name,
                  severity: InfoSeverity.loading,
                  position: position,
                ),
              ),
            ),
            const Text(
              'Info Severity',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            ...InfoSeverity.values.map(
              (severity) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: EdaInfoBox(
                  isVisible: true,
                  info: severity.name,
                  severity: severity,
                ),
              ),
            ),
            const Text(
              'With Action Button',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            ...InfoSeverity.values.map(
              (severity) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: EdaInfoBox(
                  isVisible: true,
                  info: 'With Action',
                  subInfo: 'when onActionTap is provided',
                  severity: severity,
                  onActionTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
