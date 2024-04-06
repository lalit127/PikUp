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

  /// File path: assets/icons/alarmsvg.svg
  String get alarmsvg => 'assets/icons/alarmsvg.svg';

  /// File path: assets/icons/app_logo.svg
  String get appLogo => 'assets/icons/app_logo.svg';

  /// File path: assets/icons/ic_account.svg
  String get icAccount => 'assets/icons/ic_account.svg';

  /// File path: assets/icons/ic_apple.svg
  String get icApple => 'assets/icons/ic_apple.svg';

  /// File path: assets/icons/ic_connect.svg
  String get icConnect => 'assets/icons/ic_connect.svg';

  /// File path: assets/icons/ic_email.svg
  String get icEmail => 'assets/icons/ic_email.svg';

  /// File path: assets/icons/ic_fb.svg
  String get icFb => 'assets/icons/ic_fb.svg';

  /// File path: assets/icons/ic_filter.svg
  String get icFilter => 'assets/icons/ic_filter.svg';

  /// File path: assets/icons/ic_google.svg
  String get icGoogle => 'assets/icons/ic_google.svg';

  /// File path: assets/icons/ic_hidden.svg
  String get icHidden => 'assets/icons/ic_hidden.svg';

  /// File path: assets/icons/ic_home.svg
  String get icHome => 'assets/icons/ic_home.svg';

  /// File path: assets/icons/ic_lock.svg
  String get icLock => 'assets/icons/ic_lock.svg';

  /// File path: assets/icons/ic_notification.svg
  String get icNotification => 'assets/icons/ic_notification.svg';

  /// File path: assets/icons/ic_profile.svg
  String get icProfile => 'assets/icons/ic_profile.svg';

  /// File path: assets/icons/ic_receipt.svg
  String get icReceipt => 'assets/icons/ic_receipt.svg';

  /// File path: assets/icons/ic_shopping_list.svg
  String get icShoppingList => 'assets/icons/ic_shopping_list.svg';

  /// File path: assets/icons/ic_show.svg
  String get icShow => 'assets/icons/ic_show.svg';

  /// List of all assets
  List<String> get values => [
        alarmsvg,
        appLogo,
        icAccount,
        icApple,
        icConnect,
        icEmail,
        icFb,
        icFilter,
        icGoogle,
        icHidden,
        icHome,
        icLock,
        icNotification,
        icProfile,
        icReceipt,
        icShoppingList,
        icShow
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

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

  /// List of all assets
  List<dynamic> get values => [
        imgConnect1,
        imgConnect2,
        imgConnect3,
        imgConnect4,
        imgConnectSuccess,
        imgCookCompleted,
        imgSentEmail
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
