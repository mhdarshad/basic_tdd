import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/util/presentation/styles/container_style.dart';


class ProductData extends StatelessWidget {
  const ProductData({
    Key? key, required this.image,
    required this.onProductTap,
    this.price,
    this.title,
  }) : super(key: key);

  final Uri image;
  final Function() onProductTap;
  final String? price;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageViewWidget(image: image),
        ProductDetailOverlay   (onProductTap: onProductTap, price: price, title: title)],
    );
  }
}

class ProductDetailOverlay extends StatelessWidget {
  const ProductDetailOverlay({
    Key? key,
    required this.onProductTap,
    required this.price,
    required this.title,
  }) : super(key: key);

  final Function() onProductTap;
  final String? price;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 8.0, right: 5.0),
      // decoration: boxDecoration_img(item_text, 5),
      // color: Colors.red,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: ()=>onProductTap(),
          child: Container(
            decoration: const BoxDecoration(gradient: LinearGradient(colors:[Colors.transparent,Colors.black87],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (price != null)
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 60,
                      height: 20,
                      decoration: ProductContainerDecoration(Colors.black, 3),
                      alignment: Alignment.topRight,
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: (price??'0').text.color(Colors.white).make(),
                          )),
                    ),
                  ],
                )
                    : const SizedBox(),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageViewWidget extends StatelessWidget {
  const ImageViewWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final Uri image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 8.0, right: 5.0),
      child: CachedNetworkImage(
        imageUrl: image.toString(),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              // opacity: .3,
              image: imageProvider,
              alignment: Alignment.center,
              fit: BoxFit.cover,
              // colorFilter:
              // ColorFilter.mode(Colors.red, BlendMode.colorBurn)
            ),
          ),
        ),
        placeholder: (context, url) => const Center(
          child: Image(image: AssetImage(
            'assets/icons/no_image_1.png',
          ),),
        ),
        errorWidget: (context, url, error) => const Center(
          child: Image(image: AssetImage(
            'assets/icons/no_image_1.png',
          ),),
        ),
      ),
    );
  }
}