import 'package:eda_text_icon/eda_text_icon.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EDA TEXT ICON',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: light ? Brightness.light : Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EDA TEXT ICON'),
          actions: [
            Switch(
              value: light,
              onChanged: (value) => setState(() => light = !light),
            )
          ],
        ),
        body: Center(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              EdaTextIcon(
                text: 'EDA',
                icon: Icons.account_circle_outlined,
              ),
              EdaTextIcon(
                text: 'EDA',
                showBorder: true,
              ),
              EdaTextIcon(
                text: 'EDA',
                onPressed: () {},
              ),
              EdaTextIcon(
                text: 'EDA',
                onPressed: () {},
                showBorder: true,
              ),
              EdaTextIcon(
                header: 'Head',
                text: 'EDA',
                onPressed: () {},
              ),
              EdaTextIcon(
                header: 'Head',
                text: 'EDA',
                onPressed: () {},
                showBorder: true,
              ),
              EdaTextIcon(
                text: 'EDA',
                icon: Icons.account_circle_outlined,
                onPressed: () {},
                showBorder: true,
                action: const [
                  Icon(Icons.person_outlined),
                  Icon(Icons.lock_clock_outlined),
                ],
              ),
              EdaTextIcon(
                text: 'EDA',
                icon: Icons.account_circle_outlined,
                onPressed: () {},
                showBorder: true,
                actionDirection: Axis.vertical,
                action: const [
                  Icon(Icons.person_outlined),
                  Icon(Icons.lock_clock_outlined),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
