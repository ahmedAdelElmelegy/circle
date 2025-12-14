import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/custom_button.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/data/models/body/login_response_body.dart';
import 'package:circle/data/provider/login_provider.dart';
import 'package:circle/features/home/ui/widget/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, provider, child) {
      return Column(
        children: [
          CustomTextField(
            validator: (value) {
              if (value!.isEmpty || value.length < 11) {
                return 'phone_number_required'.tr();
              } else {
                return null;
              }
            },
            formKey: provider.formKey,
            hintText: 'phone_number'.tr(),
            controller: provider.phone,
            fillColor: false,
            icon: Padding(
              padding: EdgeInsets.all(12.sp),
              child: SvgIcon(AppIcons.phoneIcon),
            ),
          ),
          verticalSpace(24),
          CustomButton(
              child: provider.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      'in'.tr(),
                      style: TextStyles.font14MadaRegularWith,
                    ),
              onTap: () {
                if (provider.formKey.currentState!.validate()) {
                  if (provider.phone.text.isNotEmpty ||
                      provider.phone.text.length == 11) {
                    provider.login(
                      LoginResponseBody(provider.phone.text.substring(1)),
                    );
                  } else {
                    provider.login(LoginResponseBody(
                      provider.phone.text,
                    ));
                  }
                }
              }),
        ],
      );
    });
  }
}
