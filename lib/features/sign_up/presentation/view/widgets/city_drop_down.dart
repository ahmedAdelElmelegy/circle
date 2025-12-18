import 'package:circle/core/di/injection.dart';
import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/features/sign_up/presentation/view_model/city_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

CityProvider cityProvider = getIt();

class CityDropDown extends StatefulWidget {
  final void Function(int cityId)? onTapCity;
  final Key formKey;
  final String? Function(String?)? validator;
  const CityDropDown(
      {super.key, this.onTapCity, required this.formKey, this.validator});

  @override
  State<CityDropDown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  @override
  void initState() {
    cityProvider.getCity();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    for (var element in Provider.of<CityProvider>(context).cityList) {
      items.add(element.title!);
    }
    super.didChangeDependencies();
  }

  List<String> items = [];
  String? selectValue;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: ColorManger.grayLight,
            )),
        child: DropdownButtonFormField2(
          validator: widget.validator,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          hint: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgIcon(
                AppIcons.cityIcon,
                width: 48,
                height: 32,
              ),
              horizontalSpace(12),
              Text(
                'cityy'.tr(),
                style: TextStyles.font14MadaRegularBlack,
              ),
            ],
          ),
          isExpanded: true,
          value: selectValue,
          items: items
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectValue = value;
            });
            widget.onTapCity!(cityProvider.cityList[items.indexOf(value!)].id!);
          },
        ),
      ),
    );
  }
}
// Container(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12.r),
//                         border: Border.all(
//                           color: ColorManger.grayLight,
//                         )),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             SvgIcon(
//                               AppIcons.cityIcon,
//                               width: 48,
//                               height: 32,
//                             ),
//                             horizontalSpace(12),
//                             Text(
//                               'cityy'.tr(),
//                               style: TextStyles.font14MadaRegularBlack,
//                             ),
//                           ],
//                         ),
//                         const Icon(Icons.keyboard_arrow_down,
//                             color: ColorManger.red)
//                       ],
//                     ),
//                   ),
