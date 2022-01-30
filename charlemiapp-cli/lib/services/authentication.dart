import 'package:charlemiapp_cli/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _toAppUser(user!, null);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future register(String email, String password, String lastName, String firstName, String phone,
      String carteEtu) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _toAppUser(user!, <String>[lastName, firstName, phone, carteEtu]);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _toAppUser(user!, null);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<AppUser?> _toAppUser(User? user, List? params) async {
    AppUser _user = params == null ? AppUser(uid: user!.uid) : AppUser(uid: user!.uid,
        lastName: params[0],
        firstName: params[1],
        phone: params[2],
        carteEtudiant: params[3]);
    var exists = await _user.init();
    if (exists) {
      return _user;
    } else if (params != null) {
      await _user.store(params[0], params[1], params[2], params[3], null, false);
      return _user;
    }
    return null;
  }

Stream<AppUser?> get user {
  return _auth.authStateChanges().asyncMap((v) async => await _toAppUser(v, null));
}

static String? validateEmail
(

String? value
) {
String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
RegExp regex = RegExp(pattern);
if (value == null || value.isEmpty || !regex.hasMatch(value)) {
return 'Enter a valid email address';
} else {
return null;
}
}

static String? validatePassword
(

String password, String
?
passwordConfirm) {
if (password.length < 6) {
return 'Password must be at least 6 characters';
} else if (passwordConfirm != null && password != passwordConfirm) {
return 'Passwords do not match';
} else {
return null;
}
}

static String? validateNumTel
(

String? value
) {
String pattern = r"^[0-9]{10}$";
RegExp regex = RegExp(pattern);
if (value == null || value.isEmpty || !regex.hasMatch(value)) {
return 'Enter a valid phone number';
} else {
return null;
}
}

static String? validateCarteEtu
(

String? value
) {
String pattern = r"^[0-9]{8}$";
RegExp regex = RegExp(pattern);
if (value == null || value.isEmpty || !regex.hasMatch(value)) {
return 'Enter a valid student card number';
} else {
return null;
}
}
}
