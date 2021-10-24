import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/bloc/search_query/search_query_bloc.dart';
import 'src/view/utils/app_text_styles.dart';

import 'src/data/API/search_query_service.dart';
import 'src/localization/app_localizations.dart';
import 'src/view/home.dart';

class OTBApp extends StatelessWidget {
  const OTBApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchQueryBloc(MockTripsQueryService()),
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', ''),
        ],
        theme: ThemeData(
            fontFamily: 'IBM',
            textTheme: TextTheme(
              button: AppTextStyles.buttonTextStyle(),
              bodyText1: AppTextStyles.body(),
              bodyText2: AppTextStyles.body(),
              headline6: AppTextStyles.headerStyle(),
              subtitle1: AppTextStyles.subHeaderStyle(),
            ),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF27346A),
              primaryVariant: Color(0xFFBFC1CC),
              secondary: Color(0xFFFFB11E),
              secondaryVariant: Color(0xFFEADABD),
              surface: Colors.white,
              background: Colors.white,
              error: Color(0xFFCF2127),
            )),
        home: const Home(),
      ),
    );
  }
}
