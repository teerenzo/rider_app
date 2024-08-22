import 'package:flutter/material.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:rider_app/values/styles.dart';

import 'dashed_line.dart';

class LocationInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(Icons.location_on, color: Colors.red),
            CustomPaint(
              size: Size(2, 50),
              painter: DashedLinePainter(),
            ),
            Icon(Icons.location_on, color: Colors.green),
          ],
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current location',
              style: Styles.mediumSecondary
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              '2972 Westheimer Rd. Santa Ana, Illinois 85486',
              overflow: TextOverflow.ellipsis,
              style: Styles.smallSecondary,
            ),
            SizedBox(height: 24),
            Container(
              width: SizeConfig.screenW! * 0.8,
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Office',
                    style: Styles.mediumSecondary
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text('1.1km',
                      style: Styles.mediumSecondary
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: 4),
            Text('1901 Thornridge Cir. Shiloh, Hawaii 81063',
                style: Styles.smallSecondary, overflow: TextOverflow.ellipsis),
          ],
        ),
      ],
    );
  }
}
