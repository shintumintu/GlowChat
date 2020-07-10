import 'package:glowchat/constants/route_names.dart';
import 'package:glowchat/services/authentiication_serivce.dart';
import 'package:glowchat/services/navigation_service.dart';
import '../locator.dart';
import 'base_model.dart';

class SplashScreenViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }
}