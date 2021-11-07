import 'package:flutter/material.dart';
import '../../../../../data/models/user.dart';

import '../../../../utils/utils.dart';
import '../../../../../localization/app_localizations.dart';

class InformationBlock extends StatefulWidget {
  final bool showAddress;
  final GlobalKey<FormState> formKey;
  final AppUser appUser;
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController addressController;

  const InformationBlock(
      {Key? key,
      this.showAddress = false,
      required this.formKey,
      required this.nameController,
      required this.phoneNumberController,
      required this.addressController,
      required this.appUser})
      : super(key: key);

  @override
  _InformationBlockState createState() => _InformationBlockState();
}

class _InformationBlockState extends State<InformationBlock> {
  @override
  void initState() {
    widget.nameController.text = widget.appUser.name ?? '';
    widget.phoneNumberController.text = widget.appUser.phoneNumber ?? '';
    widget.addressController.text = widget.appUser.address ?? '';

    super.initState();
  }

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
