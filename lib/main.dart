import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providersample/screens/weight_screen.dart';
import 'package:providersample/state/weight_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: WeightScreen(),
        ),
        providers: [
          ChangeNotifierProvider(create: (context) => WeightState()),
        ]);
  }
}
