import 'package:flutter/cupertino.dart';

dismissKeyboard(){
  FocusManager.instance.primaryFocus?.unfocus();
}