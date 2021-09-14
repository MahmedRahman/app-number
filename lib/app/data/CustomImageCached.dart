import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class CustomImageCached extends StatelessWidget {
  CustomImageCached({@required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GetUtils.isNullOrBlank(imageUrl)
        ? Container()
        : CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            placeholder: (context, url) => Center(
              child: SizedBox(
                width: 50,
                child: CustomIndicator(
                  indicatorStatus: IndicatorStatus.imageplaceholder,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Center(
              child: CustomIndicator(
                indicatorStatus: IndicatorStatus.error,
              ),
            ),
          );
  }
  
}

class CustomIndicator extends StatelessWidget {
  CustomIndicator({this.indicatorStatus = IndicatorStatus.wait});

  IndicatorStatus indicatorStatus;
  @override
  Widget build(BuildContext context) {
    switch (indicatorStatus) {
      case IndicatorStatus.wait:
        return CircularProgressIndicator();
        break;

      case IndicatorStatus.error:
        return Lottie.asset('images/error.json');
        break;

      case IndicatorStatus.imageplaceholder:
        return Lottie.asset('images/photo.json');
        break;

      case IndicatorStatus.NoProductFound:
        return SizedBox(
          child: Lottie.asset('images/productnotfound.json'),
          width: 265,
        );
        break;

      case IndicatorStatus.ListProduct:
        return SizedBox(
          width: 265,
          child: Lottie.asset('images/productloading.json'),
        );
        break;

      case IndicatorStatus.NoProductincart:
        return SizedBox(
          width: 265,
          child: Lottie.asset('images/cartnoproduct.json'),
        );
        break;

      default:
        return CircularProgressIndicator();
    }
  }
}

enum IndicatorStatus {
  wait,
  error,
  imageplaceholder,
  ListProduct,
  NoProductFound,
  NoProductincart,
}
