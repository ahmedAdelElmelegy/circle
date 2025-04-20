import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/custom_button.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/data/models/body/contact_us_request_body.dart';
import 'package:circletraning/data/provider/contact_us_provider.dart';
import 'package:circletraning/features/home/ui/widget/custom_text_field.dart';
import 'package:circletraning/main.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('connect_us', context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child:
              Consumer<ContactUsProvider>(builder: (context, provider, child) {
            return Column(
              children: [
                SvgIcon(
                  AppIcons.connectUsIcon,
                  width: 196.w,
                  height: 150.h,
                ),
                verticalSpace(48),
                CustomTextField(
                  formKey: provider.nameFormKey,
                  controller: provider.nameController,
                  hintText: 'my_name',
                  fillColor: false,
                  borderRadius: 0.r,
                  icon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgIcon(AppIcons.name),
                  ),
                ),
                verticalSpace(12),
                CustomTextField(
                  controller: provider.emailController,
                  hintText: 'my_email',
                  fillColor: false,
                  borderRadius: 0.r,
                  icon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgIcon(AppIcons.emailIcon),
                  ),
                ),
                verticalSpace(12),
                verticalSpace(12),
                CustomTextField(
                  formKey: provider.subjectKey,
                  // maxline: 5,
                  hintText: 'address_message',
                  controller: provider.subjectController,
                  fillColor: false,
                  borderRadius: 0.r,
                  icon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgIcon(AppIcons.notesIcon),
                  ),
                ),
                verticalSpace(12),
                CustomTextField(
                  controller: provider.messageController,
                  formKey: provider.messageFormKey,
                  hintText: 'message',
                  fillColor: false,
                  borderRadius: 0.r,
                  icon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgIcon(AppIcons.notesIcon),
                  ),
                ),
                verticalSpace(100),
                CustomButton(
                  child: provider.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'send'.tr(),
                          style: TextStyles.font14MadaRegularWith
                              .copyWith(color: ColorManger.white),
                        ),
                  onTap: () {
                    if (provider.nameFormKey.currentState!.validate() &&
                        provider.messageFormKey.currentState!.validate() &&
                        provider.subjectKey.currentState!.validate()) {
                      provider.contactUs(ContactUsRequestBody(
                          name: provider.nameController.text,
                          subject: provider.subjectController.text,
                          message: provider.messageController.text,
                          email: provider.emailController.text,
                          phone: saveUserData.getUserData()!.phone!));
                    }
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: const BorderSide(color: ColorManger.grayLight),
    );
  }
}
