import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xd/Screens/CategoryListPage2.dart';
import 'package:xd/Screens/Favorites.dart';
import 'package:xd/Screens/HomePage.dart';
import 'package:xd/Screens/LoginPage.dart';
import 'package:xd/Screens/LoginScreen.dart';
import 'package:xd/Screens/MessagesPage.dart';
import 'package:xd/Screens/PostAdPage.dart';
import 'package:xd/Screens/ProductDetails.dart';
import 'package:xd/Screens/ProfilePage.dart';
import 'package:xd/Screens/SignUpPage.dart';
import 'package:xd/Screens/SplashScreen.dart';
import 'package:xd/Screens/categorylist_page.dart';
import 'package:xd/VALIDATION/SignupValidation.dart';
import 'package:xd/Widgets/Models/ProductsModel.dart';

import 'Widgets/services/FirestoreService.dart';
import 'Widgets/services/products_provider.dart';
import 'Widgets/Provider.dart';
import 'Widgets/services/Authentication.dart';

void main() => runApp(MyApp());
final auth = FirebaseAuth.instance;
final db = FireStoreService();
FirebaseUser user;
//bool loggedIn = user != null;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationBarProvider>(
          create: (context) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider<FavoritesProvider>(
          create: (context) => FavoritesProvider(),
        ),
        ChangeNotifierProvider<Authentication>(
          create: (context) => Authentication(),
        ),
        ChangeNotifierProvider<Validation>(
          create: (context) => Validation(),
        ),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        StreamProvider<FirebaseUser>.value(
          value: FirebaseAuth.instance.onAuthStateChanged,
        ),
        StreamProvider<List<FireStoreProducts>>.value(
          value: db.streamProducts(),
        )
      ],
      child: MaterialApp(
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

        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          LoginPage.id: (context) => LoginPage(),
          SignUpPage.id: (context) => SignUpPage(),
          HomePage.id: (context) => HomePage(),
          ProfilePage.id: (context) => ProfilePage(),
          MessagesPage.id: (context) => MessagesPage(),
          PostAdPage.id: (context) => PostAdPage(),
          FavoritesPage.id: (context) => FavoritesPage(),
          ProductDetails.id: (context) => ProductDetails(),
          CategoryListPage.id: (context) => CategoryListPage(),
          CategoryListPage2.id: (context) => CategoryListPage2(),
        },
        // home: SplashScreen());
      ),
    );
  }
}
