/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 128 (64 per locale)
///
/// Built on 2024-11-13 at 09:33 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.ja;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ja) // set locale
/// - Locale locale = AppLocale.ja.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ja) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	ja(languageCode: 'ja', build: Translations.build),
	en(languageCode: 'en', build: _StringsEn.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get title => 'InstaClone';
	late final _StringsAccountPageJa accountPage = _StringsAccountPageJa._(_root);
	late final _StringsAppInfoJa appInfo = _StringsAppInfoJa._(_root);
	late final _StringsAuthorJa author = _StringsAuthorJa._(_root);
	late final _StringsButtonJa button = _StringsButtonJa._(_root);
	late final _StringsHomePageJa homePage = _StringsHomePageJa._(_root);
	late final _StringsDashboardJa dashboard = _StringsDashboardJa._(_root);
	late final _StringsCreatePostJa createPost = _StringsCreatePostJa._(_root);
	late final _StringsFollowListJa followList = _StringsFollowListJa._(_root);
	late final _StringsNotFoundPageJa notFoundPage = _StringsNotFoundPageJa._(_root);
	late final _StringsPinkieMewPageJa pinkieMewPage = _StringsPinkieMewPageJa._(_root);
	late final _StringsSettingsPageJa settingsPage = _StringsSettingsPageJa._(_root);
	late final _StringsThemeJa theme = _StringsThemeJa._(_root);
	late final _StringsTopLevelTabJa topLevelTab = _StringsTopLevelTabJa._(_root);
}

// Path: accountPage
class _StringsAccountPageJa {
	_StringsAccountPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsAccountPageAppBarJa appBar = _StringsAccountPageAppBarJa._(_root);
}

// Path: appInfo
class _StringsAppInfoJa {
	_StringsAppInfoJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsAppInfoAppBarJa appBar = _StringsAppInfoAppBarJa._(_root);
}

// Path: author
class _StringsAuthorJa {
	_StringsAuthorJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Altive株式会社';
}

// Path: button
class _StringsButtonJa {
	_StringsButtonJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get really => '本当によろしいですか？';
	String get cancel => 'キャンセル';
	late final _StringsButtonSignJa sign = _StringsButtonSignJa._(_root);
	String get back => '戻る';
}

// Path: homePage
class _StringsHomePageJa {
	_StringsHomePageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsHomePageAppBarJa appBar = _StringsHomePageAppBarJa._(_root);
	late final _StringsHomePageListJa list = _StringsHomePageListJa._(_root);
}

// Path: dashboard
class _StringsDashboardJa {
	_StringsDashboardJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsDashboardButtonJa button = _StringsDashboardButtonJa._(_root);
	late final _StringsDashboardLabelJa label = _StringsDashboardLabelJa._(_root);
	late final _StringsDashboardProfileEditJa profileEdit = _StringsDashboardProfileEditJa._(_root);
}

// Path: createPost
class _StringsCreatePostJa {
	_StringsCreatePostJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsCreatePostAppBarJa appBar = _StringsCreatePostAppBarJa._(_root);
	late final _StringsCreatePostButtonsJa buttons = _StringsCreatePostButtonsJa._(_root);
	late final _StringsCreatePostFieldsJa fields = _StringsCreatePostFieldsJa._(_root);
	late final _StringsCreatePostImagePickerJa imagePicker = _StringsCreatePostImagePickerJa._(_root);
}

// Path: followList
class _StringsFollowListJa {
	_StringsFollowListJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsFollowListAppBarJa appBar = _StringsFollowListAppBarJa._(_root);
	late final _StringsFollowListButtonJa button = _StringsFollowListButtonJa._(_root);
	late final _StringsFollowListTabJa tab = _StringsFollowListTabJa._(_root);
}

// Path: notFoundPage
class _StringsNotFoundPageJa {
	_StringsNotFoundPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '404 Not Found';
	late final _StringsNotFoundPageHeaderJa header = _StringsNotFoundPageHeaderJa._(_root);
	String get description => 'is not found.';
	late final _StringsNotFoundPageBackButtonJa backButton = _StringsNotFoundPageBackButtonJa._(_root);
}

// Path: pinkieMewPage
class _StringsPinkieMewPageJa {
	_StringsPinkieMewPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Pinkie and Mew';
}

// Path: settingsPage
class _StringsSettingsPageJa {
	_StringsSettingsPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsSettingsPageAppBarJa appBar = _StringsSettingsPageAppBarJa._(_root);
	late final _StringsSettingsPageListJa list = _StringsSettingsPageListJa._(_root);
}

// Path: theme
class _StringsThemeJa {
	_StringsThemeJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsThemeModeJa mode = _StringsThemeModeJa._(_root);
	late final _StringsThemeSelectionJa selection = _StringsThemeSelectionJa._(_root);
}

