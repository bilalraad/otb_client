import 'package:flutter/material.dart';
import '../../../data/models/trip.dart';
import '../../../localization/app_localizations.dart';
import '../../utils/app_appbar.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_button.dart';
import '../../utils/app_functions.dart';
import '../../utils/app_text_field.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/enums.dart';

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
                formKey: formKey),
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
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    text: appLoc.confirm),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DirectPaymentDescription extends StatelessWidget {
  const DirectPaymentDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Column(
      children: [
        const SizedBox(height: 10),
        Text(appLoc.youllGetaCall),
        Text(
          appLoc.location,
          style: AppTextStyles.headerStyle(),
        ),
        const SizedBox(height: 20),
        //TODO: GET THE ACTUALL LOCATION
        //TODO: GET LOCATION IMAGE
        //TODO: Test THIS MORE
        InkWell(
          onTap: () async {
            await launchMap();
          },
          child: SizedBox(
            height: 200,
            child: Image.asset(AppAssets.officeLocation),
          ),
        ),
        Text(appLoc.pressImageToOpenMap),
      ],
    );
  }
}

class ZaincashPaymentDescription extends StatelessWidget {
  const ZaincashPaymentDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        Text(appLoc.transferToThisNumber),
        Text(
          appLoc.contactNumber,
          style: AppTextStyles.headerStyle(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          appLoc.writeYourNumberInInfoSection,
          style: AppTextStyles.buttonTextStyle(color: Colors.red),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: Image.asset(AppAssets.zaincashInfoFeild),
        ),
        const SizedBox(height: 10),
        Text(
          appLoc.youllGetaCallAfterPayemntConfirmed,
          textAlign: TextAlign.center,
          style: AppTextStyles.buttonTextStyle(
              color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 10),
        Text(appLoc.ifYouDidntHaveAWallet),
        const SizedBox(height: 20),
      ],
    );
  }
}

class InformationBlock extends StatefulWidget {
  final bool showAddress;
  final GlobalKey<FormState> formKey;
  const InformationBlock(
      {Key? key, this.showAddress = false, required this.formKey})
      : super(key: key);

  @override
  _InformationBlockState createState() => _InformationBlockState();
}

class _InformationBlockState extends State<InformationBlock> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(appLoc.pleaseFillYourInfo),
          const SizedBox(height: 10),
          AppTextField(
            controller: nameController,
            lableText: appLoc.fullName,
            validator: validateFullName,
          ),
          const SizedBox(height: 10),
          AppTextField(
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            lableText: appLoc.phoneNumber,
            validator: validatePhoneNo,
          ),
          const SizedBox(height: 10),
          if (widget.showAddress)
            AppTextField(
              controller: addressController,
              lableText: appLoc.address,
              validator: validateAddress,
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
