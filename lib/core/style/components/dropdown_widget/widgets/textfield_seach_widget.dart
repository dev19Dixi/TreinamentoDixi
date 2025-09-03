import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../dropdown_controller.dart';
import '../text_styles.dart';

class TextFieldSeachWidget extends StatelessWidget {
  const TextFieldSeachWidget({
    super.key,
    required this.controller,
  });

  final DropdownController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: 36,
          child: TextField(
            controller: controller.searchController,
            onChanged: (text) => controller.search(text),
            style: Style.blackText,
            decoration: InputDecoration(
              hintText: 'Procure aqui',
              hintStyle: Style.defaultText,
              filled: true,
              fillColor: ColorsApp.grey2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            ),
          ),
        ),
      ),
    );
  }
}
