import 'package:driving_license/common_widgets/misc/ink_well_overlay_color.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/opacity.dart';
import 'package:driving_license/constants/widget_sizes.dart';
import 'package:driving_license/theme/figma_generated.dart';
import 'package:flutter/material.dart';

class MaterialTheme {
  const MaterialTheme(this.contextTheme);

  /// The original theme to be used as a base for the new theme
  final ThemeData contextTheme;

  static MaterialScheme get lightScheme {
    return FigmaGeneratedMaterialScheme.lightScheme();
  }

  static MaterialScheme get lightMediumContrastScheme {
    return FigmaGeneratedMaterialScheme.lightMediumContrastScheme();
  }

  static MaterialScheme get lightHighContrastScheme {
    return FigmaGeneratedMaterialScheme.lightHighContrastScheme();
  }

  static MaterialScheme get darkScheme {
    return FigmaGeneratedMaterialScheme.darkScheme();
  }

  static MaterialScheme get darkMediumContrastScheme {
    return FigmaGeneratedMaterialScheme.darkMediumContrastScheme();
  }

  static MaterialScheme get darkHighContrastScheme {
    return FigmaGeneratedMaterialScheme.darkHighContrastScheme();
  }

  ThemeData get light => theme(lightScheme);
  ThemeData get lightMediumContrast => theme(lightMediumContrastScheme);
  ThemeData get lightHighContrast => theme(lightHighContrastScheme);
  ThemeData get dark => theme(darkScheme);
  ThemeData get darkMediumContrast => theme(darkMediumContrastScheme);
  ThemeData get darkHighContrast => theme(darkHighContrastScheme);

  List<ExtendedColor> get extendedColors => [];
}

extension _ThemeDataBuilder on MaterialTheme {
  ThemeData theme(MaterialScheme materialScheme) {
    return contextTheme.copyWith(
      brightness: materialScheme.brightness,
      colorScheme: materialScheme.toColorScheme(),
      textTheme: contextTheme.textTheme.apply(
        bodyColor: materialScheme.onSurface,
        displayColor: materialScheme.onSurface,
      ),
      scaffoldBackgroundColor: materialScheme.background,
      canvasColor: materialScheme.surface,
      iconTheme: contextTheme.iconTheme.copyWith(opticalSize: kSize_24),
      appBarTheme: contextTheme.appBarTheme.copyWith(
        backgroundColor: materialScheme.surfaceContainerHigh,
        toolbarHeight: kAppBarHeight,
        titleSpacing: kSize_4,
        scrolledUnderElevation: kSize_0,
      ),
      bottomAppBarTheme: contextTheme.bottomAppBarTheme.copyWith(
        color: materialScheme.surfaceContainerHigh,
        elevation: kSize_0,
      ),
      cardTheme: contextTheme.cardTheme.copyWith(
        elevation: kSize_0,
        margin: EdgeInsets.zero,
      ),
      scrollbarTheme: contextTheme.scrollbarTheme.copyWith(
        thumbColor: WidgetStateProperty.all(
          materialScheme.outline.withValues(alpha: kOpacityQuarter),
        ),
      ),
      bottomSheetTheme: contextTheme.bottomSheetTheme.copyWith(
        backgroundColor: materialScheme.surfaceContainerLow,
        elevation: 0,
      ),
      dialogTheme: contextTheme.dialogTheme.copyWith(
        backgroundColor: materialScheme.surfaceContainerHigh,
        elevation: 0,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
      ),
      // iconButtonTheme: const IconButtonThemeData(
      //   style: ButtonStyle(
      //     minimumSize: MaterialStatePropertyAll(Size(48, 48)),
      //   ),
      // ),
      hintColor: materialScheme.onSurfaceVariant,
      inputDecorationTheme: contextTheme.inputDecorationTheme.copyWith(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(kSize_16),
        hintStyle: contextTheme.textTheme.bodyLarge!.copyWith(
          color: materialScheme.onSurfaceVariant,
        ),
      ),
      dividerTheme: contextTheme.dividerTheme.copyWith(space: 1, thickness: 1),
      focusColor: InkWellBackgroundColor(
        materialScheme.onSurface,
      ).resolve({WidgetState.focused}),
      hoverColor: InkWellBackgroundColor(
        materialScheme.onSurface,
      ).resolve({WidgetState.hovered}),
      splashColor: InkWellBackgroundColor(
        materialScheme.onSurface,
      ).resolve({WidgetState.pressed}),
      highlightColor: InkWellBackgroundColor(
        materialScheme.onSurface,
      ).resolve({WidgetState.pressed}),
    );
  }
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;

  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
