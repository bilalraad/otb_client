import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../data/models/trip.dart';
import 'confirmation_page/confirmation_page.dart';
import '../../utils/utils.dart';

class SelectPaymentMethod extends StatelessWidget {
  final Trip trip;
  const SelectPaymentMethod({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    void _goToConfirmation(PaymentType type) =>
        Navigator.of(context).push(createRoute(ConfirmationPage(
          paymentType: type,
          trip: trip,
        )));

    return Scaffold(
      appBar: appAppbar(
        showInfo: false,
        onBackPressed: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(appLoc.totalCost),
            Text(
              trip.totalCost.toString() + "\$",
              style: AppTextStyles.headerStyle(),
            ),
            const SizedBox(height: 10),
            Text(appLoc.pleaseSelectPaymentMethod),
            const SizedBox(height: 10),
            PaymentMethodBlock(
              title: appLoc.payWithZaincash,
              paymentType: PaymentType.zaincash,
              onPressed: () => _goToConfirmation(PaymentType.zaincash),
            ),
            const SizedBox(height: 10),
            PaymentMethodBlock(
              title: appLoc.directPayment,
              paymentType: PaymentType.directPayemnt,
              onPressed: () => _goToConfirmation(PaymentType.directPayemnt),
            ),
            const SizedBox(height: 10),
            PaymentMethodBlock(
              title: appLoc.deliveryPayment,
              paymentType: PaymentType.deliveryPayemnt,
              onPressed: () => _goToConfirmation(PaymentType.deliveryPayemnt),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodBlock extends StatelessWidget {
  final String title;
  final PaymentType paymentType;
  final VoidCallback onPressed;
  const PaymentMethodBlock(
      {Key? key,
      required this.title,
      required this.paymentType,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _getPaymentTypeImage() {
      switch (paymentType) {
        case PaymentType.zaincash:
          return AppAssets.zainCashLogo;
        case PaymentType.directPayemnt:
          return AppAssets.directPayment;
        default:
          return AppAssets.deliveryPayment;
      }
    }

    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            const Icon(Icons.arrow_back_ios),
            Text(title),
            const Spacer(),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10 - 2),
                bottomLeft: Radius.circular(10 - 2),
              ),
              child: Image.asset(_getPaymentTypeImage()),
            ),
          ],
        ),
      ),
    );
  }
}
