class AppConstants {
  static const AppLogoHeroTag = 'main_logo';
  static const termsAndConditionsUrl =
      'https://billmart.com/terms-conditions.html';
  static const privacyPolicy = 'https://www.billmart.com/privacy-policy.html';
}

enum Entity {
  admin,
  businessUser,
  financier,
  cA,
  facilitator,
}

extension EntityValue on Entity {
  int get value {
    switch (this) {
      case Entity.admin:
        return 1;
      case Entity.businessUser:
        return 2;
      case Entity.financier:
        return 4;
      case Entity.cA:
        return 8;
      case Entity.facilitator:
        return 16;
      default:
        return 0;
    }
  }
}
