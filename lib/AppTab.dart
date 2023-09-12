import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Apptext.dart';

class AppTabMenu extends StatelessWidget {
  final EdgeInsets? margin, padding;
  final bool isSelected;
  final String title;
  final Function() onClick;
  final bool disable;

  const AppTabMenu({
    this.margin,
    this.padding,
    this.isSelected = false,
    this.title = '',
    required this.onClick,
    this.disable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !disable,
      child: GestureDetector(
        onTap: () => onClick(),
        child: Container(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          margin: margin ?? EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              color: isSelected ? Colors.indigo.shade900 : Colors.grey.shade700,
              borderRadius: BorderRadius.circular(5),
              border:
                  Border.all(color: isSelected ? Colors.black : Colors.white)),
          child: AppText(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
