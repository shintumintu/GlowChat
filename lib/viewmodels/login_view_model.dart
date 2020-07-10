import 'package:flutter/foundation.dart';
import 'package:glowchat/constants/route_names.dart';
import 'package:glowchat/services/authentiication_serivce.dart';
import 'package:glowchat/services/dialog_service.dart';
import 'package:glowchat/services/navigation_service.dart';

import '../locator.dart';
import 'base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  Future verify({
    @required String phoneNo,
  }) async {
    // ignore: missing_required_param
    _authenticationService.verifyPhone(
      phoneNo: phoneNo,
    );
    _navigationService
        .navigateTo(OtpViewRoute)
        .then((value) => print('signed in'));
  }

  Future<void> forgot({
    @required String email,
  }) async {
    _authenticationService.sendPasswordResetEmail(email: email);
    _dialogService.showDialog(
        title: 'Reset Password',
        description: 'A password reset link has beeen sent to' + email);
  }

  // ignore: missing_return
  Future<String> googleLogin() async {
    await _authenticationService.loginUserWithGoogle();
    _navigationService.navigateTo(HomeViewRoute);
  }

  void navigateToSignUP() {
    _navigationService.navigateTo(SignUpViewRoute);
  }

  void navigateToForgotPassword() {
    _navigationService.navigateTo(ForgotViewRoute);
  }

  void navigateBackToLogin() {
    _navigationService.navigateTo(LoginViewRoute);
  }

  void navigateToPhoneAuth() {
    _navigationService.navigateTo(PhoneViewRoute);
  }
}
