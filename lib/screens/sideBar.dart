import 'package:flutter/material.dart';
import 'package:sidebar/classes/Language.dart';
import 'package:sidebar/component/SideBarButtonData.dart';
import 'package:sidebar/component/myTextButton.dart';
import 'package:sidebar/main.dart';
import 'package:sidebar/screens/Screen1.dart';
import 'package:sidebar/screens/screen2.dart';
import 'package:sidebar/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';






class sideBar extends StatefulWidget {
  const sideBar({Key? key}) : super(key: key);

  @override
  State<sideBar> createState() => _sideBarState();
}

class _sideBarState extends State<sideBar> {
  



  int selectedIndex = 0; 

  
 

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
   
  Language? selectedLanguage;
  final List<SideBarButtonData> buttonData = [
    SideBarButtonData(

      icon: Icons.home,
      title: localizations.first,
      content: const firstScreen(),
      index: 0,
    ),
    SideBarButtonData(
      icon: Icons.home,
      title: localizations.second,
      content: secondSecreen(),
      index: 1,
    ),
    SideBarButtonData(
      icon: Icons.home,
      title: localizations.third,
      content: const Center(child: Text("الثالث")),
      index: 2,
    ),
   
  ];

    final width = MediaQuery.of(context).size.width * 0.3;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: width,
            height: height,
            color: sideBarColor,
            padding: const EdgeInsets.only(
              top: appPadding,
              right: appPadding,
              bottom: appPadding,
            ),
            child: Column(
              children: buttonData.asMap().entries.map((entry) {
                final index = entry.value.index;
                final button = entry.value;
                return MyTextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      index == selectedIndex ? white : Colors.transparent,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  }, 
                  child: Row(
                    children: [
                      Icon(
                        button.icon,
                        color: index == selectedIndex
                            ? textColor
                            : pressedTextColor,
                      ),
                      Text(
                         button.title.toString(),
                  
                        style: TextStyle(
                          color: index == selectedIndex
                              ? textColor
                              : pressedTextColor,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(appPadding),
              child: Column(
                children: [
                  Expanded(child: buttonData[selectedIndex].content),
                
                  DropdownButton<Language>(
                    value: selectedLanguage,
                    items: Language.languageList().map<DropdownMenuItem<Language>>(
                      (Language language) {
                        return DropdownMenuItem<Language>(
                          value: language,
                          child: Text("${language.flag} ${language.name}"),
                        );
                      },
                    ).toList(),
                    onChanged: (Language? newLanguage) {
                      setState(() {
                        selectedLanguage = newLanguage;
                        MyApp.setLocale(context, Locale(newLanguage!.languageCode));
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




