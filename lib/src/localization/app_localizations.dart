
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
  /// **'الأنطلاق'**
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

  /// No description provided for @returnDate.
  ///
  /// In ar, this message translates to:
  /// **'موعد العودة'**
  String get returnDate;

  /// No description provided for @dapatureDate.
  ///
  /// In ar, this message translates to:
  /// **'موعد الذهاب'**
  String get dapatureDate;

  /// No description provided for @numOfPeople.
  ///
  /// In ar, this message translates to:
  /// **'عدد الأشخاص'**
  String get numOfPeople;

  /// No description provided for @adults.
  ///
  /// In ar, this message translates to:
  /// **'الكبار'**
  String get adults;

  /// No description provided for @kids.
  ///
  /// In ar, this message translates to:
  /// **'الأطفال'**
  String get kids;

  /// No description provided for @travelers.
  ///
  /// In ar, this message translates to:
  /// **'المسافرين'**
  String get travelers;

  /// No description provided for @infants.
  ///
  /// In ar, this message translates to:
  /// **'الرضع'**
  String get infants;

  /// No description provided for @lessThanTwo.
  ///
  /// In ar, this message translates to:
  /// **'أصغر من سنتين'**
  String get lessThanTwo;

  /// No description provided for @between3and12.
  ///
  /// In ar, this message translates to:
  /// **'من ٢ الى ١٢ سنة'**
  String get between3and12;

  /// No description provided for @olderthan12.
  ///
  /// In ar, this message translates to:
  /// **'أكبر من ١٢ سنة'**
  String get olderthan12;

  /// No description provided for @tukishAirline.
  ///
  /// In ar, this message translates to:
  /// **'الخطوط التركية'**
  String get tukishAirline;

  /// No description provided for @iraqiAirline.
  ///
  /// In ar, this message translates to:
  /// **'الخطوط الجوية العراقية'**
  String get iraqiAirline;

  /// No description provided for @flyBaghdad.
  ///
  /// In ar, this message translates to:
  /// **'فلاي بغداد'**
  String get flyBaghdad;

  /// No description provided for @shamWings.
  ///
  /// In ar, this message translates to:
  /// **'أجنحة الشام'**
  String get shamWings;

  /// No description provided for @lebanonAirline.
  ///
  /// In ar, this message translates to:
  /// **'الخطوط اللبنانية'**
  String get lebanonAirline;

  /// No description provided for @pleaseSelectAirlines.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء إختيار الخطوط الجوية المناسبة لك'**
  String get pleaseSelectAirlines;

  /// No description provided for @all.
  ///
  /// In ar, this message translates to:
  /// **'الكل'**
  String get all;

  /// No description provided for @pleaseSelectOneAirline.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء قم بتحديد خطوط جوية واحدة على الأقل'**
  String get pleaseSelectOneAirline;

  /// No description provided for @next.
  ///
  /// In ar, this message translates to:
  /// **'التالي'**
  String get next;

  /// No description provided for @economic.
  ///
  /// In ar, this message translates to:
  /// **'إقتصادي'**
  String get economic;

  /// No description provided for @bussines.
  ///
  /// In ar, this message translates to:
  /// **'رجال اعمال'**
  String get bussines;

  /// No description provided for @depatrueCiry.
  ///
  /// In ar, this message translates to:
  /// **'مدينة الأنطلاق'**
  String get depatrueCiry;

  /// No description provided for @returnCiry.
  ///
  /// In ar, this message translates to:
  /// **'مدينة الوصول'**
  String get returnCiry;

  /// No description provided for @oneWay.
  ///
  /// In ar, this message translates to:
  /// **'ذهاب فقط'**
  String get oneWay;

  /// No description provided for @round.
  ///
  /// In ar, this message translates to:
  /// **'ذهاب وإياب'**
  String get round;

  /// No description provided for @contactThroughWhatsApp.
  ///
  /// In ar, this message translates to:
  /// **'تواصل مباشر من خلال الواتساب'**
  String get contactThroughWhatsApp;

  /// No description provided for @searchThroughApp.
  ///
  /// In ar, this message translates to:
  /// **'بحث خلال التطبيق'**
  String get searchThroughApp;

  /// No description provided for @pleaseSelectType.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء إختيار نوع الرحلة'**
  String get pleaseSelectType;

  /// No description provided for @pleaseSelectCategory.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء إختيار فئة الرحلة'**
  String get pleaseSelectCategory;

  /// No description provided for @pleaseSelectDepartureDate.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء إختيار موعد السفر'**
  String get pleaseSelectDepartureDate;

  /// No description provided for @pleaseSelectReturnDate.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء إختيار موعد العودة'**
  String get pleaseSelectReturnDate;

  /// No description provided for @pleaseSelectArriveCity.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء إختيار الوجهة'**
  String get pleaseSelectArriveCity;

  /// No description provided for @pleaseSelectDepartureCity.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء إختيار مدينة الانطلاق'**
  String get pleaseSelectDepartureCity;

  /// No description provided for @returnDateShouldBeAfterAtLeastOneDay.
  ///
  /// In ar, this message translates to:
  /// **'يجب ان يكون موعد العودة على الأقل بعد يوم من موعد الذهاب'**
  String get returnDateShouldBeAfterAtLeastOneDay;

  /// No description provided for @pleaseWait.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء الأنتظار'**
  String get pleaseWait;

  /// No description provided for @searchingTripsForYou.
  ///
  /// In ar, this message translates to:
  /// **'جاري البحث عن رحلات تناسب طلبك'**
  String get searchingTripsForYou;

  /// No description provided for @mightTakeFiveToFifteen.
  ///
  /// In ar, this message translates to:
  /// **'قد يستغرق الامر من ٥ الى ١٥ دقيقة'**
  String get mightTakeFiveToFifteen;

  /// No description provided for @youllBeNotified.
  ///
  /// In ar, this message translates to:
  /// **'سوف يتم تنبيهك عند وصول نتيجة'**
  String get youllBeNotified;

  /// No description provided for @checkInternet.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء التأكد من اتصالك بالأنترنت والمحاولة مرة اخرى'**
  String get checkInternet;

  /// No description provided for @tryAgain.
  ///
  /// In ar, this message translates to:
  /// **'إعادة المحاولة'**
  String get tryAgain;

  /// No description provided for @errorWhileSending.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطا أثناء البحث عن رحلات'**
  String get errorWhileSending;

  /// No description provided for @unknownError.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ غير معروف'**
  String get unknownError;

  /// No description provided for @bookNow.
  ///
  /// In ar, this message translates to:
  /// **'احجز الان'**
  String get bookNow;

  /// No description provided for @baghdad.
  ///
  /// In ar, this message translates to:
  /// **'بغداد'**
  String get baghdad;

  /// No description provided for @damascus.
  ///
  /// In ar, this message translates to:
  /// **'دمشق'**
  String get damascus;

  /// No description provided for @beirut.
  ///
  /// In ar, this message translates to:
  /// **'بيروت'**
  String get beirut;

  /// No description provided for @cairo.
  ///
  /// In ar, this message translates to:
  /// **'القاهرة'**
  String get cairo;

  /// No description provided for @amman.
  ///
  /// In ar, this message translates to:
  /// **'عمان'**
  String get amman;

  /// No description provided for @istanbulAtaturk.
  ///
  /// In ar, this message translates to:
  /// **'اسطنبول اتاتورك'**
  String get istanbulAtaturk;

  /// No description provided for @istanbulSabiha.
  ///
  /// In ar, this message translates to:
  /// **'اسطنبول صبيحة'**
  String get istanbulSabiha;

  /// No description provided for @searchResults.
  ///
  /// In ar, this message translates to:
  /// **'نتائج البحث'**
  String get searchResults;

  /// No description provided for @totalCost.
  ///
  /// In ar, this message translates to:
  /// **'التكلفة الكلية'**
  String get totalCost;

  /// No description provided for @forOnePerson.
  ///
  /// In ar, this message translates to:
  /// **'للشخص'**
  String get forOnePerson;

  /// No description provided for @payWithZaincash.
  ///
  /// In ar, this message translates to:
  /// **'الدفع من خلال زين كاش'**
  String get payWithZaincash;

  /// No description provided for @directPayment.
  ///
  /// In ar, this message translates to:
  /// **'الدفع المباشر'**
  String get directPayment;

  /// No description provided for @deliveryPayment.
  ///
  /// In ar, this message translates to:
  /// **'الدفع بخدمة التوصيل'**
  String get deliveryPayment;

  /// No description provided for @pleaseSelectPaymentMethod.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء إختيار طريقة الدفع'**
  String get pleaseSelectPaymentMethod;

  /// No description provided for @pleaseFillYourInfo.
  ///
  /// In ar, this message translates to:
  /// **'الرجاء إدخال المعلومات الخاصة بك'**
  String get pleaseFillYourInfo;

  /// No description provided for @youllGetaCall.
  ///
  /// In ar, this message translates to:
  /// **'سوف يتم الأتصال بك لتأكيد الحجز بعد ذلك يمكنك زيارة مكتبنا لدفع المبلغ وإتمام بقية الاجرائات'**
  String get youllGetaCall;

  /// No description provided for @location.
  ///
  /// In ar, this message translates to:
  /// **'بغداد - المنصور - مقابل مول المنصور'**
  String get location;

  /// No description provided for @contactNumber.
  ///
  /// In ar, this message translates to:
  /// **'07730000231'**
  String get contactNumber;

  /// No description provided for @transferToThisNumber.
  ///
  /// In ar, this message translates to:
  /// **'قم بتحويل المبلغ على الرقم :'**
  String get transferToThisNumber;

  /// No description provided for @pressImageToOpenMap.
  ///
  /// In ar, this message translates to:
  /// **'اضغط على الصورة لفتح الخريطة'**
  String get pressImageToOpenMap;

  /// No description provided for @writeYourNumberInInfoSection.
  ///
  /// In ar, this message translates to:
  /// **'أثناء تحويل المبلغ تأكد من كتابة رقم الهاتف الخاص بك في خانة الملاحظات'**
  String get writeYourNumberInInfoSection;

  /// No description provided for @youllGetaCallAfterPayemntConfirmed.
  ///
  /// In ar, this message translates to:
  /// **'بعد وصول المبلغ سوف يتم الأتصال بالرقم المرفق لأكمال الاجراءات'**
  String get youllGetaCallAfterPayemntConfirmed;

  /// No description provided for @ifYouDidntHaveAWallet.
  ///
  /// In ar, this message translates to:
  /// **'اذا لم يكن لديك محفظة إذهب الى اقرب وكيل معتمد وتأكد من تبليغ الوكيل بكاتبة رقم الهاتف الخاص بك في خانة الملاحظات'**
  String get ifYouDidntHaveAWallet;

  /// No description provided for @youllGetaCallThenOurAgentWillCome.
  ///
  /// In ar, this message translates to:
  /// **'سوف يتم الأتصال بك لتأكيد الحجز بعد ذلك سوف يأتيك الوكيل لأستلام المبلغ خلال 24 ساعة'**
  String get youllGetaCallThenOurAgentWillCome;

  /// No description provided for @fullName.
  ///
  /// In ar, this message translates to:
  /// **'الأسم الكامل'**
  String get fullName;

  /// No description provided for @phoneNumber.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get phoneNumber;

  /// No description provided for @address.
  ///
  /// In ar, this message translates to:
  /// **'العنوان'**
  String get address;

  /// No description provided for @bookinConfirmed.
  ///
  /// In ar, this message translates to:
  /// **'تم الحجز'**
  String get bookinConfirmed;

  /// No description provided for @thankForDoingBussinesWithUs.
  ///
  /// In ar, this message translates to:
  /// **'شكرا لتعاملك معنا'**
  String get thankForDoingBussinesWithUs;

  /// No description provided for @ifYouHaveAnyQuestion.
  ///
  /// In ar, this message translates to:
  /// **'اذا كان لديك اي استفسار يمكن التواصل معنامن خلال الواتساب على الرقم'**
  String get ifYouHaveAnyQuestion;

  /// No description provided for @backToHome.
  ///
  /// In ar, this message translates to:
  /// **'العودة الى الرئيسية'**
  String get backToHome;

  /// No description provided for @confirm.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد'**
  String get confirm;
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
