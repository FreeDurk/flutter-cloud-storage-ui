import 'package:flutter/material.dart';

class StorageTypeModel {
  final String icon;
  final String storageType;
  final double useSpace;
  final double maxSpace;
  Color? color;

  StorageTypeModel({
    required this.icon,
    required this.storageType,
    required this.useSpace,
    required this.maxSpace,
    this.color,
  });
}