// Path: topLevelTab
class _StringsTopLevelTabJa {
	_StringsTopLevelTabJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsTopLevelTabHomeJa home = _StringsTopLevelTabHomeJa._(_root);
	late final _StringsTopLevelTabRiverpodJa riverpod = _StringsTopLevelTabRiverpodJa._(_root);
	late final _StringsTopLevelTabSettingsJa settings = _StringsTopLevelTabSettingsJa._(_root);
}

// Path: accountPage.appBar
class _StringsAccountPageAppBarJa {
	_StringsAccountPageAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'アカウント';
}

// Path: appInfo.appBar
class _StringsAppInfoAppBarJa {
	_StringsAppInfoAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'アプリ情報';
}

// Path: button.sign
class _StringsButtonSignJa {
	_StringsButtonSignJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get out => 'サインアウト';
}

// Path: homePage.appBar
class _StringsHomePageAppBarJa {
	_StringsHomePageAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Home';
}

// Path: homePage.list
class _StringsHomePageListJa {
	_StringsHomePageListJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsHomePageListAppInfoJa appInfo = _StringsHomePageListAppInfoJa._(_root);
	String get doubleCount => '2倍されたカウント値：';
}

// Path: dashboard.button
class _StringsDashboardButtonJa {
	_StringsDashboardButtonJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get follow => 'フォロー';
	String get unfollow => 'フォロー中';
}

// Path: dashboard.label
class _StringsDashboardLabelJa {
	_StringsDashboardLabelJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get posts => '投稿数';
	String get followers => 'フォロワー';
	String get following => 'フォロー中';
}

// Path: dashboard.profileEdit
class _StringsDashboardProfileEditJa {
	_StringsDashboardProfileEditJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsDashboardProfileEditAppBarJa appBar = _StringsDashboardProfileEditAppBarJa._(_root);
	late final _StringsDashboardProfileEditDialogJa dialog = _StringsDashboardProfileEditDialogJa._(_root);
	late final _StringsDashboardProfileEditButtonsJa buttons = _StringsDashboardProfileEditButtonsJa._(_root);
	late final _StringsDashboardProfileEditFieldsJa fields = _StringsDashboardProfileEditFieldsJa._(_root);
}

// Path: createPost.appBar
class _StringsCreatePostAppBarJa {
	_StringsCreatePostAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '新規投稿';
}

// Path: createPost.buttons
class _StringsCreatePostButtonsJa {
	_StringsCreatePostButtonsJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get post => 'シェアする';
	String get posting => '投稿中...';
	String get selectPhoto => '写真を選択';
	String get reSelectPhoto => '写真を選び直す';
}

// Path: createPost.fields
class _StringsCreatePostFieldsJa {
	_StringsCreatePostFieldsJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsCreatePostFieldsDescriptionJa description = _StringsCreatePostFieldsDescriptionJa._(_root);
	late final _StringsCreatePostFieldsLocationJa location = _StringsCreatePostFieldsLocationJa._(_root);
}

// Path: createPost.imagePicker
class _StringsCreatePostImagePickerJa {
	_StringsCreatePostImagePickerJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get gallery => 'ギャラリーから選択';
	String get camera => 'カメラで撮影';
}

// Path: followList.appBar
class _StringsFollowListAppBarJa {
	_StringsFollowListAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get followers => 'フォロワー';
	String get following => 'フォロー中';
}

// Path: followList.button
class _StringsFollowListButtonJa {
	_StringsFollowListButtonJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get follow => 'フォロー';
	String get following => 'フォロー中';
	String get remove => '削除';
}

// Path: followList.tab
class _StringsFollowListTabJa {
	_StringsFollowListTabJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String followers({required Object count}) => '${count} フォロワー';
	String following({required Object count}) => '${count} フォロー中';
}

// Path: notFoundPage.header
class _StringsNotFoundPageHeaderJa {
	_StringsNotFoundPageHeaderJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'ごめんなさい🙏';
}

// Path: notFoundPage.backButton
class _StringsNotFoundPageBackButtonJa {
	_StringsNotFoundPageBackButtonJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'is not found.';
}

// Path: settingsPage.appBar
class _StringsSettingsPageAppBarJa {
	_StringsSettingsPageAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '設定';
}

// Path: settingsPage.list
class _StringsSettingsPageListJa {
	_StringsSettingsPageListJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsSettingsPageListThemeSelectorJa themeSelector = _StringsSettingsPageListThemeSelectorJa._(_root);
	late final _StringsSettingsPageListAccountJa account = _StringsSettingsPageListAccountJa._(_root);
}

// Path: theme.mode
class _StringsThemeModeJa {
	_StringsThemeModeJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsThemeModeTitleJa title = _StringsThemeModeTitleJa._(_root);
	late final _StringsThemeModeSubtitleJa subtitle = _StringsThemeModeSubtitleJa._(_root);
}

