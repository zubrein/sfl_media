import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sfl_media/features/home/ui/cubit/home_cubit.dart';
import 'package:sfl_media/features/home/ui/details_page.dart';
import 'package:sfl_media/utils/shimmer_widget.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../domain/entities/news.dart';

class NewsWidget extends StatefulWidget {
  final bool isInView;
  final News news;
  final int index;
  final HomeCubit homeCubit;

  const NewsWidget({
    Key? key,
    required this.isInView,
    required this.index,
    required this.news,
    required this.homeCubit,
  }) : super(key: key);

  @override
  State<NewsWidget> createState() => _MyVideoWidgetState();
}

class _MyVideoWidgetState extends State<NewsWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayerController.convertUrlToId(widget.news.videoUrl ?? '') ??
              '',
      params: YoutubePlayerParams(
        showFullscreenButton: true,
        autoPlay: widget.index == 0 ? true : false,
        showControls: true,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    };
    _controller.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    };
    if (widget.index == 0) {
      widget.homeCubit.currentYoutubeController = _controller;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.news.videoUrl != null) {
      if (widget.isInView) {
        _controller.play();
        widget.homeCubit.currentYoutubeController = _controller;
      } else {
        _controller.stop();
      }
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            _buildVideoPlayer(),
            _buildDateAndAuthor(),
            _buildSubtitle(),
            _buildSeeMoreButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.news.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildSubtitle() {
    final subTitle = widget.news.subTitle;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        subTitle,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildDateAndAuthor() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '${widget.news.author} | ${widget.news.date}',
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.pink,
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    if (widget.news.videoUrl != null) {
      return YoutubePlayerIFrame(
        controller: _controller,
      );
    } else {
      return CachedNetworkImage(
        height: 170,
        width: double.infinity,
        fit: BoxFit.fitWidth,
        imageUrl: widget.news.thumbnailImage,
        placeholder: (context, url) => ShimmerWidget.buildBox(170),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }
  }

  Widget _buildSeeMoreButton() {
    return InkWell(
      onTap: () {
        _controller.stop();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(
                      news: widget.news,
                    )));
      },
      child: Center(
        child: Container(
          height: 35,
          width: 180,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'See more',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
