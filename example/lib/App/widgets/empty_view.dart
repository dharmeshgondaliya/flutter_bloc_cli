import 'package:flutter/material.dart';
import '../core/utils/asset_images.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key, this.assetImage, this.titleText});

  final String? assetImage;
  final String? titleText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetImage ?? AssetImages.empty,
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Text(titleText ?? "No Data Found")
        ],
      ),
    );
  }
}