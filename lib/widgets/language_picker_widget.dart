import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/components.dart';
import '../get_x_lang/localization_service.dart';

class LanguagePickerWidget extends StatefulWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  State<LanguagePickerWidget> createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerWidget> {
  String _selectedLang = LocalizationService.langs.first;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20,),
        Column(
          children: [
            Text('langButton'.tr, style: AppTextStyle.kChangeLangStyle,),
            DropdownButton(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              //hint: Text('langButton'.tr, style: AppTextStyle.kChangeLangStyle,),
              iconSize: 0,
              style: const TextStyle(fontSize: 20, color: AppColors.kTextColor),
              dropdownColor: AppColors.kNavigationDrawerWidget,
              value: _selectedLang,
              items: LocalizationService.langs.map((String lang) {
                return DropdownMenuItem(value: lang, child: Text(lang),);
              }).toList(),
              onChanged: (String? value) {
                setState(() => _selectedLang = value!);
                LocalizationService().changeLocale(value!);
              },
            ),
          ],
        ),
      ],
    );
  }
}
