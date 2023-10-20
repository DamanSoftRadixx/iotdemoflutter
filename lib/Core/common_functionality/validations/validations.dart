bool isValidPassword({required String password}){
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(password);
}