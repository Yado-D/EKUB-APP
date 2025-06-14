import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerEffect() {
  return Shimmer.fromColors(
    baseColor: Colors.green[100]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          // Notification shimmer
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 15),
            padding: const EdgeInsets.all(15),
            height: 78,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),

          // Title shimmer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 150, height: 20, color: Colors.white),
              Container(width: 70, height: 15, color: Colors.white),
            ],
          ),
          const SizedBox(height: 15),
          // Equb containers shimmer
          ...List.generate(
              2,
              (_) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                  )),

          // Action buttons shimmer
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.only(right: 2.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 65,
                  margin: const EdgeInsets.only(left: 2.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // Recent transactions title shimmer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 150, height: 20, color: Colors.white),
              Container(width: 70, height: 15, color: Colors.white),
            ],
          ),
        ],
      ),
    ),
  );
}
