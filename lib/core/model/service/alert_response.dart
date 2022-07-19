import 'package:flutter/cupertino.dart';

class AlertResponse {
  final String? title;
  final int? id;
  final String? subtitle;
  final bool status;
  final Widget? content;
  final Widget? contentWidget;
  final Widget? iconWidget;



  AlertResponse({
    this.contentWidget,
    this.content,
    this.iconWidget,
    this.title,
    this.id,
    this.subtitle,
    required this.status,
  });
}

