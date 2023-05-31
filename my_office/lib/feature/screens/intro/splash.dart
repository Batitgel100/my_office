import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/public/globals.dart';
import 'package:my_office/feature/model/user_model.dart';
import 'package:my_office/feature/routes/routes.dart';
import 'package:my_office/service/user_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();

    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.width * 0.4,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 43, 43, 43),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(4, 6), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(90),
          ),
        ),
      ),
    );
  }
}

class SplashServices {
  Future<UserModel> getUserDate() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    final capturedContext = context; // Capture the current BuildContext

    getUserDate().then(
      (value) async {
        print(value.id.toString());

        if (value.id.toString() == 'null' || value.id.toString() == '') {
          await Future.delayed(const Duration(seconds: 1));
          Navigator.pushNamed(
              capturedContext, RoutesName.intro); // Use the captured context
        } else {
          if (Globals.isLogin == false) {
            await Future.delayed(const Duration(milliseconds: 100));
            Navigator.pushNamed(
                capturedContext, RoutesName.login); // Use the captured context
          } else if (Globals.isLogin == true) {
            Navigator.pushNamed(capturedContext,
                RoutesName.mainOwner); // Use the captured context
          }
        }
      },
    ).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
