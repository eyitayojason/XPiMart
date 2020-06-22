import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xd/Pages&Screens/HomePage.dart';
import 'package:xd/Widgets/CustomSliverlist.dart';
import 'Models/ProductsModel.dart';
import 'Pages&Screens/CategoryListPage2.dart';
import 'Pages&Screens/Favorites.dart';
import 'Pages&Screens/LoginPage.dart';
import 'Pages&Screens/LoginScreen.dart';
import 'Pages&Screens/MessagesPage.dart';
import 'Pages&Screens/PostAdPage.dart';
import 'Pages&Screens/ProductDetails.dart';
import 'Pages&Screens/ProfilePage.dart';
import 'Pages&Screens/SignUpPage.dart';
import 'Pages&Screens/SplashScreen.dart';
import 'Pages&Screens/categorylist_page.dart';
import 'Services&Providers/Authentication.dart';
import 'Services&Providers/FirestoreService.dart';
import 'Services&Providers/Provider.dart';
import 'Services&Providers/SignupValidation.dart';
import 'Services&Providers/products_provider.dart';

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
          lazy: true,
          catchError: (context, error) {
            return (error);
          },
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
          CustomSliverList.id: (context) => CustomSliverList().build(context),
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
