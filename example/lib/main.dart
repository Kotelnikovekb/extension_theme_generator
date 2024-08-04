import 'package:example/theme/blue_theme.dart';
import 'package:example/theme/build_context_ext.dart';
import 'package:example/theme/dark_theme.dart';
import 'package:example/theme/light_theme.dart';
import 'package:flutter/material.dart';

import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData? themeData;

  @override
  void initState() {
    themeData=createLightTheme();
    super.initState();

  }

  void selectTheme(ThemeData data){
    setState(() {
      themeData=data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: HomePage(
        selectTheme: (data)=>selectTheme(data),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final Function(ThemeData data) selectTheme;
  const HomePage({super.key, required this.selectTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Demo Theme App'),
      ),
      backgroundColor: context.appColor.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select an application theme:',
              style: context.appText.header,
            ),
            ElevatedButton(
                onPressed: (){
                  widget.selectTheme(createLightTheme());
                },
                child: Text('Light Theme')
            ),
            ElevatedButton(
                onPressed: (){
                  widget.selectTheme(createDarkTheme());
                },
                child: Text('Dark Theme')
            ),
            ElevatedButton(
                onPressed: (){
                  widget.selectTheme(createBlueTheme());
                },
                child: Text('Blue Theme')
            ),
          ],
        ),
      ),
    );
  }
}
