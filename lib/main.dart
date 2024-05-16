import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/view/Home_page.dart';
import 'package:platform_converter/view/call_page.dart';
import 'package:platform_converter/view/chat_page.dart';
import 'package:platform_converter/view/contact_page.dart';
import 'package:platform_converter/view/setting_page.dart';
import 'package:provider/provider.dart';
import 'controller/platform_change_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => platformProvider()),
      ],
      builder: (context, child) {
        return Consumer<platformProvider>(builder:
            (BuildContext context, platformProvider value, Widget? child) {
          if (value.isAndroid) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: (value.isTheme == false)
                  ? ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    )
                  : ThemeData.dark(),
              initialRoute: "/",
              routes: {
                "/": (context) => HomePage(),
                "contact": (context) => ContactPage(),
                "chat": (context) => ChatPage(),
                "call": (context) => CallPage(),
                "setting": (context) => SettingPage(),
              },
            );
          } else {
            return CupertinoApp(
              debugShowCheckedModeBanner: false,
              theme: (value.isTheme == false)
                  ? CupertinoThemeData(
                      barBackgroundColor: Colors.white,
                      brightness: Brightness.light)
                  : CupertinoThemeData(
                      barBackgroundColor: Colors.black,
                      brightness: Brightness.dark),
              initialRoute: "/",
              routes: {
                "/": (context) => HomePage(),
                "contact": (context) => ContactPage(),
                "chat": (context) => ChatPage(),
                "call": (context) => CallPage(),
                "setting": (context) => SettingPage(),
              },
            );
          }
        });
      },
    );
  }
}
