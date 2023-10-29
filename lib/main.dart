// ignore_for_file: deprecated_member_use
 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfiguration.dark().getTheme()
          : MyAppThemeConfiguration.light().getTheme(),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (themeMode == ThemeMode.dark)
              themeMode = ThemeMode.light;
            else
              themeMode = ThemeMode.dark;
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

  ThemeData getTheme() {
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
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        fillColor: surfaceColor,
        filled: true,
      ),
      textTheme: GoogleFonts.reemKufiFunTextTheme(TextTheme(
        bodyText2: TextStyle(fontSize: 15, color: primaryTextColor),
        bodyText1: TextStyle(fontSize: 13, color: secondaryTextColor),
        headline6:
            TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
        subtitle1: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: primaryTextColor),
      )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  const MyHomePage({super.key, required this.toggleThemeMode});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skillType = _SkillType.photoShop;
  void updateSelectedSkill(_SkillType skillType) {
    setState(() {
      this._skillType = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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
        physics: BouncingScrollPhysics(),
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
                          "Mehran Kasebvatan",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Mobile developer",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            Text(
                              "Tehran, Iran",
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
            const Padding(
              padding: EdgeInsets.only(
                right: 32,
                left: 32,
                bottom: 16,
              ),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
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
                    "Skills",
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
                        updateSelectedSkill(_SkillType.photoShop);
                      },
                      type: _SkillType.photoShop,
                      title: "Photoshop",
                      imagePath: "assets/images/app_icon_01.png",
                      shadowColor: Colors.blue,
                      isActive: _skillType == _SkillType.photoShop),
                  SkillWidget(
                      onTap: () {
                        updateSelectedSkill(_SkillType.xd);
                      },
                      type: _SkillType.xd,
                      title: "Adobe XD",
                      imagePath: "assets/images/app_icon_05.png",
                      shadowColor: Colors.pink,
                      isActive: _skillType == _SkillType.xd),
                  SkillWidget(
                      onTap: () {
                        updateSelectedSkill(_SkillType.illustrator);
                      },
                      type: _SkillType.illustrator,
                      title: "Illustrator",
                      imagePath: "assets/images/app_icon_04.png",
                      shadowColor: Colors.orange,
                      isActive: _skillType == _SkillType.illustrator),
                  SkillWidget(
                      onTap: () {
                        updateSelectedSkill(_SkillType.afterEffect);
                      },
                      type: _SkillType.afterEffect,
                      title: "After Effect",
                      imagePath: "assets/images/app_icon_03.png",
                      shadowColor: Colors.blue.shade800,
                      isActive: _skillType == _SkillType.afterEffect),
                  SkillWidget(
                      onTap: () {
                        updateSelectedSkill(_SkillType.lightRoom);
                      },
                      type: _SkillType.lightRoom,
                      title: "Lightroom",
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
                "Personal Information",
                style: Theme.of(context).textTheme.bodyText2!,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                right: 32,
                left: 32,
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(
                    CupertinoIcons.at,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(
                right: 32,
                left: 32,
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(
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
                    "Save",
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
