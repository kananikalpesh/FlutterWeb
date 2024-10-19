import 'package:flatten/helpers/theme/admin_theme.dart';
import 'package:flatten/helpers/theme/app_style.dart';
import 'package:flatten/helpers/widgets/my_dashed_divider.dart';
import 'package:flatten/helpers/widgets/my_navigation_mixin.dart';
import 'package:flutter/material.dart';

mixin UIMixin {
  // ThemeData get theme => AppStyle.theme;
  LeftBarTheme get leftBarTheme => AdminTheme.theme.leftBarTheme;

  TopBarTheme get topBarTheme => AdminTheme.theme.topBarTheme;

  RightBarTheme get rightBarTheme => AdminTheme.theme.rightBarTheme;

  ContentTheme get contentTheme => AdminTheme.theme.contentTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  VisualDensity get getCompactDensity =>
      VisualDensity(horizontal: -4, vertical: -4);

  // ColorScheme get colorScheme => theme.colorScheme;

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
            width: 1,
            strokeAlign: 0,
            color: colorScheme.onBackground.withAlpha(80)),
      );

  OutlineInputBorder get focusedInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: contentTheme.primary),
      );

  OutlineInputBorder generateOutlineInputBorder({double radius = 4}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      );

  OutlineInputBorder generateFocusedInputBorder({double radius = 4}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(width: 1, color: colorScheme.primary),
      );

  Widget getBackButton(MyNavigationMixin navigationMixin) {
    return InkWell(
      onTap: navigationMixin.goBack,
      child: Center(
        child: Icon(
          Icons.chevron_left_rounded,
          size: 26,
          color: colorScheme.onBackground,
        ),
      ),
    );
  }

  Widget getDashedDivider() {
    return MyDashedDivider(
        dashWidth: 6,
        dashSpace: 4,
        color: colorScheme.onBackground.withAlpha(64),
        height: 0.5);
  }
}
