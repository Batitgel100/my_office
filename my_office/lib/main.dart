// @dart=2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_office/feature2/screens/renter/main_screen.dart';
import 'package:my_office/repositories/repositories.dart';

import 'feature1/bloc/auth_bloc/auth.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: MyApp(userRepository: userRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      locale: const Locale('mn', 'MN'),
      theme: ThemeData(
        fontFamily: 'Rubik',
        // primarySwatch: AppColors.mainColor,
      ),
      home: const MainScreen(),
      // home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
      //   builder: (context, state) {
      //     if (state is AuthenticationAuthenticated) {
      //       return const MainScreen();
      //     }
      //     if (state is AuthenticationUnauthenticated) {
      //       return IntroPage(userRepository: userRepository);
      //     }
      //     if (state is AuthenticationLoading) {
      //       return Scaffold(
      //         body: Container(
      //           color: Colors.white,
      //           width: MediaQuery.of(context).size.width,
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: const <Widget>[
      //               SizedBox(
      //                 height: 25.0,
      //                 width: 25.0,
      //                 child: CircularProgressIndicator(
      //                   valueColor: AlwaysStoppedAnimation<Color>(
      //                       Style.Colors.mainColor),
      //                   strokeWidth: 4.0,
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       );
      //     }
      //     return Scaffold(
      //       body: Container(
      //         color: Colors.white,
      //         width: MediaQuery.of(context).size.width,
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: const <Widget>[
      //             SizedBox(
      //               height: 25.0,
      //               width: 25.0,
      //               child: CircularProgressIndicator(
      //                 valueColor:
      //                     AlwaysStoppedAnimation<Color>(Style.Colors.mainColor),
      //                 strokeWidth: 4.0,
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
