import 'package:flutter/cupertino.dart';
class OffTheKeyBoard {
 
/// Takes [context] and enables touch repel for keyboard.
  void offTheKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild.unfocus();
    }
  }
}
