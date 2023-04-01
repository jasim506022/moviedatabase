import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../const/apiconstant.dart';
import '../../model/tvshowmodel/populartvshowmodel.dart';

class TVShowSliderWidget extends StatelessWidget {
  const TVShowSliderWidget({
    super.key,
    required this.tvshowlish,
    required this.height,
    required this.width,
  });

  final List<TVShowModel> tvshowlish;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
      itemBuilder: (context, index, realIndex) {
        if (tvshowlish.length > index) {
          return Stack(
            children: [
              ShaderMask(
                blendMode: BlendMode.dstIn,
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [-5, -10, 1],
                  ).createShader(
                      Rect.fromLTRB(0, 0, bounds.height, bounds.width));
                },
                child: Image.network(
                  height: height,
                  width: width,
                  "$IMAGE_BASE_URL${tvshowlish[index].backdropPath}",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tvshowlish[index].name,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      tvshowlish[index].firstAirDate.substring(0, 4),
                      style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: List.generate(4, (dotIndex) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: dotIndex == index ? 30 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: dotIndex == index
                                    ? const Color(0xffef233c)
                                    : const Color(0x26ffffff)),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }
        return Container();
      },
      options: CarouselOptions(
          height: height * 0.55, autoPlay: true, viewportFraction: 1),
    );
  }
}
