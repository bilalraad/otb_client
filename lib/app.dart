import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/bloc/confirm_order/confirm_order_cubit.dart';
import 'src/bloc/search_query/search_query_bloc.dart';
import 'src/data/API/search_query_service.dart';
import 'src/localization/app_localizations.dart';
import 'src/view/home.dart';
import 'src/view/utils/app_colors.dart';
import 'src/view/utils/app_text_styles.dart';

class OTBApp extends StatelessWidget {
  final BaseTripsQueryService tripsQueryService;
  const OTBApp({
    Key? key,
    required this.tripsQueryService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TripsQueryBloc(tripsQueryService)),
        BlocProvider(create: (context) => ConfirmOrderCubit(tripsQueryService))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar', '')],
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
              primary: AppColors.primaryColor,
              primaryVariant: Color(0xFF132B1E),
              secondary: AppColors.secondaryColor,
              secondaryVariant: AppColors.primaryColor,
              surface: Colors.white,
              background: Colors.white,
              error: Color(0xFFCF2127),
            )),
        home: const Home(),
      ),
    );
  }
}
