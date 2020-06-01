import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xd/Screens/SplashScreen.dart';
import 'Widgets/BottomNavProvider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<BottomNavigationBarProvider>(
            create: (context) => BottomNavigationBarProvider(),
          ),
          ChangeNotifierProvider<FavoritesProvider>(
            create: (context) => FavoritesProvider(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.green,
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          toggleButtonsTheme: ToggleButtonsThemeData(
              borderColor: Colors.green, color: Colors.green),
          appBarTheme: AppBarTheme(
            elevation: 2,
            iconTheme: IconThemeData(
              color: Colors.green,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white, size: 20),
          accentColor: Colors.green,
          primarySwatch: Colors.green,
        ),
        home: SplashScreen());
  }
}
