import '../styles/theme.dart';
import 'package:flutter/material.dart';


Widget blockOption(String blockName, bool isSelected) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    decoration: BoxDecoration(
      border: isSelected
          ? Border.all(color: AppTheme.primaryColor, width: 2)
          : null,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Text(blockName),
  );
}