// Path: theme.selection
class _StringsThemeSelectionJa {
	_StringsThemeSelectionJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsThemeSelectionPageJa page = _StringsThemeSelectionPageJa._(_root);
}

// Path: topLevelTab.home
class _StringsTopLevelTabHomeJa {
	_StringsTopLevelTabHomeJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Home';
}

// Path: topLevelTab.riverpod
class _StringsTopLevelTabRiverpodJa {
	_StringsTopLevelTabRiverpodJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsTopLevelTabRiverpodExampleJa example = _StringsTopLevelTabRiverpodExampleJa._(_root);
}

// Path: topLevelTab.settings
class _StringsTopLevelTabSettingsJa {
	_StringsTopLevelTabSettingsJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Settings';
}

// Path: homePage.list.appInfo
class _StringsHomePageListAppInfoJa {
	_StringsHomePageListAppInfoJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'アプリ情報';
}

// Path: dashboard.profileEdit.appBar
class _StringsDashboardProfileEditAppBarJa {
	_StringsDashboardProfileEditAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'プロフィールを編集';
}

// Path: dashboard.profileEdit.dialog
class _StringsDashboardProfileEditDialogJa {
	_StringsDashboardProfileEditDialogJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsDashboardProfileEditDialogDiscardChangesJa discardChanges = _StringsDashboardProfileEditDialogDiscardChangesJa._(_root);
}

// Path: dashboard.profileEdit.buttons
class _StringsDashboardProfileEditButtonsJa {
	_StringsDashboardProfileEditButtonsJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get complete => '完了';
}

// Path: dashboard.profileEdit.fields
class _StringsDashboardProfileEditFieldsJa {
	_StringsDashboardProfileEditFieldsJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get displayName => '名前';
	String get bio => '自己紹介';
	String get photoUrl => 'プロフィール写真';
	String hint({required Object field}) => '${field}を入力';
}

// Path: createPost.fields.description
class _StringsCreatePostFieldsDescriptionJa {
	_StringsCreatePostFieldsDescriptionJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => '説明';
	String get hint => '写真の説明を入力してください';
	late final _StringsCreatePostFieldsDescriptionErrorsJa errors = _StringsCreatePostFieldsDescriptionErrorsJa._(_root);
}

// Path: createPost.fields.location
class _StringsCreatePostFieldsLocationJa {
	_StringsCreatePostFieldsLocationJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => '場所';
	String get hint => '場所を入力 (任意)';
}

// Path: settingsPage.list.themeSelector
class _StringsSettingsPageListThemeSelectorJa {
	_StringsSettingsPageListThemeSelectorJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'テーマ選択';
}

// Path: settingsPage.list.account
class _StringsSettingsPageListAccountJa {
	_StringsSettingsPageListAccountJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'アカウント';
}

// Path: theme.mode.title
class _StringsThemeModeTitleJa {
	_StringsThemeModeTitleJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get system => 'System';
	String get light => 'Light theme';
	String get dark => 'Dark theme';
}

// Path: theme.mode.subtitle
class _StringsThemeModeSubtitleJa {
	_StringsThemeModeSubtitleJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get system => 'システム設定に従う';
	String get light => '明るいテーマ';
	String get dark => '暗いテーマ';
}

// Path: theme.selection.page
class _StringsThemeSelectionPageJa {
	_StringsThemeSelectionPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsThemeSelectionPageAppBarJa appBar = _StringsThemeSelectionPageAppBarJa._(_root);
}

// Path: topLevelTab.riverpod.example
class _StringsTopLevelTabRiverpodExampleJa {
	_StringsTopLevelTabRiverpodExampleJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Riverpod';
}

// Path: dashboard.profileEdit.dialog.discardChanges
class _StringsDashboardProfileEditDialogDiscardChangesJa {
	_StringsDashboardProfileEditDialogDiscardChangesJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '変更を破棄しますか？';
	String get content => '編集内容は保存されません。';
	String get continueEditing => '編集を続ける';
	String get discard => '変更を破棄';
}

// Path: createPost.fields.description.errors
class _StringsCreatePostFieldsDescriptionErrorsJa {
	_StringsCreatePostFieldsDescriptionErrorsJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get required => '説明を入力してください';
	String get tooLong => '説明は2000文字以内で入力してください';
}

// Path: theme.selection.page.appBar
class _StringsThemeSelectionPageAppBarJa {
	_StringsThemeSelectionPageAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'テーマ選択';
}

