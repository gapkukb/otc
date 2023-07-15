/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsHtmlsGen {
  const $AssetsHtmlsGen();

  /// File path: assets/htmls/faq.html
  String get faq => 'assets/htmls/faq.html';

  /// List of all assets
  List<String> get values => [faq];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/WaveHeader.png
  AssetGenImage get waveHeader =>
      const AssetGenImage('assets/images/WaveHeader.png');

  /// File path: assets/images/empty.png
  AssetGenImage get empty => const AssetGenImage('assets/images/empty.png');

  /// File path: assets/images/image_1.png
  AssetGenImage get image1 => const AssetGenImage('assets/images/image_1.png');

  /// File path: assets/images/image_10.png
  AssetGenImage get image10 =>
      const AssetGenImage('assets/images/image_10.png');

  /// File path: assets/images/image_11.png
  AssetGenImage get image11 =>
      const AssetGenImage('assets/images/image_11.png');

  /// File path: assets/images/image_2.png
  AssetGenImage get image2 => const AssetGenImage('assets/images/image_2.png');

  /// File path: assets/images/image_3.png
  AssetGenImage get image3 => const AssetGenImage('assets/images/image_3.png');

  /// File path: assets/images/image_4.png
  AssetGenImage get image4 => const AssetGenImage('assets/images/image_4.png');

  /// File path: assets/images/image_404.svg
  SvgGenImage get image404 => const SvgGenImage('assets/images/image_404.svg');

  /// File path: assets/images/image_5.jpg
  AssetGenImage get image5Jpg =>
      const AssetGenImage('assets/images/image_5.jpg');

  /// File path: assets/images/image_5.png
  AssetGenImage get image5Png =>
      const AssetGenImage('assets/images/image_5.png');

  /// File path: assets/images/image_6.png
  AssetGenImage get image6 => const AssetGenImage('assets/images/image_6.png');

  /// File path: assets/images/image_7.png
  AssetGenImage get image7 => const AssetGenImage('assets/images/image_7.png');

  /// File path: assets/images/image_8.png
  AssetGenImage get image8 => const AssetGenImage('assets/images/image_8.png');

  /// File path: assets/images/image_9.png
  AssetGenImage get image9 => const AssetGenImage('assets/images/image_9.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/notice_empty.svg
  SvgGenImage get noticeEmpty =>
      const SvgGenImage('assets/images/notice_empty.svg');

  /// File path: assets/images/rebate.png
  AssetGenImage get rebate => const AssetGenImage('assets/images/rebate.png');

  /// File path: assets/images/register.png
  AssetGenImage get register =>
      const AssetGenImage('assets/images/register.png');

  /// File path: assets/images/top-banner.png
  AssetGenImage get topBanner =>
      const AssetGenImage('assets/images/top-banner.png');

  /// List of all assets
  List<dynamic> get values => [
        waveHeader,
        empty,
        image1,
        image10,
        image11,
        image2,
        image3,
        image4,
        image404,
        image5Jpg,
        image5Png,
        image6,
        image7,
        image8,
        image9,
        logo,
        noticeEmpty,
        rebate,
        register,
        topBanner
      ];
}

class Assets {
  Assets._();

  static const $AssetsHtmlsGen htmls = $AssetsHtmlsGen();
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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
