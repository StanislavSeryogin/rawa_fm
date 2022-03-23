import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rawa_fm/components/components.dart';

class InfoCarousel extends StatelessWidget {
  const InfoCarousel({
    Key? key,
    required this.mediaItems,
    required this.onPageChanged,
  }) : super(key: key);

  final List<MediaItem> mediaItems;
  final void Function(int index) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.9,
        autoPlay: false,
        aspectRatio: 3.0,
        enlargeCenterPage: true,
        //enableInfiniteScroll: false,
        onPageChanged: (newIndex, _) => onPageChanged(newIndex),
      ),
      itemCount: mediaItems.length,
      itemBuilder: (
          BuildContext context,
          int itemIndex,
          int pageViewIndex,
          ) {

        if(mediaItems.isEmpty) return Container();
        final item = mediaItems[itemIndex];

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.album ?? 'Unknown',
              style: AppTextStyle.kAlbumTextStyle,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              child: CachedNetworkImage(
                imageUrl: item.artUri?.toString() ?? 'assets/RAWA.FM_Logo.png',
                placeholder: (context, url) => const CircularProgressIndicator(
                  color: AppColors.kTitleAndPlayAndBufferingColor,
                ),
                errorWidget: (context, url, error) {
                  return Image.asset('assets/RAWA.FM_Logo.png');
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item.title,
              style: AppTextStyle.kTitleTextStyle,
            ),
            Text(
              item.artist ?? '',
              style: AppTextStyle.kArtistTextStyle,
            ),
          ],
        );
      },
    );
  }
}
