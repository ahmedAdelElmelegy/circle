import 'dart:io';
import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/custom_app_bar.dart';
import 'package:circle/core/widgets/custom_button.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/data/models/body/signup_response_body.dart';
import 'package:circle/data/models/body/update_profile_request_body.dart';
import 'package:circle/data/provider/sign_up_provider.dart';
import 'package:circle/data/provider/update_profile_provider.dart';
import 'package:circle/features/home/ui/widget/check_box_item.dart';
import 'package:circle/features/home/ui/widget/custom_text_field.dart';
import 'package:circle/features/profile/ui/widgets/user_name_field.dart';
import 'package:circle/features/sign_up/ui/widgets/city_drop_down.dart';
import 'package:circle/features/sign_up/ui/widgets/select_image.dart';
import 'package:circle/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final bool? isEdit;
  static const String routeName = '/sign_up';
  const SignUp({super.key, this.isEdit = false});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int cityId = 0;
  File? currentImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 36.h),
          child: Consumer<SignUpProvider>(builder: (context, provider, child) {
            if (widget.isEdit == true) {
              provider.firstName.text = saveUserData.getUserData()!.firstName!;
              provider.lastName.text = saveUserData.getUserData()!.lastName!;
            }
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomAppBarTitle(
                          title: widget.isEdit == true
                              ? 'edit_account'
                              : 'create_account'),
                      verticalSpace(14),
                      SelectPhoto(
                        onImageSelected: (XFile image) {
                          setState(() {
                            currentImage = File(image.path);
                          });
                        },
                      ),
                      verticalSpace(32),
                      Row(
                        children: [
                          UserNameField(
                            formKey: provider.firstNameKey,
                            controller: provider.firstName,
                            title: 'first_name',
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return 'first_name_required'.tr();
                              }
                              return null;
                            },
                          ),
                          horizontalSpace(8),
                          UserNameField(
                            formKey: provider.lastNameKey,
                            controller: provider.lastName,
                            title: 'last_name',
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return 'last_name_required'.tr();
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                      verticalSpace(32),
                      widget.isEdit == false
                          ? Column(children: [
                              CustomTextField(
                                controller: provider.phone,
                                formKey: provider.phoneKey,
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 11) {
                                    return 'phone_number_required'.tr();
                                  } else {
                                    return null;
                                  }
                                },
                                hintText: 'phone_number'.tr(),
                                fillColor: false,
                                icon: Padding(
                                  padding: EdgeInsets.all(12.sp),
                                  child: SvgIcon(AppIcons.phoneIcon),
                                ),
                              ),
                              verticalSpace(16),
                              CityDropDown(
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return 'city_required'.tr();
                                  }
                                  return null;
                                },
                                formKey: provider.cityKey,
                                onTapCity: (int id) {
                                  setState(() {
                                    cityId = id;
                                  });
                                },
                              ),
                              verticalSpace(32),
                              const CheckBoxItem(cityName: 'invited_by_user'),
                            ])
                          : const SizedBox(),
                      verticalSpace(100),
                      Consumer<UpdateProfileProvider>(
                          builder: (context, edit, child) {
                        return CustomButton(
                          child: provider.isLoading || edit.isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'confirm'.tr(),
                                  style: TextStyles.font14MadaRegularWith,
                                ),
                          onTap: () {
                            if (widget.isEdit == true) {
                              edit.updateProfile(
                                UpdateProfileRequestBody(
                                  firstName: provider.firstName.text,
                                  lastName: provider.lastName.text,
                                  image: currentImage,
                                ),
                              );
                            } else {
                              if (provider.firstNameKey.currentState!
                                      .validate() &&
                                  provider.lastNameKey.currentState!
                                      .validate() &&
                                  provider.phoneKey.currentState!.validate() &&
                                  provider.cityKey.currentState!.validate()) {
                                if (provider.phone.text.length == 11 ||
                                    provider.phone.text.isEmpty) {
                                  provider.signUp(SignupResponseBody(
                                    firstName: provider.firstName.text,
                                    lastName: provider.lastName.text,
                                    phone: provider.phone.text.substring(1),
                                    cityId: cityId,
                                    image: currentImage,
                                  ));
                                } else {
                                  provider.signUp(SignupResponseBody(
                                    firstName: provider.firstName.text,
                                    lastName: provider.lastName.text,
                                    phone: provider.phone.text,
                                    cityId: cityId,
                                    image: currentImage,
                                  ));
                                }
                              }
                            }
                          },
                        );
                      })
                    ],
                  )
                ]);
          }),
        ),
      ),
    );
  }
}
