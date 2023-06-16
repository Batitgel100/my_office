import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_office/feature/public/globals.dart';
import 'package:my_office/feature/public/app_url.dart';
import 'package:my_office/feature/routes/routes.dart';
import 'package:my_office/service/network_api_service.dart';
import 'package:my_office/feature/model/user_model.dart';
import 'package:my_office/service/user_view_model.dart';
import 'package:my_office/feature/utils/utils.dart';
import 'package:provider/provider.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPint, data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Future<dynamic> signUpApi(dynamic data) async {
  //   try {
  //     dynamic response = await _apiServices.getPostApiResponse(
  //         AppUrl.registerApiEndPoint, data);
  //     return response;
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}

abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);
}

bool isEmpty = false;
bool wrong = false;

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) {
      if (value['status']) {
        log('*** ${value['data']['firstname']} нэвтэрлээ ***');

        // var inGmail = '';

        var inFirstname = '';

        var inLastname = '';
        var inPhoneNumber = '';
        var inRegister = '';
        var inEmail = '';
        var inAddress = '';
        var inUserId = '';
        if (value['data']['firstname'] != null) {
          inFirstname = value['data']['firstname'];
        }
        if (value['data']['lastname'] != null) {
          inLastname = value['data']['lastname'];
        }
        if (value['data']['phone'] != null) {
          inPhoneNumber = value['data']['phone'];
        }
        if (value['data']['firstname'] != null) {
          inAddress = value['data']['address'];
        }
        if (value['data']['register'] != null) {
          inRegister = value['data']['register'];
        }
        if (value['data']['email'] != null) {
          inEmail = value['data']['email'];
        } else {
          inEmail = 'емайл оруулаагүй';
        }
        if (value['data']['id'] != null) {
          inUserId = value['data']['id'].toString();
        }

        // Globals.changeGmail(inGmail);
        Globals.changeUserId(inUserId);

        Globals.changeFirstName(inFirstname);
        Globals.changeAddress(inAddress);
        Globals.changeGmail(inEmail);
        Globals.changeUserPhone(inPhoneNumber);
        Globals.changeRegister(inRegister);
        Globals.changeLastName(inLastname);

        setLoading(false);

        final userPreference =
            Provider.of<UserViewModel>(context, listen: false);
        userPreference.saveUser(UserModel(id: value['data']['id'].toString()));

        Utils.flushBarSuccessMessage('Амжилттай нэвтэрлээ', context);
        Globals.changeIsLogin(true);
        // print(Globals.isLogin);
        Navigator.pushNamed(context, RoutesName.mainOwner);
      } else {
        Utils.flushBarErrorMessage(
            'Хэрэглэгчийн нэр эсвэл нууц үг буруу байна!!!', context);
        wrong = true;
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
