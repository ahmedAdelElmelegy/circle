import 'dart:io';

import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/helpers/spacing.dart';

import '../../../../../core/widgets/svg_icon.dart';

class SelectPhoto extends StatefulWidget {
  final void Function(XFile image) onImageSelected;

  const SelectPhoto({
    super.key,
    required this.onImageSelected,
  });

  @override
  State<SelectPhoto> createState() => _SelectPhotoState();
}

class _SelectPhotoState extends State<SelectPhoto> {
  XFile? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124.w,
      height: 124.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: ColorManger.grayLight,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: selectedImage == null
                ? SvgIcon(
                    AppIcons.mainLogoIconGray,
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    width: 124.w,
                    height: 124.h,
                    child: Image.file(
                      File(selectedImage!.path),
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
          Positioned(
            bottom: 5.h,
            right: 5.w,
            child: GestureDetector(
              onTap: () async {
                showImagePickerOptions(context);
              },
              child: SvgIcon(AppIcons.addPhoto),
            ),
          ),
        ],
      ),
    );
  }

  void showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150.h,
          color: Colors.transparent,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    await selectImage(ImageSource.camera);
                    pop();
                  },
                  child: Column(
                    children: [
                      verticalSpace(16),
                      Icon(Icons.camera_alt_outlined,
                          color: ColorManger.red, size: 24.sp),
                      Text(
                        'take_Photo',
                        style: TextStyles.font14MadaRegularBlack,
                      ).tr(),
                      verticalSpace(16),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await selectImage(ImageSource.gallery);
                    pop();
                  },
                  child: Column(
                    children: [
                      verticalSpace(16),
                      Icon(Icons.photo_outlined,
                          color: ColorManger.red, size: 24.sp),
                      Text(
                        'select_Photo',
                        style: TextStyles.font14MadaRegularBlack,
                      ).tr(),
                      verticalSpace(16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future selectImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    setState(() {
      selectedImage = image;
    });
    widget.onImageSelected(selectedImage!);
  }
}
