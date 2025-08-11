import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scene/core/consts/api/api_constats.dart';
import 'package:scene/core/consts/colors/app_colors.dart';
import 'package:scene/core/movies/presentation/widgets/video_card.dart';

class MovieImagesSlider extends StatefulWidget {
  const MovieImagesSlider({super.key, required this.images});
  final List<String> images; // List of image URLs
  @override
  State<MovieImagesSlider> createState() => _MovieImagesSliderState();
}

class _MovieImagesSliderState extends State<MovieImagesSlider> {
  late List elements;
  @override
  void initState() {
    elements = initializSliderElelements(widget.images);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 217.h,
      child: PageView.builder(
        itemBuilder: (context, index) => elements[index],
        itemCount: elements.length,
        scrollDirection: Axis.horizontal,

        pageSnapping: true,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}

List<Widget> initializSliderElelements(List<String> images) {
  List<Widget> elements = [];
  elements = List.generate(
    images.length - 1,
    (index) => CachedNetworkImage(
      imageUrl: ApiConstants.imageBaseUrl + images[index + 1],
      fit: BoxFit.contain,
      alignment: Alignment.center,
      errorWidget:
          (context, url, error) =>
              Icon(Icons.image_not_supported, color: Colors.white),
      placeholder:
          (context, url) => Center(
            child: CircularProgressIndicator(color: AppColors.selectedIcon),
          ),
    ),
  );
  if (images[0] != '') elements.insert(0, VideoCard(imageUrl: images[0]));
  return elements;
}
