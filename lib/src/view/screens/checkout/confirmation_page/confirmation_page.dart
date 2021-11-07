import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otbclient/src/bloc/app_user/app_user_cubit.dart';
import 'package:otbclient/src/data/models/user.dart';

import '../../../utils/utils.dart';
import '../../../../bloc/confirm_order/confirm_order_cubit.dart';
import '../../../../data/models/book_trip.dart';
import '../../../../data/models/trip.dart';
import '../../../../localization/app_localizations.dart';
import 'widgets/direct_payment_description.dart';
import 'widgets/information_block.dart';
import 'widgets/zaincash_payment_description.dart';
import '../final_stage.dart';

class ConfirmationPage extends StatelessWidget {
  final Trip trip;
  final PaymentType paymentType;
  const ConfirmationPage({
    Key? key,
    required this.trip,
    required this.paymentType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final appLoc = AppLocalizations.of(context)!;
    final nameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final addressController = TextEditingController();
    AppUser appUser = context.read<AppUserCubit>().state.user;

    Widget _getPaymentDetailsWidget() {
      switch (paymentType) {
        case PaymentType.zaincash:
          return const ZaincashPaymentDescription();
        case PaymentType.directPayemnt:
          return const DirectPaymentDescription();
        default:
          return Column(
            children: [
              const SizedBox(height: 40),
              Text(
                appLoc.youllGetaCallThenOurAgentWillCome,
                style: AppTextStyles.body(
                    textColor: Theme.of(context).colorScheme.primary),
              ),
            ],
          );
      }
    }

    return Scaffold(
      appBar: appAppbar(onBackPressed: () => Navigator.of(context).pop()),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            InformationBlock(
              showAddress: paymentType == PaymentType.deliveryPayemnt,
              formKey: formKey,
              addressController: addressController,
              nameController: nameController,
              phoneNumberController: phoneNumberController,
              appUser: appUser,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: _getPaymentDetailsWidget(),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      appLoc.totalCost,
                      style: AppTextStyles.subHeaderStyle(
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      trip.totalCost.toString() + "\$",
                      style: AppTextStyles.headerStyle(),
                    ),
                  ],
                ),
                AppButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context)
                          .pushReplacement(createRoute(const FinalStage()));
                      appUser = appUser.copyWith(
                          address: addressController.text,
                          name: nameController.text,
                          phoneNumber: phoneNumberController.text);
                      final order = BookTrip(
                        clientInfo: appUser,
                        paymentMethod: paymentType,
                        selectedTrip: trip,
                      );
                      await context
                          .read<ConfirmOrderCubit>()
                          .confirmOrder(order);
                    }
                  },
                  text: appLoc.confirm,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
