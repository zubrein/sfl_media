// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   HomePageState createState() => HomePageState();
// }
//
// class HomePageState extends State<HomePage> {
//   // Sample data for the list
//   final List<String> videoUrls = [
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=2',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=3',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=4',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=5',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=6',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=7',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=8',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=9',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=10',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=11',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=12',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=13',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=14',
//     'https://www.youtube.com/watch?v=lNEFitzsfws&list=PL4Xjlj6wIzIVGgcETrO2M0yhi_B8Alzme&index=15',
//     // Add more video URLs as needed
//   ];
//
//   // Controller for the currently playing video
//   late YoutubePlayerController _controller;
//
//   // Index of the currently focused item
//   int _currentIndex = -1;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the first video when the page loads
//     if (videoUrls.isNotEmpty) {
//       _controller = YoutubePlayerController(
//         initialVideoId: YoutubePlayer.convertUrlToId(videoUrls[0])!,
//         flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
//       );
//       _currentIndex = 0;
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video List'),
//       ),
//       body: ListView.builder(
//         itemCount: videoUrls.length,
//         itemBuilder: (context, index) {
//           return YoutubePlayer(
//               controller: _controller,
//               showVideoProgressIndicator: true,
//               progressIndicatorColor: Colors.blueAccent,
//               onReady: () {});
//         },
//       ),
//     );
//   }
//
//   void _handleVideoSelected(int index) {
//     if (_currentIndex != index) {
//       // Stop the previous video
//       _controller.pause();
//
//       // Start playing the new video
//       _controller = YoutubePlayerController(
//         initialVideoId: YoutubePlayer.convertUrlToId(videoUrls[index])!,
//         flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
//       );
//       setState(() {
//         _currentIndex = index;
//       });
//     }
//   }
// }
//
// class VideoListItem extends StatelessWidget {
//   final String videoUrl;
//   final int index;
//   final YoutubePlayerController controller;
//   final Function(int) onVideoSelected;
//   final bool isCurrent;
//
//   const VideoListItem({
//     super.key,
//     required this.videoUrl,
//     required this.index,
//     required this.controller,
//     required this.onVideoSelected,
//     this.isCurrent = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Text('Video Title $index'),
//         subtitle: YoutubePlayer(
//           controller: controller,
//           showVideoProgressIndicator: true,
//           progressIndicatorColor: Colors.blueAccent,
//           onReady: () {
//             // Auto play the video if this is the current item
//             if (isCurrent) {
//               controller.play();
//             }
//           },
//         ),
//         onTap: () {
//           onVideoSelected(index);
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:sfl_media/category_page.dart';
import 'package:sfl_media/news_item.dart';
import 'dummy_data.dart';
import 'video_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<NewsItem> list = newsList + newsList + newsList + newsList;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          title: _buildBanner(),
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) {
              return _buildMenuIcon(context);
            },
          ),
          actions: [_buildCategoryButton()],
        ),
        drawer: _buildDrawer(),
        body: SafeArea(
            child: InViewNotifierList(
          scrollDirection: Axis.vertical,
          initialInViewIds: const ['0'],
          isInViewPortCondition: (
            double deltaTop,
            double deltaBottom,
            double viewPortDimension,
          ) {
            return deltaTop < (0.5 * viewPortDimension) &&
                deltaBottom > (0.5 * viewPortDimension);
          },
          itemCount: list.length,
          builder: (BuildContext context, int index) {
            return InViewNotifierWidget(
              id: index.toString(),
              builder: (BuildContext context, bool isInView, Widget? child) {
                return VideoWidget(
                  newsItem: list[index],
                  index: index,
                  isInView: isInView,
                  key: ObjectKey(list[index]),
                );
              },
            );
          },
        )));
  }

  Widget _buildCategoryButton() {
    return InkWell(
      onTap: () async {
        setState(() {
          list.clear();
        });
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CategoryPage(),
          ),
        );

        if (!context.mounted) return;
        Navigator.of(context).pop();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.category,
              size: 24,
            ),
            Text(
              'Category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
        width: 280,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(16),
                _buildDrawerTitle('Support Us'),
                const Gap(16),
                _buildDrawerItem(
                  'Share the app link',
                  () async {},
                ),
                _buildDrawerItem(
                  'Rate us',
                  () {},
                ),
                const Gap(16),
                _buildDrawerTitle('Policy'),
                const Gap(16),
                _buildDrawerItem(
                  'Privacy policy',
                  () {},
                ),
                _buildDrawerItem(
                  'Terms of Use',
                  () {},
                ),
              ],
            ),
          ),
        ));
  }

  Padding _buildDrawerTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    String label,
    Function() onTap,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Gap(8),
                Text(
                  label,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const Expanded(child: SizedBox.shrink()),
                Image.asset(
                  'assets/images/right_arrow.png',
                  height: 24,
                  width: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuIcon(BuildContext context) {
    return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Image.asset(
          'assets/images/menu_bar_icon.png',
          width: 28,
          height: 28,
          fit: BoxFit.fill,
        ));
  }

  Widget _buildBanner() {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Center(
        child: Image.asset(
          'assets/images/banner_sfl_short.png',
          height: 40,
          width: 180,
        ),
      ),
    );
  }
}
