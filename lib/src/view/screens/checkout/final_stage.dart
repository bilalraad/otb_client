import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otbclient/src/data/models/book_trip.dart';
import '../../utils/utils.dart';
import '../../../bloc/confirm_order/confirm_order_cubit.dart';
import '../../../localization/app_localizations.dart';
import '../../home.dart';

class FinalStage extends StatelessWidget {
  const FinalStage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              return OrderFailedWidget(failedOrder: state.failedOrder);
            } else {
              return const Center(child: CupertinoActivityIndicator());
            }
          },
        ),
      ),
    );
  }
}

class OrderFailedWidget extends StatelessWidget {
  const OrderFailedWidget({
    Key? key,
    required this.failedOrder,
  }) : super(key: key);

  final BookTrip failedOrder;

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

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
              context.read<ConfirmOrderCubit>().confirmOrder(failedOrder);
            },
            text: appLoc.tryAgain,
          )
        ],
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
              //TODO: ADD THE ABILITY TO LAUNCH WHATSAPP WITHOUT QUERY
              // launchWhatsApp(query: query)
            },
            text: "\t\t\t" + appLoc.contactNumber,
            icon: SizedBox(
              width: 25,
              child: Image.asset(AppAssets.whatsappIcon),
            ),
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
