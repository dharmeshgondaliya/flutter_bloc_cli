import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    required this.placeholderAssetImage,
    this.errorAssetImage,
    this.height,
    this.width,
    this.fit,
  });

  final String imageUrl;
  final String placeholderAssetImage;
  final String? errorAssetImage;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      alignment: Alignment.center,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) {
        return Image.asset(
          placeholderAssetImage,
          width: width,
          height: height,
          alignment: Alignment.center,
          fit: fit ?? BoxFit.cover,
        );
      },
      errorWidget: (context, url, error) {
        return Image.asset(
          errorAssetImage ?? placeholderAssetImage,
          width: width,
          height: height,
          alignment: Alignment.center,
          fit: fit ?? BoxFit.cover,
        );
      },
    );
  }
}