// Path: <root>
class _StringsEn implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	@override String get title => 'InstaClone';
	@override late final _StringsAccountPageEn accountPage = _StringsAccountPageEn._(_root);
	@override late final _StringsAppInfoEn appInfo = _StringsAppInfoEn._(_root);
	@override late final _StringsAuthorEn author = _StringsAuthorEn._(_root);
	@override late final _StringsButtonEn button = _StringsButtonEn._(_root);
	@override late final _StringsHomePageEn homePage = _StringsHomePageEn._(_root);
	@override late final _StringsDashboardEn dashboard = _StringsDashboardEn._(_root);
	@override late final _StringsCreatePostEn createPost = _StringsCreatePostEn._(_root);
	@override late final _StringsFollowListEn followList = _StringsFollowListEn._(_root);
	@override late final _StringsNotFoundPageEn notFoundPage = _StringsNotFoundPageEn._(_root);
	@override late final _StringsPinkieMewPageEn pinkieMewPage = _StringsPinkieMewPageEn._(_root);
	@override late final _StringsSettingsPageEn settingsPage = _StringsSettingsPageEn._(_root);
	@override late final _StringsThemeEn theme = _StringsThemeEn._(_root);
	@override late final _StringsTopLevelTabEn topLevelTab = _StringsTopLevelTabEn._(_root);
}

// Path: accountPage
class _StringsAccountPageEn implements _StringsAccountPageJa {
	_StringsAccountPageEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsAccountPageAppBarEn appBar = _StringsAccountPageAppBarEn._(_root);
}

// Path: appInfo
class _StringsAppInfoEn implements _StringsAppInfoJa {
	_StringsAppInfoEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsAppInfoAppBarEn appBar = _StringsAppInfoAppBarEn._(_root);
}

// Path: author
class _StringsAuthorEn implements _StringsAuthorJa {
	_StringsAuthorEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Altive inc';
}

// Path: button
class _StringsButtonEn implements _StringsButtonJa {
	_StringsButtonEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get really => 'Really?';
	@override String get cancel => 'Cancel';
	@override late final _StringsButtonSignEn sign = _StringsButtonSignEn._(_root);
	@override String get back => 'Back';
}

// Path: homePage
class _StringsHomePageEn implements _StringsHomePageJa {
	_StringsHomePageEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomePageAppBarEn appBar = _StringsHomePageAppBarEn._(_root);
	@override late final _StringsHomePageListEn list = _StringsHomePageListEn._(_root);
}

// Path: dashboard
class _StringsDashboardEn implements _StringsDashboardJa {
	_StringsDashboardEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsDashboardButtonEn button = _StringsDashboardButtonEn._(_root);
	@override late final _StringsDashboardLabelEn label = _StringsDashboardLabelEn._(_root);
	@override late final _StringsDashboardProfileEditEn profileEdit = _StringsDashboardProfileEditEn._(_root);
}

// Path: createPost
class _StringsCreatePostEn implements _StringsCreatePostJa {
	_StringsCreatePostEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsCreatePostAppBarEn appBar = _StringsCreatePostAppBarEn._(_root);
	@override late final _StringsCreatePostButtonsEn buttons = _StringsCreatePostButtonsEn._(_root);
	@override late final _StringsCreatePostFieldsEn fields = _StringsCreatePostFieldsEn._(_root);
	@override late final _StringsCreatePostImagePickerEn imagePicker = _StringsCreatePostImagePickerEn._(_root);
}

// Path: followList
class _StringsFollowListEn implements _StringsFollowListJa {
	_StringsFollowListEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsFollowListAppBarEn appBar = _StringsFollowListAppBarEn._(_root);
	@override late final _StringsFollowListButtonEn button = _StringsFollowListButtonEn._(_root);
	@override late final _StringsFollowListTabEn tab = _StringsFollowListTabEn._(_root);
}

// Path: notFoundPage
class _StringsNotFoundPageEn implements _StringsNotFoundPageJa {
	_StringsNotFoundPageEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => '404 Not Found';
	@override late final _StringsNotFoundPageHeaderEn header = _StringsNotFoundPageHeaderEn._(_root);
	@override String get description => 'is not found.';
	@override late final _StringsNotFoundPageBackButtonEn backButton = _StringsNotFoundPageBackButtonEn._(_root);
}

// Path: pinkieMewPage
class _StringsPinkieMewPageEn implements _StringsPinkieMewPageJa {
	_StringsPinkieMewPageEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pinkie and Mew';
}

// Path: settingsPage
class _StringsSettingsPageEn implements _StringsSettingsPageJa {
	_StringsSettingsPageEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPageAppBarEn appBar = _StringsSettingsPageAppBarEn._(_root);
	@override late final _StringsSettingsPageListEn list = _StringsSettingsPageListEn._(_root);
}

// Path: theme
class _StringsThemeEn implements _StringsThemeJa {
	_StringsThemeEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsThemeModeEn mode = _StringsThemeModeEn._(_root);
	@override late final _StringsThemeSelectionEn selection = _StringsThemeSelectionEn._(_root);
}

// Path: topLevelTab
class _StringsTopLevelTabEn implements _StringsTopLevelTabJa {
	_StringsTopLevelTabEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsTopLevelTabHomeEn home = _StringsTopLevelTabHomeEn._(_root);
	@override late final _StringsTopLevelTabRiverpodEn riverpod = _StringsTopLevelTabRiverpodEn._(_root);
	@override late final _StringsTopLevelTabSettingsEn settings = _StringsTopLevelTabSettingsEn._(_root);
}

