import 'package:flutter/material.dart';
import '../../../../../localization/app_localizations.dart';
import '../../../../utils/app_functions.dart';
import '../../../../utils/app_text_field.dart';

class InformationBlock extends StatefulWidget {
  final bool showAddress;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController addressController;
  const InformationBlock(
      {Key? key,
      this.showAddress = false,
      required this.formKey,
      required this.nameController,
      required this.phoneNumberController,
      required this.addressController})
      : super(key: key);

  @override
  _InformationBlockState createState() => _InformationBlockState();
}

class _InformationBlockState extends State<InformationBlock> {
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
            controller: widget.nameController,
            lableText: appLoc.fullName,
            validator: validateFullName,
          ),
          const SizedBox(height: 10),
          AppTextField(
            controller: widget.phoneNumberController,
            keyboardType: TextInputType.phone,
            lableText: appLoc.phoneNumber,
            validator: validatePhoneNo,
          ),
          const SizedBox(height: 10),
          if (widget.showAddress)
            AppTextField(
              controller: widget.addressController,
              lableText: appLoc.address,
              validator: validateAddress,
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.nameController.dispose();
    widget.phoneNumberController.dispose();
    widget.addressController.dispose();
    super.dispose();
  }
}
