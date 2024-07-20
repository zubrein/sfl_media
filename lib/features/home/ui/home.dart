import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:sfl_media/category_page.dart';
import 'package:sfl_media/core/di/dependency_initializer.dart';
import 'package:sfl_media/features/home/ui/cubit/home_cubit.dart';
import 'package:sfl_media/video_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = sl<HomeCubit>();
    _homeCubit.fetchNews();
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
        body: BlocConsumer<HomeCubit, HomeState>(
          bloc: _homeCubit,
          listener: (context, state) {},
          // buildWhen: (state, _) {
          //   return state is NewsFetchSuccessState;
          // },
          builder: (context, state) {
            return state is NewsFetchSuccessState
                ? SafeArea(
                    child: InViewNotifierList(
                    scrollDirection: Axis.vertical,
                    initialInViewIds: const ['0'],
                    isInViewPortCondition: _checkViewPortion,
                    itemCount: state.newsList.length,
                    builder: (BuildContext context, int index) {
                      return InViewNotifierWidget(
                        id: index.toString(),
                        builder: (BuildContext context, bool isInView,
                            Widget? child) {
                          return VideoWidget(
                            news: state.newsList[index],
                            index: index,
                            isInView: isInView,
                            key: ObjectKey(state.newsList[index]),
                          );
                        },
                      );
                    },
                  ))
                : const SizedBox();
          },
        ));
  }

  bool _checkViewPortion(
    double deltaTop,
    double deltaBottom,
    double viewPortDimension,
  ) {
    return deltaTop < (0.5 * viewPortDimension) &&
        deltaBottom > (0.5 * viewPortDimension);
  }

  Widget _buildCategoryButton() {
    return InkWell(
      onTap: () async {
        setState(() {});
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