// Path: accountPage.appBar
class _StringsAccountPageAppBarEn implements _StringsAccountPageAppBarJa {
	_StringsAccountPageAppBarEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Account';
}

// Path: appInfo.appBar
class _StringsAppInfoAppBarEn implements _StringsAppInfoAppBarJa {
	_StringsAppInfoAppBarEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'App information';
}

// Path: button.sign
class _StringsButtonSignEn implements _StringsButtonSignJa {
	_StringsButtonSignEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get out => 'Sign out';
}

// Path: homePage.appBar
class _StringsHomePageAppBarEn implements _StringsHomePageAppBarJa {
	_StringsHomePageAppBarEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Home';
}

// Path: homePage.list
class _StringsHomePageListEn implements _StringsHomePageListJa {
	_StringsHomePageListEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomePageListAppInfoEn appInfo = _StringsHomePageListAppInfoEn._(_root);
	@override String get doubleCount => 'The doubled count value :';
}

// Path: dashboard.button
class _StringsDashboardButtonEn implements _StringsDashboardButtonJa {
	_StringsDashboardButtonEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get follow => 'Follow';
	@override String get unfollow => 'Unfollow';
}

// Path: dashboard.label
class _StringsDashboardLabelEn implements _StringsDashboardLabelJa {
	_StringsDashboardLabelEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get posts => 'Posts';
	@override String get followers => 'Followers';
	@override String get following => 'Following';
}

// Path: dashboard.profileEdit
class _StringsDashboardProfileEditEn implements _StringsDashboardProfileEditJa {
	_StringsDashboardProfileEditEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsDashboardProfileEditAppBarEn appBar = _StringsDashboardProfileEditAppBarEn._(_root);
	@override late final _StringsDashboardProfileEditDialogEn dialog = _StringsDashboardProfileEditDialogEn._(_root);
	@override late final _StringsDashboardProfileEditButtonsEn buttons = _StringsDashboardProfileEditButtonsEn._(_root);
	@override late final _StringsDashboardProfileEditFieldsEn fields = _StringsDashboardProfileEditFieldsEn._(_root);
}

// Path: createPost.appBar
class _StringsCreatePostAppBarEn implements _StringsCreatePostAppBarJa {
	_StringsCreatePostAppBarEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'New Post';
}

// Path: createPost.buttons
class _StringsCreatePostButtonsEn implements _StringsCreatePostButtonsJa {
	_StringsCreatePostButtonsEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get post => 'Share';
	@override String get posting => 'Posting...';
	@override String get selectPhoto => 'Select Photo';
	@override String get reSelectPhoto => 'Change Photo';
}

// Path: createPost.fields
class _StringsCreatePostFieldsEn implements _StringsCreatePostFieldsJa {
	_StringsCreatePostFieldsEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsCreatePostFieldsDescriptionEn description = _StringsCreatePostFieldsDescriptionEn._(_root);
	@override late final _StringsCreatePostFieldsLocationEn location = _StringsCreatePostFieldsLocationEn._(_root);
}

// Path: createPost.imagePicker
class _StringsCreatePostImagePickerEn implements _StringsCreatePostImagePickerJa {
	_StringsCreatePostImagePickerEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get gallery => 'Choose from Gallery';
	@override String get camera => 'Take Photo';
}

// Path: followList.appBar
class _StringsFollowListAppBarEn implements _StringsFollowListAppBarJa {
	_StringsFollowListAppBarEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get followers => 'Followers';
	@override String get following => 'Following';
}

// Path: followList.button
class _StringsFollowListButtonEn implements _StringsFollowListButtonJa {
	_StringsFollowListButtonEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get follow => 'Follow';
	@override String get following => 'Following';
	@override String get remove => 'Remove';
}

// Path: followList.tab
class _StringsFollowListTabEn implements _StringsFollowListTabJa {
	_StringsFollowListTabEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String followers({required Object count}) => '${count} Followers';
	@override String following({required Object count}) => '${count} Following';
}

// Path: notFoundPage.header
class _StringsNotFoundPageHeaderEn implements _StringsNotFoundPageHeaderJa {
	_StringsNotFoundPageHeaderEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Sorry...';
}

// Path: notFoundPage.backButton
class _StringsNotFoundPageBackButtonEn implements _StringsNotFoundPageBackButtonJa {
	_StringsNotFoundPageBackButtonEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'is not found.';
}

// Path: settingsPage.appBar
class _StringsSettingsPageAppBarEn implements _StringsSettingsPageAppBarJa {
	_StringsSettingsPageAppBarEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Settings';
}

