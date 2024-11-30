import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Color surfaceColor = Colors.white10;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: surfaceColor),
        dividerColor: Colors.grey[400],
        primaryColor: Colors.green[400],
        useMaterial3: true,
        // dividerColor: surfaceColor,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromRGBO(30, 30, 30, 255),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 12,
            fontFamily: 'Lato',
            color: Colors.grey[400], // خاکستری متوسط
          ),
          bodySmall: TextStyle(
            fontSize: 9,
            fontFamily: 'lato',
          ),
          bodyLarge: TextStyle(
            fontSize: 15,
            fontFamily: 'Lato',
          ),
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Lato',
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Skill { Photoshop, AfterEffact, lightRoom, illasrator }

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_field
  Skill _skill = Skill.Photoshop;

  void updateSkillState(Skill skill) {
    setState(() {
      this._skill = skill;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "firstApp",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          actions: [
            Icon(CupertinoIcons.chat_bubble),
            SizedBox(
              width: 8,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(16), // دور عکس گرد کرد
                      child: Image.asset(
                        "assets/images/profile_image.png",
                        width: 60,
                        height: 60,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "homan",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "Android developer",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child:
                                      Icon(CupertinoIcons.location, size: 10),
                                ),
                                Text(
                                  "iran",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Icon(CupertinoIcons.heart,
                        color: Theme.of(context).primaryColor)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 20),
                child: Text(
                  "lorem episom Reloaded 1 of 709 libraries in 291ms (compile: 19 ms, reload: 195 ms, reassemble: 67 ms)",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Skills",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                      child: Icon(
                        CupertinoIcons.chevron_compact_down,
                        size: 9,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    SkillItheme(
                      type: Skill.Photoshop,
                      title: "Photoshop",
                      imagePath: "assets/images/app_icon_01.png",
                      shadowColor: Colors.blue,
                      isActive: _skill == Skill.Photoshop,
                      onTap: () {
                        updateSkillState(Skill.Photoshop);
                      },
                    ),
                    SkillItheme(
                      type: Skill.lightRoom,
                      title: "lightRoom",
                      imagePath: "assets/images/app_icon_02.png",
                      shadowColor: Colors.blue,
                      isActive: _skill == Skill.lightRoom,
                      onTap: () {
                        updateSkillState(Skill.lightRoom);
                      },
                    ),
                    SkillItheme(
                      type: Skill.AfterEffact,
                      title: "AfterEffact",
                      imagePath: "assets/images/app_icon_03.png",
                      shadowColor: Colors.white,
                      isActive: _skill == Skill.AfterEffact,
                      onTap: () {
                        updateSkillState(Skill.AfterEffact);
                      },
                    ),
                    SkillItheme(
                      type: Skill.illasrator,
                      title: "illasrator",
                      imagePath: "assets/images/app_icon_04.png",
                      shadowColor: Colors.red,
                      isActive: _skill == Skill.illasrator,
                      onTap: () {
                        updateSkillState(Skill.illasrator);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Personal information",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(CupertinoIcons.at)),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(CupertinoIcons.lock)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("Save")),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}

class SkillItheme extends StatelessWidget {
  final Skill type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;
  const SkillItheme({
    super.key,
    required this.type,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.5), blurRadius: 20)
                    ])
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
