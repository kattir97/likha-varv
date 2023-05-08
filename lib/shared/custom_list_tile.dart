import 'package:flutter/material.dart';

class CustomListTile extends ListTile {
  const CustomListTile({
    Key? key,
    Widget? leading,
    Widget? title,
    Widget? subtitle,
    Widget? trailing,
    EdgeInsetsGeometry? contentPadding,
    GestureTapCallback? onTap,
  }) : super(
          key: key,
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          contentPadding: EdgeInsets.zero,
          onTap: onTap,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: super.build(context),
    );
  }
}
