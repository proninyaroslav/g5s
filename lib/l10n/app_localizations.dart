import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ru')];

  /// No description provided for @appName.
  ///
  /// In ru, this message translates to:
  /// **'Guest 5 Stars'**
  String get appName;

  /// No description provided for @dataRetrieval.
  ///
  /// In ru, this message translates to:
  /// **'Поиск данных'**
  String get dataRetrieval;

  /// No description provided for @profile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile;

  /// No description provided for @add.
  ///
  /// In ru, this message translates to:
  /// **'Добавить'**
  String get add;

  /// No description provided for @payment.
  ///
  /// In ru, this message translates to:
  /// **'Оплата'**
  String get payment;

  /// No description provided for @find.
  ///
  /// In ru, this message translates to:
  /// **'Найти'**
  String get find;

  /// No description provided for @enterTheDocumentNumber.
  ///
  /// In ru, this message translates to:
  /// **'Введите номер документа'**
  String get enterTheDocumentNumber;

  /// No description provided for @severalDocumentsWereFoundEnterTheDateOfIssue.
  ///
  /// In ru, this message translates to:
  /// **'Найдены несколько документов, введите дату выдачи...'**
  String get severalDocumentsWereFoundEnterTheDateOfIssue;

  /// No description provided for @introduce.
  ///
  /// In ru, this message translates to:
  /// **'Ввести'**
  String get introduce;

  /// No description provided for @dateOfIssue.
  ///
  /// In ru, this message translates to:
  /// **'Дата выдачи'**
  String get dateOfIssue;

  /// No description provided for @documentNumber.
  ///
  /// In ru, this message translates to:
  /// **'Номер документа'**
  String get documentNumber;

  /// No description provided for @dayMonthYearFocused.
  ///
  /// In ru, this message translates to:
  /// **'День    Месяц     Год'**
  String get dayMonthYearFocused;

  /// No description provided for @dayMonthYear.
  ///
  /// In ru, this message translates to:
  /// **'День │  Месяц  │  Год'**
  String get dayMonthYear;

  /// No description provided for @severalDocumentsWereFoundEnterTheCountryOfIssuance.
  ///
  /// In ru, this message translates to:
  /// **'Найдены несколько документов, введите страну выдачи...'**
  String get severalDocumentsWereFoundEnterTheCountryOfIssuance;

  /// No description provided for @clarification.
  ///
  /// In ru, this message translates to:
  /// **'Уточнение'**
  String get clarification;

  /// No description provided for @theCountryOfIssuingADocument.
  ///
  /// In ru, this message translates to:
  /// **'Страна выдачи документа'**
  String get theCountryOfIssuingADocument;

  /// No description provided for @iGetAcquaintedAndAgreeWith.
  ///
  /// In ru, this message translates to:
  /// **'Я ознакомлен и согласен с '**
  String get iGetAcquaintedAndAgreeWith;

  /// No description provided for @contractOfOffer.
  ///
  /// In ru, this message translates to:
  /// **'договором оферты.'**
  String get contractOfOffer;

  /// No description provided for @returnToTheSearch.
  ///
  /// In ru, this message translates to:
  /// **'Вернуться к поиску'**
  String get returnToTheSearch;

  /// No description provided for @goToPayment.
  ///
  /// In ru, this message translates to:
  /// **'Перейти к оплате'**
  String get goToPayment;

  /// No description provided for @resultFoundDescription.
  ///
  /// In ru, this message translates to:
  /// **'Результат найден!\nСтоимость справки по документу: эквивалент в рублях 1 доллара по текущему курсу ЦБ'**
  String get resultFoundDescription;

  /// No description provided for @privacyPolicy.
  ///
  /// In ru, this message translates to:
  /// **'Политика конфиденциальности'**
  String get privacyPolicy;

  /// No description provided for @pay.
  ///
  /// In ru, this message translates to:
  /// **'Оплатить'**
  String get pay;

  /// No description provided for @atTheCentralBankRateInRubles.
  ///
  /// In ru, this message translates to:
  /// **'По курсу ЦБ в рублях'**
  String get atTheCentralBankRateInRubles;

  /// No description provided for @weCountTheAverageRating.
  ///
  /// In ru, this message translates to:
  /// **'Считаем средний рейтинг'**
  String get weCountTheAverageRating;

  /// No description provided for @weCollectAFullStory.
  ///
  /// In ru, this message translates to:
  /// **'Собираем полную историю'**
  String get weCollectAFullStory;

  /// No description provided for @fullHistoryPaymentDescription.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость справки по полной истории аренды: эквивалент в рублях 1 доллара по текущему курсу ЦБ'**
  String get fullHistoryPaymentDescription;

  /// No description provided for @fullHistoryFoundDescription.
  ///
  /// In ru, this message translates to:
  /// **'Найдена полная история аренды. Хотите справку с полной историей?'**
  String get fullHistoryFoundDescription;

  /// No description provided for @averageRating.
  ///
  /// In ru, this message translates to:
  /// **'Средний рейтинг'**
  String get averageRating;

  /// No description provided for @yes.
  ///
  /// In ru, this message translates to:
  /// **'Да'**
  String get yes;

  /// No description provided for @theStoryOfTheLease.
  ///
  /// In ru, this message translates to:
  /// **'История аренды'**
  String get theStoryOfTheLease;

  /// No description provided for @dataIsNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Данные не найдены!'**
  String get dataIsNotFound;

  /// No description provided for @makeThemIntoTheBase.
  ///
  /// In ru, this message translates to:
  /// **'Внесите их в базу!'**
  String get makeThemIntoTheBase;

  /// No description provided for @thanksToCustomersDescription.
  ///
  /// In ru, this message translates to:
  /// **'Благодарность клиентов пойдет вам в карму, а выплаты с каждого запроса - в личный кабинет..'**
  String get thanksToCustomersDescription;

  /// No description provided for @bring.
  ///
  /// In ru, this message translates to:
  /// **'Внести'**
  String get bring;

  /// No description provided for @iAmNotInterestedInMoney.
  ///
  /// In ru, this message translates to:
  /// **'Деньги меня не интересуют'**
  String get iAmNotInterestedInMoney;

  /// No description provided for @createAccountDescription.
  ///
  /// In ru, this message translates to:
  /// **'Создайте Личный Кабинет с помощью своего профиля в соцсетях.\nИли войдите, если он у вас уже есть.'**
  String get createAccountDescription;

  /// No description provided for @enterGoogle.
  ///
  /// In ru, this message translates to:
  /// **'Войти с Google'**
  String get enterGoogle;

  /// No description provided for @goOut.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get goOut;

  /// No description provided for @addARecord.
  ///
  /// In ru, this message translates to:
  /// **'Добавить запись'**
  String get addARecord;

  /// No description provided for @requestPayment.
  ///
  /// In ru, this message translates to:
  /// **'Запросить выплату'**
  String get requestPayment;

  /// No description provided for @refreshTheScreen.
  ///
  /// In ru, this message translates to:
  /// **'Обновить экран'**
  String get refreshTheScreen;

  /// No description provided for @paymentHistory.
  ///
  /// In ru, this message translates to:
  /// **'История выплат'**
  String get paymentHistory;

  /// No description provided for @currentBalance.
  ///
  /// In ru, this message translates to:
  /// **'Текущий баланс'**
  String get currentBalance;

  /// No description provided for @minimumBalanceSheet50000.
  ///
  /// In ru, this message translates to:
  /// **'Минимальный баланс для запроса выплаты: \$ 500.00'**
  String get minimumBalanceSheet50000;

  /// No description provided for @documentsIntroduced.
  ///
  /// In ru, this message translates to:
  /// **'Введено документов'**
  String get documentsIntroduced;

  /// No description provided for @paidRequests.
  ///
  /// In ru, this message translates to:
  /// **'Оплачено запросов'**
  String get paidRequests;

  /// No description provided for @paidRentalHistory.
  ///
  /// In ru, this message translates to:
  /// **'Оплачено истории аренды'**
  String get paidRentalHistory;

  /// No description provided for @payments.
  ///
  /// In ru, this message translates to:
  /// **'Выплаты'**
  String get payments;

  /// No description provided for @search.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get search;

  /// No description provided for @entranceVkId.
  ///
  /// In ru, this message translates to:
  /// **'Вход VK ID'**
  String get entranceVkId;

  /// No description provided for @entranceMailRu.
  ///
  /// In ru, this message translates to:
  /// **'Вход Mail.ru'**
  String get entranceMailRu;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @rateDescription.
  ///
  /// In ru, this message translates to:
  /// **'Оцените арендатора\n\nПоставьте 5 звезд, если это новая запись и вы только подписываете договор!'**
  String get rateDescription;

  /// No description provided for @addReviewDescription.
  ///
  /// In ru, this message translates to:
  /// **'Оставьте ваш отзыв и рекомендации в этом поле:\n\nВовремя ли поступала оплата?\n\nБыли ли проблемы на протяжении аренды\n\nГотовы ли вы принять гостя еще раз?\n\nЧто было хорошо/плохо?'**
  String get addReviewDescription;

  /// No description provided for @addRecordSuccessDescriiption.
  ///
  /// In ru, this message translates to:
  /// **'Вы создали новую запись в базе и открыли новую страницу в репутации гостя! С каждого запроса документа вам будут начислены выплаты. Вы можете проверить их в Личном Кабинете.'**
  String get addRecordSuccessDescriiption;

  /// No description provided for @goToPersonalAccount.
  ///
  /// In ru, this message translates to:
  /// **'Перейти в Личный Кабинет'**
  String get goToPersonalAccount;

  /// No description provided for @checkTheDocument.
  ///
  /// In ru, this message translates to:
  /// **'Проверить документ'**
  String get checkTheDocument;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
