import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:testproject/Chat%20Application/constants/app_constants.dart';
import 'package:testproject/Chat%20Application/constants/color_constants.dart';


class FullPhotoPage extends StatelessWidget {
  final String url;

  const FullPhotoPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.fullPhotoTitle,
          style: TextStyle(color: ColorConstants.greyColor2),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(url),
        ),
      ),
    );
  }
}