// Path: settingsPage.list
class _StringsSettingsPageListEn implements _StringsSettingsPageListJa {
	_StringsSettingsPageListEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPageListThemeSelectorEn themeSelector = _StringsSettingsPageListThemeSelectorEn._(_root);
	@override late final _StringsSettingsPageListAccountEn account = _StringsSettingsPageListAccountEn._(_root);
}

// Path: theme.mode
class _StringsThemeModeEn implements _StringsThemeModeJa {
	_StringsThemeModeEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsThemeModeTitleEn title = _StringsThemeModeTitleEn._(_root);
	@override late final _StringsThemeModeSubtitleEn subtitle = _StringsThemeModeSubtitleEn._(_root);
}

// Path: theme.selection
class _StringsThemeSelectionEn implements _StringsThemeSelectionJa {
	_StringsThemeSelectionEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsThemeSelectionPageEn page = _StringsThemeSelectionPageEn._(_root);
}

// Path: topLevelTab.home
class _StringsTopLevelTabHomeEn implements _StringsTopLevelTabHomeJa {
	_StringsTopLevelTabHomeEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Home';
}

// Path: topLevelTab.riverpod
class _StringsTopLevelTabRiverpodEn implements _StringsTopLevelTabRiverpodJa {
	_StringsTopLevelTabRiverpodEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsTopLevelTabRiverpodExampleEn example = _StringsTopLevelTabRiverpodExampleEn._(_root);
}

// Path: topLevelTab.settings
class _StringsTopLevelTabSettingsEn implements _StringsTopLevelTabSettingsJa {
	_StringsTopLevelTabSettingsEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Settings';
}

// Path: homePage.list.appInfo
class _StringsHomePageListAppInfoEn implements _StringsHomePageListAppInfoJa {
	_StringsHomePageListAppInfoEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'App Info';
}

// Path: dashboard.profileEdit.appBar
class _StringsDashboardProfileEditAppBarEn implements _StringsDashboardProfileEditAppBarJa {
	_StringsDashboardProfileEditAppBarEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Edit Profile';
}

// Path: dashboard.profileEdit.dialog
class _StringsDashboardProfileEditDialogEn implements _StringsDashboardProfileEditDialogJa {
	_StringsDashboardProfileEditDialogEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsDashboardProfileEditDialogDiscardChangesEn discardChanges = _StringsDashboardProfileEditDialogDiscardChangesEn._(_root);
}

// Path: dashboard.profileEdit.buttons
class _StringsDashboardProfileEditButtonsEn implements _StringsDashboardProfileEditButtonsJa {
	_StringsDashboardProfileEditButtonsEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get complete => 'Done';
}

// Path: dashboard.profileEdit.fields
class _StringsDashboardProfileEditFieldsEn implements _StringsDashboardProfileEditFieldsJa {
	_StringsDashboardProfileEditFieldsEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get displayName => 'Name';
	@override String get bio => 'Bio';
	@override String get photoUrl => 'Profile Photo';
	@override String hint({required Object field}) => 'Enter ${field}';
}

// Path: createPost.fields.description
class _StringsCreatePostFieldsDescriptionEn implements _StringsCreatePostFieldsDescriptionJa {
	_StringsCreatePostFieldsDescriptionEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Description';
	@override String get hint => 'Enter a description for your photo';
	@override late final _StringsCreatePostFieldsDescriptionErrorsEn errors = _StringsCreatePostFieldsDescriptionErrorsEn._(_root);
}

// Path: createPost.fields.location
class _StringsCreatePostFieldsLocationEn implements _StringsCreatePostFieldsLocationJa {
	_StringsCreatePostFieldsLocationEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Location';
	@override String get hint => 'Enter location (optional)';
}

// Path: settingsPage.list.themeSelector
class _StringsSettingsPageListThemeSelectorEn implements _StringsSettingsPageListThemeSelectorJa {
	_StringsSettingsPageListThemeSelectorEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Theme Selector';
}

// Path: settingsPage.list.account
class _StringsSettingsPageListAccountEn implements _StringsSettingsPageListAccountJa {
	_StringsSettingsPageListAccountEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Account';
}

// Path: theme.mode.title
class _StringsThemeModeTitleEn implements _StringsThemeModeTitleJa {
	_StringsThemeModeTitleEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get light => 'Light theme';
	@override String get dark => 'Dark theme';
}

// Path: theme.mode.subtitle
class _StringsThemeModeSubtitleEn implements _StringsThemeModeSubtitleJa {
	_StringsThemeModeSubtitleEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get system => 'Follows the system settings of the device';
	@override String get light => 'Light';
	@override String get dark => 'Dark';
}

// Path: theme.selection.page
class _StringsThemeSelectionPageEn implements _StringsThemeSelectionPageJa {
	_StringsThemeSelectionPageEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsThemeSelectionPageAppBarEn appBar = _StringsThemeSelectionPageAppBarEn._(_root);
}

