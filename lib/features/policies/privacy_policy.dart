import 'package:flutter/material.dart';
import 'package:sfl_media/features/shared/app_bar.dart';

import 'shared_web_view.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: SharedAppBar(),
      body: const SharedWebView(url: 'https://sfl.media/privacy-policy'),
    ));
  }
}
