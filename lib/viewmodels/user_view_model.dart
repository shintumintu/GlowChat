import 'package:glowchat/constants/user.dart';
import 'package:glowchat/locator.dart';
import 'package:glowchat/services/firestore_service.dart';
import 'package:glowchat/viewmodels/base_model.dart';

class UserViewModel extends BaseModel {
 
  final FirestoreService _firestoreService = locator<FirestoreService>();

  User _currentUser;
  User get currentUser => _currentUser;

  void listenToUserdetails() {
    _firestoreService.listenToPostRealtime().listen((userData) {
    });
  }
}
