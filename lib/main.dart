import 'package:flutter/material.dart';
import 'package:login_assignment/screens/home.dart';
import './screens/auth.dart';
import 'package:provider/provider.dart';
import './dummy_data.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DummyData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'JosefinSans',
        ),
        home: Consumer<DummyData>(
          builder: (_,dummy,ch) {
            return dummy.isAuth ? Home() : Auth();
          }
        ),
      ),
    );
  }
}
