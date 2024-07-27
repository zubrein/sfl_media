import 'package:flutter/material.dart';

class SharedAppBar extends AppBar {
  SharedAppBar({super.key})
      : super(
          titleSpacing: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Center(
              child: Image.asset(
                'assets/images/banner_sfl_short.png',
                height: 40,
                width: 180,
              ),
            ),
          ),
          backgroundColor: Colors.white,
        );
}
