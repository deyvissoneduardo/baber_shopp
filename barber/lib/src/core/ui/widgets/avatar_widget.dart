// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barber/src/core/ui/barbershop_icons.dart';
import 'package:barber/src/core/ui/helpers/colors_constants.dart';
import 'package:barber/src/core/ui/helpers/images_constants.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final bool? hideUploadButton;
  const AvatarWidget({
    Key? key,
    this.hideUploadButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 102,
      height: 102,
      child: Stack(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagesConstants.avatar),
              ),
            ),
          ),
          Positioned(
            bottom: 2,
            right: 2,
            child: Offstage(
              offstage: hideUploadButton!,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: ColorsConstants.brow,
                    width: 4,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  BarbershopIcons.addEmplyeee,
                  size: 20,
                  color: ColorsConstants.brow,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
