class EmergencyMessageModel {
  final String emergencyType;
  final String locale;
  final String country;
  final bool withImage;

  EmergencyMessageModel(
      this.emergencyType, this.locale, this.country, this.withImage);

  @override
  String toString() {
    return !withImage
        ? "I am having a medical situation with $emergencyType in $locale, $country. Respond with a simple, clear, and actionable advice in the language for locale $locale and country $country. "
        : "Analyse the following attached image. The user is having a medical situation with $emergencyType in $locale, $country. Respond with a simple, clear, and actionable advice in the language for locale $locale and country $country. ";
  }
}
