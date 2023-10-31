// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;
  Locale _locale = Locale("en");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfiguration.dark().getTheme(_locale.languageCode)
          : MyAppThemeConfiguration.light().getTheme(_locale.languageCode),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (themeMode == ThemeMode.dark)
              themeMode = ThemeMode.light;
            else
              themeMode = ThemeMode.dark;
          });
        },
        selectedLanguageChange: (_Language newLanguage) {
          setState(() {
            _locale = newLanguage == _Language.en ? Locale("en") : Locale("fa");
          });
        },
      ),
    );
  }
}

enum _SkillType {
  photoShop,
  xd,
  illustrator,
  afterEffect,
  lightRoom,
}

class MyAppThemeConfiguration {
  static const faPrimaryFontFamily = "Farsi";
  final Color primaryColor = Colors.pink.shade400;
  final Color surfaceColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfiguration.dark()
      : primaryTextColor = Colors.white,
        surfaceColor = Color(0x0dffffff),
        secondaryTextColor = Colors.white70,
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfiguration.light()
      : primaryTextColor = Colors.grey.shade900,
        surfaceColor = Color(0x0dffffff),
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        backgroundColor = Colors.white,
        appBarColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getTheme(String languageCode) {
    return ThemeData(
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      primarySwatch: Colors.blue,
      primaryColor: primaryColor,
      dividerColor: surfaceColor,
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      )),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: appBarColor,
        foregroundColor: primaryTextColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        fillColor: surfaceColor,
        filled: true,
      ),
      textTheme: languageCode == "en" ? enPrimaryTextTheme : faPrimaryTextTheme,
    );
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme(TextTheme(
        bodyText2: TextStyle(fontSize: 15, color: primaryTextColor),
        bodyText1: TextStyle(
          height: 1.5,
          fontSize: 13,
          color: secondaryTextColor,
        ),
        headline6:
            TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
        subtitle1: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: primaryTextColor),
      ));

  TextTheme get faPrimaryTextTheme => TextTheme(
        bodyText2: TextStyle(
            fontSize: 15,
            height: 1.5,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        button: TextStyle(
          fontFamily: faPrimaryFontFamily,
        ),
        bodyText1: TextStyle(
            fontSize: 13,
            color: secondaryTextColor,
            fontFamily: faPrimaryFontFamily),
        headline6: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        subtitle1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
      );
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  final Function(_Language _language) selectedLanguageChange;
  const MyHomePage({
    super.key,
    required this.toggleThemeMode,
    required this.selectedLanguageChange,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skillType = _SkillType.photoShop;
  _Language _language = _Language.en;
  void _updateSelectedSkill(_SkillType skillType) {
    setState(() {
      _skillType = skillType;
    });
  }

  void _updateSElectedLanguage(_Language language) {
    widget.selectedLanguageChange(language);
    setState(() {
      _language = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.profileTitle),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(CupertinoIcons.chat_bubble),
          ),
          InkWell(
            onTap: widget.toggleThemeMode,
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        //physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/profile_image.png",
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localization.name,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          localization.job,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            Text(
                              localization.location,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
                left: 32,
                bottom: 16,
              ),
              child: Text(localization.summery),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.selectedLanguage),
                  CupertinoSlidingSegmentedControl<_Language>(
                      groupValue: _language,
                      thumbColor: Theme.of(context).primaryColor,
                      children: {
                        _Language.en: Text(localization.en),
                        _Language.fa: Text(localization.fa)
                      },
                      onValueChanged: (value) {
                        if (value != null) _updateSElectedLanguage(value);
                      }),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 24,
                right: 32,
                left: 32,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    localization.skills,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    CupertinoIcons.chevron_down,
                    size: 12,
                  ),
                ],
              ),
            ),
            Center(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                direction: Axis.horizontal,
                children: [
                  SkillWidget(
                      onTap: () {
                        _updateSelectedSkill(_SkillType.photoShop);
                      },
                      type: _SkillType.photoShop,
                      title: "PhotoShop",
                      imagePath: "assets/images/app_icon_01.png",
                      shadowColor: Colors.blue,
                      isActive: _skillType == _SkillType.photoShop),
                  SkillWidget(
                      onTap: () {
                        _updateSelectedSkill(_SkillType.xd);
                      },
                      type: _SkillType.xd,
                      title: "Adobe XD",
                      imagePath: "assets/images/app_icon_05.png",
                      shadowColor: Colors.pink,
                      isActive: _skillType == _SkillType.xd),
                  SkillWidget(
                      onTap: () {
                        _updateSelectedSkill(_SkillType.illustrator);
                      },
                      type: _SkillType.illustrator,
                      title: "Illustrator",
                      imagePath: "assets/images/app_icon_04.png",
                      shadowColor: Colors.orange,
                      isActive: _skillType == _SkillType.illustrator),
                  SkillWidget(
                      onTap: () {
                        _updateSelectedSkill(_SkillType.afterEffect);
                      },
                      type: _SkillType.afterEffect,
                      title: "AfterEffect",
                      imagePath: "assets/images/app_icon_03.png",
                      shadowColor: Colors.blue.shade800,
                      isActive: _skillType == _SkillType.afterEffect),
                  SkillWidget(
                      onTap: () {
                        _updateSelectedSkill(_SkillType.lightRoom);
                      },
                      type: _SkillType.lightRoom,
                      title: "LightRoom",
                      imagePath: "assets/images/app_icon_02.png",
                      shadowColor: Colors.blue,
                      isActive: _skillType == _SkillType.lightRoom),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
                left: 32,
                bottom: 24,
                top: 12,
              ),
              child: Text(
                localization.personalInformation,
                style: Theme.of(context).textTheme.bodyText2!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
                left: 32,
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: localization.mail,
                  prefixIcon: const Icon(
                    CupertinoIcons.at,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
                left: 32,
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: localization.password,
                  prefixIcon: const Icon(
                    CupertinoIcons.lock,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
                left: 32,
                bottom: 24,
                top: 10,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    localization.save,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SkillWidget extends StatelessWidget {
  final _SkillType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;

  const SkillWidget({
    super.key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.5),
                        blurRadius: 30,
                      )
                    ])
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(height: 8),
            Text(title)
          ],
        ),
      ),
    );
  }
}

enum _Language {
  fa,
  en,
}
