import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:sfl_media/core/di/dependency_initializer.dart';
import 'package:sfl_media/features/category/domain/entities/category.dart';
import 'package:sfl_media/features/category/ui/category_page.dart';
import 'package:sfl_media/features/home/ui/cubit/home_cubit.dart';
import 'package:sfl_media/features/home/ui/news_widget.dart';
import 'package:sfl_media/features/policies/privacy_policy.dart';
import 'package:sfl_media/features/policies/terms_of_use.dart';
import 'package:sfl_media/utils/alert_dialog_widget.dart';
import 'package:sfl_media/utils/shimmer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit _homeCubit;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _homeCubit = sl<HomeCubit>();
    _homeCubit.fetchNews();
    _scrollController = ScrollController();
    _scrollController.addListener(_onListenScrollController);
  }

  void _onListenScrollController() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      if (!_homeCubit.postFetchedEnd) {
        _homeCubit.fetchNews();
      } else {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        drawer: _buildDrawer(),
        body: SafeArea(
          child: BlocConsumer<HomeCubit, HomeState>(
            bloc: _homeCubit,
            listener: _onListenHomeCubit,
            builder: (context, state) {
              return state is SuccessState ? _buildNewsList(state) : ShimmerWidget.shimmerListWidget();
            },
          ),
        ));
  }

  Widget _buildNewsList(SuccessState state) {
    return SafeArea(
        child: InViewNotifierList(
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      initialInViewIds: const ['0'],
      isInViewPortCondition: _checkViewPortion,
      itemCount: state.newsList.length + 1,
      builder: (BuildContext context, int index) {
        return _buildInViewNotifierWidget(index, state);
      },
    ));
  }

  void _onListenHomeCubit(context, state) {
    if (state is NewsFetchFailureState) {
      showError(
        context: context,
        message: state.message,
        onTapRetryButton: () {
          Navigator.of(context).pop();
          _homeCubit.fetchNews();
        },
      );
    }
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      titleSpacing: 0.0,
      title: _buildBanner(),
      backgroundColor: Colors.white,
      leading: Builder(
        builder: (context) {
          return _buildMenuIcon(context);
        },
      ),
      actions: [_buildCategoryButton()],
    );
  }

  Widget _buildInViewNotifierWidget(int index, SuccessState state) {
    return InViewNotifierWidget(
      id: index.toString(),
      builder: (BuildContext context, bool isInView, Widget? child) {
        return index == state.newsList.length
            ? !_homeCubit.postFetchedEnd
                ? _buildProgressWidget()
                : const SizedBox.shrink()
            : _buildNewsWidget(state, index, isInView);
      },
    );
  }

  Widget _buildNewsWidget(SuccessState state, int index, bool isInView) {
    return NewsWidget(
      news: state.newsList[index],
      index: index,
      isInView: isInView,
      key: ObjectKey(state.newsList[index]),
      homeCubit: _homeCubit,
    );
  }

  Widget _buildProgressWidget() {
    return const Column(
      children: [
        Gap(16),
        SizedBox(height: 25, width: 25, child: CircularProgressIndicator()),
        Gap(16),
      ],
    );
  }

  bool _checkViewPortion(
    double deltaTop,
    double deltaBottom,
    double viewPortDimension,
  ) {
    return deltaTop < (0.5 * viewPortDimension) && deltaBottom > (0.5 * viewPortDimension);
  }

  Widget _buildCategoryButton() {
    return InkWell(
      onTap: () async {
        _homeCubit.stopPlaying();
        final category = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CategoryPage(),
          ),
        );

        if (category != null) {
          _homeCubit.categoryId = (category[0] as Category).id;
          _homeCubit.fetchNews(resetPageCount: true);
        } else if ((category[0] as Category).id == 'all') {
          _homeCubit.fetchNews(resetPageCount: true);
        } else {
          _homeCubit.startPlaying();
        }
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
    return SafeArea(
      child: Drawer(
        width: 280,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              _buildDrawerTitle('Policy'),
              const Gap(16),
              _buildDrawerItem(
                'Privacy policy',
                () {
                  _homeCubit.stopPlaying();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy(),
                    ),
                  );
                },
              ),
              _buildDrawerItem(
                'Terms of Use',
                () {
                  _homeCubit.stopPlaying();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsOfUse(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
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
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
