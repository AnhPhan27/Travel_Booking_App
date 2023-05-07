enum SpeciesType {
  PASSWORD_1,
  PASSWORD_2,
  PASSWORD_3,
  PASSWORD_4,
  PASSWORD_5,
  EMAIL,
  CONFIRM_PASSWORD_1,
  PHONE_NO_1,
  USERNAME,
  USERNAME1,
}

final _pattern = <SpeciesType, List<dynamic>>{
  SpeciesType.EMAIL: [
    r"^[a-zA-Z0-9.a-z0-9.\-_]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,256}$",
    "Enter a valid email"
  ],
  SpeciesType.PHONE_NO_1: [
    r'^[\\+]?(\\d{3,5}\\s\\d{3}\\s\\d{3}\\s\\d{3})$',
    "Enter correct phone number"
  ],
  SpeciesType.PASSWORD_1: [
    r'^[a-zA-Z0-9!@#\\$%\\^\\&*\\)\\(+=._-]{3,30}$',
    "Password at least 3 characters"
  ],
  SpeciesType.CONFIRM_PASSWORD_1: [
    r'^[a-zA-Z0-9!@#\\$%\\^\\&*\\)\\(+=._-]{3,30}$',
    "Enter correct password"
  ],
  SpeciesType.PASSWORD_2: [
    r'^(?=.*?[a-z])(?=.*?[0-9]).{8,20}$',
    "Mật khẩu bắt buộc từ 8 đến 20 ký tự, có ít nhất 1 ký tự chữ/số"
  ],
  SpeciesType.PASSWORD_3: [
    r'^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$',
    "Mật khẩu bắt buộc từ 8 đến 20 ký tự, có ít nhất 1 ký tự in hoa, 1 ký tự chữ/số"
  ],
  SpeciesType.PASSWORD_4: [
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$',
    "Mật khẩu bắt buộc từ 8 đến 20 ký tự, có ít nhất 1 ký tự in hoa, 1 ký tự chữ/số"
  ],
  SpeciesType.PASSWORD_5: [r'^[0-9]{2,6}$', "Chỉ chứa kí tự số"],
  SpeciesType.USERNAME: [
    r'^([a-zA-Z0-9\.\-\@]{3,50})$',
    "Name can only use letters,numbers, minimum length is 3 characters"
  ],
};

class NPValidator {
  static String? error(String? value, SpeciesType type, {int? max, int? min}) {
    if (value == null || value.trim().isEmpty) {
      return "UserName and Password don't be blank";
    }

    RegExp regExp = RegExp(_pattern[type]![0] as String);

    // if (max != null && value.length >= max) {
    //   return "Nhập tối đa $max";
    // } else if (min != null && value.length < min) {
    //   return "Nhập tối thiếu $min";
    // } else if (min != null && value.isEmpty) {
    //   return "Không được để trống";
    // } else if (max != null && value.length <= max && regExp.hasMatch(value)) {
    //   return null;
    // } else if (min != null && value.length >= min && regExp.hasMatch(value)) {
    //   return null;
    // }
    if (regExp.hasMatch(value)) {
      return null;
    } else {
      return _pattern[type]![1];
    }
    // RegExp regExp = RegExp(_pattern[type]![0] as String);
    // if (regExp.hasMatch(value)) {
    //   return null;
    // }
    // return _pattern[type]![1];
  }
}

class NPValidatorReal {
  static bool error(String value, SpeciesType type) {
    RegExp regExp = RegExp(_pattern[type]![0] as String);
    if (regExp.hasMatch(value)) {
      return true;
    }
    return false;
  }
}

class EmailAndPhoneValidator {
  static String? error(String? value, SpeciesType type, {int? max, int? min}) {
    if (value == null || value.trim().isEmpty) {
      return "Email and Phone don't be blank";
    }

    RegExp regExp = RegExp(_pattern[type]![0] as String);

    if (regExp.hasMatch(value)) {
      return null;
    } else {
      return _pattern[type]![1];
    }
  }
}

class SignUpScreenValidator {
  static String? error(String? value, SpeciesType type, {int? max, int? min}) {
    if (value == null || value.trim().isEmpty) {
      return "User name, Email, Password don't be blank";
    }

    RegExp regExp = RegExp(_pattern[type]![0] as String);

    if (regExp.hasMatch(value)) {
      return null;
    } else {
      return _pattern[type]![1];
    }
  }
}
