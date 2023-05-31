import 'package:flutter/material.dart';
import 'package:my_office/service/auth.dart';
import 'package:my_office/feature/routes/routes.dart';
import 'package:my_office/service/user_view_model.dart';
import 'package:provider/provider.dart';

import 'feature/screens/owner/main_screen_owner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        onGenerateRoute: Routes.generateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreenOwner(),
        // initialRoute: RoutesName.splash,
      ),
    );
  }
}
