import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageLoading extends StatelessWidget {
  final String photoUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const ImageLoading(
      {super.key, required this.photoUrl, this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      photoUrl,
      height: height ?? 150,
      width: width ?? 150,
      fit: fit ?? BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return Center(
          child: Platform.isIOS
              ? const CupertinoActivityIndicator(
                  animating: true,
                )
              : CircularProgressIndicator(
                  strokeWidth: 2,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
        );
      },
      errorBuilder: (context, exception, stackTrace) {
        return const Text('Error');
      },
    );
  }
}
