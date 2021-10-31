import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/confirm_order/confirm_order_cubit.dart';
import '../../../localization/app_localizations.dart';
import '../../home.dart';
import '../../utils/app_appbar.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_button.dart';
import '../../utils/app_functions.dart';
import '../../utils/app_text_styles.dart';

class FinalStage extends StatelessWidget {
  const FinalStage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: appAppbar(showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<ConfirmOrderCubit, ConfirmOrderState>(
          builder: (context, state) {
            if (state is SendingOrderSuccess) {
              return const OrderSuccessWidget();
            }
            if (state is SendingOrderFailed) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      appLoc.errorWhileSending,
                      style: AppTextStyles.headerStyle(),
                    ),
                    Text(appLoc.checkInternet),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image.asset(AppAssets.queryError),
                    ),
                    const SizedBox(height: 20),
                    AppButton(
                      buttonType: ButtonType.secondary,
                      width: MediaQuery.of(context).size.width / 2,
                      onPressed: () {
                        context
                            .read<ConfirmOrderCubit>()
                            .confirmOrder(state.failedOrder);
                      },
                      text: appLoc.tryAgain,
                    )
                  ],
                ),
              );
            } else {
              return const CupertinoActivityIndicator();
            }
          },
        ),
      ),
    );
  }
}

class OrderSuccessWidget extends StatelessWidget {
  const OrderSuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          appLoc.bookinConfirmed,
          style: AppTextStyles.headerStyle(),
        ),
        Text(
          appLoc.thankForDoingBussinesWithUs,
          style: AppTextStyles.subHeaderStyle(),
        ),
        const SizedBox(height: 20),
        Image.asset(AppAssets.completed),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          child: Text(
            appLoc.ifYouHaveAnyQuestion,
            textAlign: TextAlign.center,
            style: AppTextStyles.body(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: AppButton(
            onPressed: () {
              // launchWhatsApp(query: query)
            },
            text: appLoc.contactNumber,
            buttonType: ButtonType.secondary,
          ),
        ),
        const Spacer(),
        AppButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              createRoute(const Home()),
            );
          },
          text: appLoc.backToHome,
        )
      ],
    );
  }
}
