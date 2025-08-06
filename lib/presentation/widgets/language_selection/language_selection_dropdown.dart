import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleOption {
  final String code;
  final String language;
  final String country;
  final String flag;

  LocaleOption({
    required this.code,
    required this.language,
    required this.country,
    required this.flag,
  });
}

class LanguageSelectionDropdownWidget extends StatefulWidget {
  final Function(String)? onLocaleChanged;

  const LanguageSelectionDropdownWidget({
    Key? key,
    this.onLocaleChanged,
  }) : super(key: key);

  @override
  _LanguageSelectionDropdownWidgetState createState() =>
      _LanguageSelectionDropdownWidgetState();
}

class _LanguageSelectionDropdownWidgetState
    extends State<LanguageSelectionDropdownWidget> {
  String? _selectedLocale;
  String? _selectedCountry;
  static const String _prefsKey = 'selected_locale';
  static const String _prefsKeyCountry = 'selected_country';

  // Default locale options - starts with EN and UK as requested
  final List<LocaleOption> _localeOptions = [
    LocaleOption(
        code: 'en-US',
        language: 'English',
        country: 'United States',
        flag: '🇺🇸'),
    LocaleOption(
        code: 'en-GB',
        language: 'English',
        country: 'United Kingdom',
        flag: '🇬🇧'),
    LocaleOption(
        code: 'en-CA', language: 'English', country: 'Canada', flag: '🇨🇦'),
    LocaleOption(
        code: 'en-AU', language: 'English', country: 'Australia', flag: '🇦🇺'),
    LocaleOption(
        code: 'es-ES', language: 'Español', country: 'Spain', flag: '🇪🇸'),
    LocaleOption(
        code: 'es-MX', language: 'Español', country: 'Mexico', flag: '🇲🇽'),
    LocaleOption(
        code: 'fr-FR', language: 'Français', country: 'France', flag: '🇫🇷'),
    LocaleOption(
        code: 'fr-CA', language: 'Français', country: 'Canada', flag: '🇨🇦'),
    LocaleOption(
        code: 'de-DE', language: 'Deutsch', country: 'Germany', flag: '🇩🇪'),
    LocaleOption(
        code: 'de-AT', language: 'Deutsch', country: 'Austria', flag: '🇦🇹'),
    LocaleOption(
        code: 'it-IT', language: 'Italiano', country: 'Italy', flag: '🇮🇹'),
    LocaleOption(
        code: 'pt-BR', language: 'Português', country: 'Brazil', flag: '🇧🇷'),
    LocaleOption(
        code: 'pt-PT',
        language: 'Português',
        country: 'Portugal',
        flag: '🇵🇹'),
    LocaleOption(
        code: 'ru-RU', language: 'Русский', country: 'Russia', flag: '🇷🇺'),
    LocaleOption(
        code: 'ja-JP', language: '日本語', country: 'Japan', flag: '🇯🇵'),
    LocaleOption(
        code: 'ko-KR', language: '한국어', country: 'South Korea', flag: '🇰🇷'),
    LocaleOption(code: 'zh-CN', language: '中文', country: 'China', flag: '🇨🇳'),
    LocaleOption(
        code: 'zh-TW', language: '中文', country: 'Taiwan', flag: '🇹🇼'),
    LocaleOption(
        code: 'ar-SA',
        language: 'العربية',
        country: 'Saudi Arabia',
        flag: '🇸🇦'),
    LocaleOption(
        code: 'hi-IN', language: 'हिन्दी', country: 'India', flag: '🇮🇳'),
    LocaleOption(
        code: 'nl-NL',
        language: 'Nederlands',
        country: 'Netherlands',
        flag: '🇳🇱'),
    LocaleOption(
        code: 'sv-SE', language: 'Svenska', country: 'Sweden', flag: '🇸🇪'),
    LocaleOption(
        code: 'da-DK', language: 'Dansk', country: 'Denmark', flag: '🇩🇰'),
    LocaleOption(
        code: 'pl-PL', language: 'Polski', country: 'Poland', flag: '🇵🇱'),
    LocaleOption(
        code: 'tr-TR', language: 'Türkçe', country: 'Turkey', flag: '🇹🇷'),
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedLocale();
  }

  // Load saved locale from SharedPreferences
  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString(_prefsKey);
    final savedLocaleCountry = prefs.getString(_prefsKeyCountry);

    setState(() {
      // Default to en-US if no saved preference, ensuring it's in our options list
      _selectedLocale = savedLocale ?? 'en-GB';
      _selectedCountry = savedLocaleCountry ?? 'United Kingdom';
    });
  }

  // Save locale to SharedPreferences
  Future<void> _saveLocale(String locale, String country) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, locale);
    await prefs.setString(_prefsKeyCountry, country);
    // Notify parent widget of the change
    if (widget.onLocaleChanged != null) {
      widget.onLocaleChanged!(locale);
    }
  }

  // Handle locale selection
  void _onLocaleSelected(String? localeCode) {
    if (localeCode != null && localeCode != _selectedLocale) {
      setState(() {
        _selectedLocale = localeCode;
        _selectedCountry = _selectedLocaleOption?.country ?? 'United Kingdom';
      });
      _saveLocale(localeCode, _selectedCountry!);
    }
  }

  // Get the currently selected locale option
  LocaleOption? get _selectedLocaleOption {
    return _localeOptions.firstWhere(
      (option) => option.code == _selectedLocale,
      orElse: () => _localeOptions.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: UIConstants.mediumSize),
      child: kIsWeb
          ?Center(
            child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedLocale,
                        isExpanded: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onChanged: _onLocaleSelected,
                        items: _localeOptions
                            .map<DropdownMenuItem<String>>((LocaleOption option) {
                          return DropdownMenuItem<String>(
                            value: option.code,
                            child: Row(
                              children: [
                                Text(
                                  option.flag,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        option.language,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        option.country,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
              ),
          )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Language is set to:",
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedLocale,
                      isExpanded: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onChanged: _onLocaleSelected,
                      items: _localeOptions
                          .map<DropdownMenuItem<String>>((LocaleOption option) {
                        return DropdownMenuItem<String>(
                          value: option.code,
                          child: Row(
                            children: [
                              Text(
                                option.flag,
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      option.language,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      option.country,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
