
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sidebar/classes/language_constants.dart';

import 'package:sidebar/screens/sideBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}
 
class MyApp extends StatefulWidget {
  @override

  _MyAppState createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  
   @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      
      supportedLocales: AppLocalizations.supportedLocales,
       locale: _locale,
      home: const sideBar(),
    );
  }
}
