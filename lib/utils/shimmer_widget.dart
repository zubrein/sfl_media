import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget {
  static Widget shimmerListWidget() {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, position) {
          return SizedBox(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildBox(20),
                    buildBox(150),
                    buildBox(15, width: 120),
                    buildBox(20),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static Widget shimmerCategoryListWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildBox(20, width: 150),
          buildBox(20),
          buildBox(20),
          buildBox(20),
          buildBox(20),
          buildBox(20),
          buildBox(20),
          buildBox(20),
          buildBox(20),
          buildBox(20),
          buildBox(20),
        ],
      ),
    );
  }

  static Widget buildBox(double height, {double width = double.infinity}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: height,
          width: width,
          color: Colors.green,
        ),
      ),
    );
  }
}
