mixin ValidationMixin {
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email bos birakilamaz!';
    }
    if (value.length > 30) {
      return 'Email 30 karakterden buyuk olamaz!';
    }
    if (!value.contains('@')) {
      return 'Email formatinda olmali test@gmail.com!';
    }
    return null;
  }

  String? validateUserName(String? value) {
    if (value!.isEmpty) {
      return 'Kullanici adi bos birakilamaz!';
    }
    if (value.length > 20) {
      return 'Kullanici adi 20 karakterden uzun olamaz!';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Parola bos birakilamaz!';
    }
    if (value.length < 8) {
      return 'Parola 8 karakterden kucuk olamaz!';
    }

    // if (valueagain != value) {
    //   return 'Parolalar uyusmuyor';
    // }
    return null;
  }

  //?bu kisim diger validation icine atilabilir

  // String? validatePasswordAgain(String? value) {
  //   if (value!.isEmpty) {
  //     return 'Parola bos birakilamaz!';
  //   }
  //   if (value.length < 8) {
  //     return 'Parola 8 karakterden kucuk olamaz!';
  //   }
  //   if (validatePassword != value) {
  //     return 'Parolalar eslesmiyor!';
  //   }
  //   return null;
  // }
}
