import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_social_network/src/border_image.dart';
import 'package:image_social_network/utils/dimens.dart';

class ImageLocal extends StatefulWidget {
  const ImageLocal({required this.files,
    required this.onDelete,
    this.size = 250, Key? key})
      : super(key: key);

  final List<XFile> files;

  final Function(int index) onDelete;

  final double size;

  @override
  _ImageSocialNetworkState createState() => _ImageSocialNetworkState();
}

class _ImageSocialNetworkState extends State<ImageLocal> {
  late List<XFile> urls;

  @override
  void initState() {
    // TODO: implement initState
    urls = widget.files;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (urls.isEmpty) return const SizedBox();
    return SizedBox(
      height: widget.size,
      width: double.infinity,
      child: _builder(context),
    );
  }

  Widget _builder(BuildContext context) {
    switch (urls.length) {
      case 1:
        return GestureDetector(
          onTap: () => openDialog(0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.lPadding),
              child: imageItem(0)),
        );
      case 2:
        return Row(
          children: [
            BorderImage(
                alignment: Alignment.centerLeft,
                onPress: () => openDialog(0),
                child: imageItem(0)),
            const SizedBox(
              width: 2,
            ),
            BorderImage(
                alignment: Alignment.centerRight,
                onPress: () => openDialog(1),
                child: imageItem(1)),
          ],
        );
      case 3:
        return Column(
          children: [
            Expanded(
                child: Row(
                  children: [
                    BorderImage(
                        alignment: Alignment.topLeft,
                        onPress: () => openDialog(0),
                        child: imageItem(0)),
                    const SizedBox(
                      width: 2,
                    ),
                    BorderImage(
                        alignment: Alignment.topRight,
                        onPress: () => openDialog(1),
                        child: imageItem(1)),
                  ],
                )),
            const SizedBox(
              height: 2,
            ),
            BorderImage(
                alignment: Alignment.bottomCenter,
                onPress: () => openDialog(2),
                child: imageItem(2)),
          ],
        );

      case 4:
        return Column(
          children: [
            Expanded(
                child: Row(
                  children: [
                    BorderImage(
                        alignment: Alignment.topLeft,
                        onPress: () => openDialog(0),
                        child: imageItem(0)),
                    const SizedBox(
                      width: 2,
                    ),
                    BorderImage(
                        alignment: Alignment.topRight,
                        onPress: () => openDialog(1),
                        child: imageItem(1)),
                  ],
                )),
            const SizedBox(
              height: 2,
            ),
            Expanded(
                child: Row(
                  children: [
                    BorderImage(
                        alignment: Alignment.bottomLeft,
                        onPress: () => openDialog(2),
                        child: imageItem(2)),
                    const SizedBox(
                      width: 2,
                    ),
                    BorderImage(
                        alignment: Alignment.bottomRight,
                        onPress: () => openDialog(3),
                        child: imageItem(3)),
                  ],
                ))
          ],
        );
      case 5:
        return Column(
          children: [
            Expanded(
                child: Row(
                  children: [
                    BorderImage(
                        alignment: Alignment.topLeft,
                        onPress: () => openDialog(0),
                        child: imageItem(0)),
                    const SizedBox(
                      width: 2,
                    ),
                    BorderImage(
                        alignment: Alignment.topRight,
                        onPress: () => openDialog(1),
                        child: imageItem(1)),
                  ],
                )),
            const SizedBox(
              height: 2,
            ),
            Expanded(
                child: Row(
                  children: [
                    BorderImage(
                        alignment: Alignment.bottomLeft,
                        onPress: () => openDialog(2),
                        child: imageItem(2)),
                    const SizedBox(
                      width: 2,
                    ),
                    BorderImage(
                      child: imageItem(3),
                      onPress: () => openDialog(3),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    BorderImage(
                        alignment: Alignment.bottomRight,
                        onPress: () => openDialog(4),
                        child: imageItem(4)),
                  ],
                ))
          ],
        );

      default:
        return Column(
          children: [
            Expanded(
                child: Row(
                  children: [
                    BorderImage(
                        alignment: Alignment.topLeft,
                        onPress: () => openDialog(0),
                        child: imageItem(0)),
                    const SizedBox(
                      width: 2,
                    ),
                    BorderImage(
                        alignment: Alignment.topRight,
                        onPress: () => openDialog(1),
                        child: imageItem(1)),
                  ],
                )),
            const SizedBox(
              height: 2,
            ),
            Expanded(
                child: Row(
                  children: [
                    BorderImage(
                        alignment: Alignment.bottomLeft,
                        onPress: () => openDialog(2),
                        child: imageItem(2)),
                    const SizedBox(
                      width: 2,
                    ),
                    BorderImage(
                      child: imageItem(3),
                      onPress: () => openDialog(3),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onDoubleTap: () => openDialog(4),
                        behavior: HitTestBehavior.translucent,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(Dimens.lPadding)),
                          child: Stack(children: [
                            imageItem(4),
                            Center(
                              child: Text(
                                '+${urls.length - 5}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ]),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        );
    }
  }

  Widget imageItem(int index) {
    return SizedBox(
      child: Stack(
        children: [

          Image.file(
            File(widget.files[index].path),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),

          Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: ()=>widget.onDelete(index),
                  icon: const Icon(Icons.cancel)
              )
          )

        ],
      ),
    );
  }


  openDialog(int i) {
    // Navigator.of(context).push(
    //   HeroDialogRoute<void>(
    //     // DisplayGesture is just debug, please remove it when use
    //       builder: (BuildContext context) {
    //         return PageView.builder(
    //             controller: PageController(initialPage: i),
    //             itemCount: urls.length,
    //             itemBuilder: (context, index) {
    //               return PhotoView.customChild(
    //                   child: CachedNetworkImage(
    //                     imageUrl: urls[index],
    //                   ));
    //             });
    //       }),
    // );
  }
}
