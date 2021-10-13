import 'package:flutter/cupertino.dart';
import 'package:image_social_network/utils/dimens.dart';

class BorderImage extends StatelessWidget {
  const BorderImage({required this.child, this.onPress,this.alignment, Key? key})
      : super(key: key);

  final Alignment? alignment;


  final Function()? onPress;


  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: GestureDetector(
        onTap: onPress,
        child: _builder()
    )
    );
  }

  Widget _builder() {
    if (alignment == Alignment.topLeft) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Dimens.lPadding),
        ),
        child: child,
      );
    }

    if (alignment == Alignment.topRight) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(Dimens.lPadding),
        ),
        child: child,
      );
    }

    if (alignment == Alignment.bottomLeft) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(Dimens.lPadding),
        ),
        child: child,
      );
    }

    if (alignment == Alignment.bottomRight) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(Dimens.lPadding),
        ),
        child: child,
      );
    }

    if (alignment == Alignment.center) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.lPadding),
        child: child,
      );
    }

    if (alignment == Alignment.centerRight) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(Dimens.lPadding),
            bottomRight: Radius.circular(Dimens.lPadding)),
        child: child,
      );
    }

    if (alignment == Alignment.centerLeft) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Dimens.lPadding),
            bottomLeft: Radius.circular(Dimens.lPadding)),
        child: child,
      );
    }

    if (alignment == Alignment.bottomCenter) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(Dimens.lPadding),
            bottomLeft: Radius.circular(Dimens.lPadding)),
        child: child,
      );
    }

    return child;
  }
}
