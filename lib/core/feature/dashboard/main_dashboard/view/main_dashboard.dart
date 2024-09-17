import 'package:flutter/material.dart';
import 'package:softnet_school_portal/core/feature/dashboard/components/doughnut_chart_card.dart';
import 'package:softnet_school_portal/core/feature/dashboard/components/single_veritcal_bar_chart.dart';
import 'package:softnet_school_portal/core/feature/dashboard/components/legend_builder.dart';
import 'package:softnet_school_portal/core/feature/dashboard/components/line_chart.dart';
import 'package:softnet_school_portal/core/feature/dashboard/components/split_card.dart';
import 'package:softnet_school_portal/core/feature/dashboard/components/double_vertical_bar_chart_card.dart';
import 'package:softnet_school_portal/core/feature/dashboard/components/vbr2.dart';
import 'package:softnet_school_portal/core/utils/constants.dart';
import 'package:softnet_school_portal/data/model/pie_chart_section_data_model.dart';

class PieChartCard extends StatelessWidget {
  const PieChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;
        double childAspectRatio = 1;
        double availableWidth = constraints.maxWidth - 200;

        if (availableWidth >= 800) {
          crossAxisCount = 3;
          childAspectRatio = 1;
        } else if (availableWidth >= 562) {
          crossAxisCount = 3;
          childAspectRatio = .75;
        } else if (availableWidth >= 470) {
          crossAxisCount = 2;
          childAspectRatio = 1;
        } else {
          crossAxisCount = 1;
          childAspectRatio = 1.1;
        }
        print(availableWidth);
        // print(constraints.maxWidth);

        return GridView.custom(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: childAspectRatio,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == 0) {
                return DoughnutChartCard(
                  title: 'Number of Students',
                  noOfItems: 1125,
                  nameOfItems: 'Students',
                  pieChartSections: [
                    PieChartSectionDataModel(
                      color: Colors.blue,
                      value: 40,
                    ),
                    PieChartSectionDataModel(
                      color: Colors.pink,
                      value: 50,
                    ),
                    PieChartSectionDataModel(
                      color: Colors.purple,
                      value: 40,
                    ),
                    PieChartSectionDataModel(
                      color: Colors.orange,
                      value: 45,
                    ),
                    PieChartSectionDataModel(
                      color: Colors.green,
                      value: 45,
                    ),
                  ],
                  legendItems: [
                    LegendItem(title: 'Kg', color: Colors.green),
                    LegendItem(title: '1-4 Grades', color: Colors.orange),
                    LegendItem(title: '5-8 Grades', color: Colors.purple),
                    LegendItem(title: '9-10 Grades', color: Colors.pink),
                    LegendItem(title: '11-12 Grades', color: Colors.blue),
                  ],
                );
              } else if (index == 1) {
                return const SplitCard();
              } else if (index == 2) {
                return const SinglVerticalBarChart();
              } else if (index == 3) {
                return const DoubleVerticalBarChart();
              } else if (index == 4) {
                return const LineChartWidget();
              } else if (index == 5) {
                return DoughnutChartCard(
                  title: 'Number of Teachers',
                  noOfItems: 115,
                  nameOfItems: 'Teachers',
                  pieChartSections: [
                    PieChartSectionDataModel(
                      color: Colors.blue,
                      value: 50,
                    ),
                    PieChartSectionDataModel(
                      color: Colors.pink,
                      value: 30,
                    ),
                    PieChartSectionDataModel(
                      color: Colors.purple,
                      value: 40,
                    ),
                    PieChartSectionDataModel(
                      color: Colors.orange,
                      value: 20,
                    ),
                    PieChartSectionDataModel(
                      color: Colors.green,
                      value: 45,
                    ),
                  ],
                  legendItems: [
                    LegendItem(title: 'Kg', color: Colors.green),
                    LegendItem(title: '1-4 Grades', color: Colors.orange),
                    LegendItem(title: '5-8 Grades', color: Colors.purple),
                    LegendItem(title: '9-10 Grades', color: Colors.pink),
                    LegendItem(title: '11-12 Grades', color: Colors.blue),
                  ],
                );
              }
              return const LineVerticalBarChart();
            },
            childCount: 7,
          ),
        );
      },
    );
  }
}
