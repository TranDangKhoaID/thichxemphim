import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:thichxemphim/common/share_color.dart';
import 'package:thichxemphim/models/episode.dart';
import 'package:video_player/video_player.dart';

class EpisodeNumberWidget extends StatefulWidget {
  const EpisodeNumberWidget({
    super.key,
    required this.items,
    required this.flickManager,
  });

  final List<Episode?> items;
  final FlickManager flickManager;

  @override
  State<EpisodeNumberWidget> createState() => _EpisodeNumberWidgetState();
}

class _EpisodeNumberWidgetState extends State<EpisodeNumberWidget> {
  int indexSelected = 0;

  void playNewVideo(FlickManager flickManager, String url) {
    setState(() {
      flickManager.handleChangeVideo(
        VideoPlayerController.networkUrl(
          Uri.parse(url),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tập phim: ',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.items.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              if (indexSelected != index) {
                setState(() {
                  indexSelected = index;
                  print(indexSelected);
                });
                playNewVideo(
                  widget.flickManager,
                  widget.items[index]!.link_m3u8 ?? '',
                );
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: indexSelected == index
                    ? ShareColors.kPrimaryColor
                    : Colors.grey,
              ),
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: indexSelected == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
