
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar')
  ];

  /// No description provided for @from.
  ///
  /// In ar, this message translates to:
  /// **'من'**
  String get from;

  /// No description provided for @to.
  ///
  /// In ar, this message translates to:
  /// **'الى'**
  String get to;

  /// No description provided for @tripType.
  ///
  /// In ar, this message translates to:
  /// **'نوع الرحلة'**
  String get tripType;

  /// No description provided for @tripCategory.
  ///
  /// In ar, this message translates to:
  /// **'فئة الرحلة'**
  String get tripCategory;

  /// No description provided for @departurTime.
  ///
  /// In ar, this message translates to:
  /// **'الانطلاق'**
  String get departurTime;

  /// No description provided for @arriveTime.
  ///
  /// In ar, this message translates to:
  /// **'الوصول'**
  String get arriveTime;

  /// No description provided for @leave.
  ///
  /// In ar, this message translates to:
  /// **'الذهاب'**
  String get leave;

  /// No description provided for @back.
  ///
  /// In ar, this message translates to:
  /// **'العودة'**
  String get back;

  /// No description provided for @numOfPeople.
  ///
  /// In ar, this message translates to:
  /// **'عدد الاشخاص'**
  String get numOfPeople;

  /// No description provided for @adults.
  ///
  /// In ar, this message translates to:
  /// **'الكبار'**
  String get adults;

  /// No description provided for @kids.
  ///
  /// In ar, this message translates to:
  /// **'الاطفال'**
  String get kids;

  /// No description provided for @infants.
  ///
  /// In ar, this message translates to:
  /// **'الرضع'**
  String get infants;

  /// No description provided for @lessThanTwo.
  ///
  /// In ar, this message translates to:
  /// **'اصغر من سنتين'**
  String get lessThanTwo;

  /// No description provided for @between3and12.
  ///
  /// In ar, this message translates to:
  /// **'من ٢ الى ١٢ سنة'**
  String get between3and12;

  /// No description provided for @olderthan12.
  ///
  /// In ar, this message translates to:
  /// **'اكبر من ١٢ سنة'**
  String get olderthan12;

  /// No description provided for @searchWithApp.
  ///
  /// In ar, this message translates to:
  /// **'Done'**
  String get searchWithApp;

  /// No description provided for @useWhatsApp.
  ///
  /// In ar, this message translates to:
  /// **'Save route'**
  String get useWhatsApp;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
