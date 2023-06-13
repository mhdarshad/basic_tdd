import 'package:flutter/material.dart';
class FlutterFlowExpandedImageView extends StatelessWidget {
  const FlutterFlowExpandedImageView({
    required this.image,
    this.allowRotation = false,
    this.useHeroAnimation = true,
    this.tag,
  });

  final Widget image;
  final bool allowRotation;
  final bool useHeroAnimation;
  final Object? tag;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Material(
      color: Colors.black,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              height: screenSize.height,
              width: screenSize.width,
              child: image,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: IconButton(
                    color: Colors.black,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
