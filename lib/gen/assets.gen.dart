/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_profile.svg
  String get icProfile => 'assets/icons/ic_profile.svg';

  /// List of all assets
  List<String> get values => [icProfile];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bike_man.png
  AssetGenImage get bikeMan =>
      const AssetGenImage('assets/images/bike_man.png');

  /// File path: assets/images/img_connect_1.svg
  String get imgConnect1 => 'assets/images/img_connect_1.svg';

  /// File path: assets/images/img_connect_2.svg
  String get imgConnect2 => 'assets/images/img_connect_2.svg';

  /// File path: assets/images/img_connect_3.svg
  String get imgConnect3 => 'assets/images/img_connect_3.svg';

  /// File path: assets/images/img_connect_4.svg
  String get imgConnect4 => 'assets/images/img_connect_4.svg';

  /// File path: assets/images/img_connect_success.svg
  String get imgConnectSuccess => 'assets/images/img_connect_success.svg';

  /// File path: assets/images/img_cook_completed.svg
  String get imgCookCompleted => 'assets/images/img_cook_completed.svg';

  /// File path: assets/images/img_sent_email.png
  AssetGenImage get imgSentEmail =>
      const AssetGenImage('assets/images/img_sent_email.png');

  /// File path: assets/images/motorcycle.png
  AssetGenImage get motorcycle =>
      const AssetGenImage('assets/images/motorcycle.png');

  /// File path: assets/images/rickshaw.png
  AssetGenImage get rickshaw =>
      const AssetGenImage('assets/images/rickshaw.png');

  /// File path: assets/images/sedan.png
  AssetGenImage get sedan => const AssetGenImage('assets/images/sedan.png');

  /// List of all assets
  List<dynamic> get values => [
        bikeMan,
        imgConnect1,
        imgConnect2,
        imgConnect3,
        imgConnect4,
        imgConnectSuccess,
        imgCookCompleted,
        imgSentEmail,
        motorcycle,
        rickshaw,
        sedan
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
