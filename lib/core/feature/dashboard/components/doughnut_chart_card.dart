import 'package:flutter/material.dart';
import 'package:softnet_school_portal/core/feature/dashboard/components/doughnut_chart.dart';
import 'package:softnet_school_portal/core/feature/dashboard/components/legend_builder.dart';
import 'package:softnet_school_portal/core/utils/constants.dart';
import 'package:softnet_school_portal/data/model/pie_chart_section_data_model.dart';

class DoughnutChartCard extends StatelessWidget {
  final String title;
  final int noOfItems;
  final String nameOfItems;
  final List<PieChartSectionDataModel> pieChartSections;
  final List<LegendItem> legendItems;

  const DoughnutChartCard({
    super.key,
    required this.title,
    required this.noOfItems,
    required this.nameOfItems,
    required this.pieChartSections,
    required this.legendItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: defaultPadding),
          SizedBox(
            height: 150,
            child: Stack(children: [
              DoughnutChart(
                listOfPieSectionData: pieChartSections,
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: defaultPadding),
                    Text(noOfItems.toString(),
                        style: Theme.of(context).textTheme.titleLarge!),
                    Text(
                      nameOfItems,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(height: defaultPadding / 2),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: legendItems.map((item) {
              return BuildLegendItem(title: item.title, color: item.color);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
