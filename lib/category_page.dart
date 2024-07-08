import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<String> categoryList = [
    'NEWS',
    'SPORTS',
    'INTERVIEWS',
    'HUMAN RIGHTS',
    'GET WISE',
    'SCIENCE',
    'TECHNOLOGY',
    'MUSIC',
    'EVENTS',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: _buildBanner(),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              ..._buildCategoryWidgetList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'What you want to see?',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0),
      child: Center(
        child: Image.asset(
          'assets/images/banner_sfl_short.png',
          height: 40,
          width: 180,
        ),
      ),
    );
  }

  List<Widget> _buildCategoryWidgetList() {
    List<Widget> widgetList = [];
    for (var category in categoryList) {
      widgetList.add(_buildCategoryItem(
          label: category,
          onTap: () {
            Navigator.of(context).pop();
          }));
    }
    return widgetList;
  }

  Widget _buildCategoryItem({
    required String label,
    Function()? onTap,
  }) {
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
}
