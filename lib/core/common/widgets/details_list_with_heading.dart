import 'package:flutter/material.dart';
import 'package:pct_mark/core/common/models/details_row_model.dart';
import 'package:pct_mark/core/common/widgets/custom_details_row_widget.dart';
import 'package:pct_mark/core/common/widgets/custom_heading.dart';

class DetailsListWithHeadingWidget extends StatelessWidget {
  const DetailsListWithHeadingWidget({
    super.key,
    required this.detailsData,
    required this.heading,
  });

  final List<DetailsRowModel> detailsData;
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeading(heading: heading),
        ListView.builder(
          itemCount: detailsData.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CustomDetailsRow(
              title: detailsData[index].title,
              value: detailsData[index].value ?? "Not Available",
            );
          },
        ),
      ],
    );
  }
}