// Path: topLevelTab.riverpod.example
class _StringsTopLevelTabRiverpodExampleEn implements _StringsTopLevelTabRiverpodExampleJa {
	_StringsTopLevelTabRiverpodExampleEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Riverpod';
}

// Path: dashboard.profileEdit.dialog.discardChanges
class _StringsDashboardProfileEditDialogDiscardChangesEn implements _StringsDashboardProfileEditDialogDiscardChangesJa {
	_StringsDashboardProfileEditDialogDiscardChangesEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Discard Changes?';
	@override String get content => 'Your changes will not be saved.';
	@override String get continueEditing => 'Continue Editing';
	@override String get discard => 'Discard';
}

// Path: createPost.fields.description.errors
class _StringsCreatePostFieldsDescriptionErrorsEn implements _StringsCreatePostFieldsDescriptionErrorsJa {
	_StringsCreatePostFieldsDescriptionErrorsEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get required => 'Please enter a description';
	@override String get tooLong => 'Description must be less than 2000 characters';
}

// Path: theme.selection.page.appBar
class _StringsThemeSelectionPageAppBarEn implements _StringsThemeSelectionPageAppBarJa {
	_StringsThemeSelectionPageAppBarEn._(this._root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Theme Selector';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'title': return 'InstaClone';
			case 'accountPage.appBar.title': return 'アカウント';
			case 'appInfo.appBar.title': return 'アプリ情報';
			case 'author.name': return 'Altive株式会社';
			case 'button.really': return '本当によろしいですか？';
			case 'button.cancel': return 'キャンセル';
			case 'button.sign.out': return 'サインアウト';
			case 'button.back': return '戻る';
			case 'homePage.appBar.title': return 'Home';
			case 'homePage.list.appInfo.label': return 'アプリ情報';
			case 'homePage.list.doubleCount': return '2倍されたカウント値：';
			case 'dashboard.button.follow': return 'フォロー';
			case 'dashboard.button.unfollow': return 'フォロー中';
			case 'dashboard.label.posts': return '投稿数';
			case 'dashboard.label.followers': return 'フォロワー';
			case 'dashboard.label.following': return 'フォロー中';
			case 'dashboard.profileEdit.appBar.title': return 'プロフィールを編集';
			case 'dashboard.profileEdit.dialog.discardChanges.title': return '変更を破棄しますか？';
			case 'dashboard.profileEdit.dialog.discardChanges.content': return '編集内容は保存されません。';
			case 'dashboard.profileEdit.dialog.discardChanges.continueEditing': return '編集を続ける';
			case 'dashboard.profileEdit.dialog.discardChanges.discard': return '変更を破棄';
			case 'dashboard.profileEdit.buttons.complete': return '完了';
			case 'dashboard.profileEdit.fields.displayName': return '名前';
			case 'dashboard.profileEdit.fields.bio': return '自己紹介';
			case 'dashboard.profileEdit.fields.photoUrl': return 'プロフィール写真';
			case 'dashboard.profileEdit.fields.hint': return ({required Object field}) => '${field}を入力';
			case 'createPost.appBar.title': return '新規投稿';
			case 'createPost.buttons.post': return 'シェアする';
			case 'createPost.buttons.posting': return '投稿中...';
			case 'createPost.buttons.selectPhoto': return '写真を選択';
			case 'createPost.buttons.reSelectPhoto': return '写真を選び直す';
			case 'createPost.fields.description.label': return '説明';
			case 'createPost.fields.description.hint': return '写真の説明を入力してください';
			case 'createPost.fields.description.errors.required': return '説明を入力してください';
			case 'createPost.fields.description.errors.tooLong': return '説明は2000文字以内で入力してください';
			case 'createPost.fields.location.label': return '場所';
			case 'createPost.fields.location.hint': return '場所を入力 (任意)';
			case 'createPost.imagePicker.gallery': return 'ギャラリーから選択';
			case 'createPost.imagePicker.camera': return 'カメラで撮影';
			case 'followList.appBar.followers': return 'フォロワー';
			case 'followList.appBar.following': return 'フォロー中';
			case 'followList.button.follow': return 'フォロー';
			case 'followList.button.following': return 'フォロー中';
			case 'followList.button.remove': return '削除';
			case 'followList.tab.followers': return ({required Object count}) => '${count} フォロワー';
			case 'followList.tab.following': return ({required Object count}) => '${count} フォロー中';
			case 'notFoundPage.title': return '404 Not Found';
			case 'notFoundPage.header.label': return 'ごめんなさい🙏';
			case 'notFoundPage.description': return 'is not found.';
			case 'notFoundPage.backButton.label': return 'is not found.';
			case 'pinkieMewPage.title': return 'Pinkie and Mew';
			case 'settingsPage.appBar.title': return '設定';
			case 'settingsPage.list.themeSelector.label': return 'テーマ選択';
			case 'settingsPage.list.account.label': return 'アカウント';
			case 'theme.mode.title.system': return 'System';
			case 'theme.mode.title.light': return 'Light theme';
			case 'theme.mode.title.dark': return 'Dark theme';
			case 'theme.mode.subtitle.system': return 'システム設定に従う';
			case 'theme.mode.subtitle.light': return '明るいテーマ';
			case 'theme.mode.subtitle.dark': return '暗いテーマ';
			case 'theme.selection.page.appBar.title': return 'テーマ選択';
			case 'topLevelTab.home.label': return 'Home';
			case 'topLevelTab.riverpod.example.label': return 'Riverpod';
			case 'topLevelTab.settings.label': return 'Settings';
			default: return null;
		}
	}
}

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'title': return 'InstaClone';
			case 'accountPage.appBar.title': return 'Account';
			case 'appInfo.appBar.title': return 'App information';
			case 'author.name': return 'Altive inc';
			case 'button.really': return 'Really?';
			case 'button.cancel': return 'Cancel';
			case 'button.sign.out': return 'Sign out';
			case 'button.back': return 'Back';
			case 'homePage.appBar.title': return 'Home';
			case 'homePage.list.appInfo.label': return 'App Info';
			case 'homePage.list.doubleCount': return 'The doubled count value :';
			case 'dashboard.button.follow': return 'Follow';
			case 'dashboard.button.unfollow': return 'Unfollow';
			case 'dashboard.label.posts': return 'Posts';
			case 'dashboard.label.followers': return 'Followers';
			case 'dashboard.label.following': return 'Following';
			case 'dashboard.profileEdit.appBar.title': return 'Edit Profile';
			case 'dashboard.profileEdit.dialog.discardChanges.title': return 'Discard Changes?';
			case 'dashboard.profileEdit.dialog.discardChanges.content': return 'Your changes will not be saved.';
			case 'dashboard.profileEdit.dialog.discardChanges.continueEditing': return 'Continue Editing';
			case 'dashboard.profileEdit.dialog.discardChanges.discard': return 'Discard';
			case 'dashboard.profileEdit.buttons.complete': return 'Done';
			case 'dashboard.profileEdit.fields.displayName': return 'Name';
			case 'dashboard.profileEdit.fields.bio': return 'Bio';
			case 'dashboard.profileEdit.fields.photoUrl': return 'Profile Photo';
			case 'dashboard.profileEdit.fields.hint': return ({required Object field}) => 'Enter ${field}';
			case 'createPost.appBar.title': return 'New Post';
			case 'createPost.buttons.post': return 'Share';
			case 'createPost.buttons.posting': return 'Posting...';
			case 'createPost.buttons.selectPhoto': return 'Select Photo';
			case 'createPost.buttons.reSelectPhoto': return 'Change Photo';
			case 'createPost.fields.description.label': return 'Description';
			case 'createPost.fields.description.hint': return 'Enter a description for your photo';
			case 'createPost.fields.description.errors.required': return 'Please enter a description';
			case 'createPost.fields.description.errors.tooLong': return 'Description must be less than 2000 characters';
			case 'createPost.fields.location.label': return 'Location';
			case 'createPost.fields.location.hint': return 'Enter location (optional)';
			case 'createPost.imagePicker.gallery': return 'Choose from Gallery';
			case 'createPost.imagePicker.camera': return 'Take Photo';
			case 'followList.appBar.followers': return 'Followers';
			case 'followList.appBar.following': return 'Following';
			case 'followList.button.follow': return 'Follow';
			case 'followList.button.following': return 'Following';
			case 'followList.button.remove': return 'Remove';
			case 'followList.tab.followers': return ({required Object count}) => '${count} Followers';
			case 'followList.tab.following': return ({required Object count}) => '${count} Following';
			case 'notFoundPage.title': return '404 Not Found';
			case 'notFoundPage.header.label': return 'Sorry...';
			case 'notFoundPage.description': return 'is not found.';
			case 'notFoundPage.backButton.label': return 'is not found.';
			case 'pinkieMewPage.title': return 'Pinkie and Mew';
			case 'settingsPage.appBar.title': return 'Settings';
			case 'settingsPage.list.themeSelector.label': return 'Theme Selector';
			case 'settingsPage.list.account.label': return 'Account';
			case 'theme.mode.title.system': return 'System';
			case 'theme.mode.title.light': return 'Light theme';
			case 'theme.mode.title.dark': return 'Dark theme';
			case 'theme.mode.subtitle.system': return 'Follows the system settings of the device';
			case 'theme.mode.subtitle.light': return 'Light';
			case 'theme.mode.subtitle.dark': return 'Dark';
			case 'theme.selection.page.appBar.title': return 'Theme Selector';
			case 'topLevelTab.home.label': return 'Home';
			case 'topLevelTab.riverpod.example.label': return 'Riverpod';
			case 'topLevelTab.settings.label': return 'Settings';
			default: return null;
		}
	}
}
