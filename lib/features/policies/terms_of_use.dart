import 'package:flutter/material.dart';
import 'package:sfl_media/features/shared/app_bar.dart';

import 'shared_web_view.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({super.key});

  @override
  State<TermsOfUse> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: SharedAppBar(),
      body: const SharedWebView(url: 'https://sfl.media/terms-of-service'),
    ));
  }
}
