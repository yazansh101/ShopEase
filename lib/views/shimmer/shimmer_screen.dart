import 'package:flutter/material.dart';

import 'shimmer.dart';

class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        _buildBannerShimmer(),
        const SizedBox(height: 10,),

        _buildShimmerCategoryList(),
        const SizedBox(height: 10,),

        _buildBestSellingShimmer(context)
      ],
    );
  }
}

Widget _buildBannerShimmer() {
  return ShimmerWidget.rectangular(
    height: 190,
    width: 365,
    shapeBorder:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
}

Widget _buildShimmerCategoryList() {
  return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.rectangular(
            height: 10,
            width: 60,
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: ShimmerWidget.rectangular(
                  height: 60,
                  width: 60,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
        ],
      ));
}

Widget _buildListOfShimmerItem(context) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(
                  height: 180,
                  width: MediaQuery.of(context).size.width * 0.5,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 5,
                ),
                ShimmerWidget.rectangular(
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    height: 10,
                    width: 100),
                const SizedBox(
                  height: 5,
                ),
                ShimmerWidget.rectangular(
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    height: 10,
                    width: 120),
                const SizedBox(
                  height: 5,
                ),
                ShimmerWidget.rectangular(
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    height: 10,
                    width: 50),
              ],
            ),
          ));
}

SizedBox _buildBestSellingShimmer(context) {
  return SizedBox(
    height: 300,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerWidget.rectangular(
              height: 10,
              width: 120,
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            ShimmerWidget.rectangular(
              height: 10,
              width: 50,
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Expanded(
          child: _buildListOfShimmerItem(context),
        )
      ],
    ),
  );
}
