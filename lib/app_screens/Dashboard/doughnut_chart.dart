import 'package:flutter/material.dart';
import 'package:muthoot_fin/app_screens/Dashboard/all_zones_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatelessWidget {
  final List<ChartData> dataSource;
  final int totalTarget;
  final int totalSales;

  const DoughnutChart({
    Key? key,
    required this.dataSource,
    required this.totalTarget,
    required this.totalSales,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double chartWidth = screenWidth * 0.2;
    double chartHeight = 180.0;
    double leftPadding = chartWidth * 0.26;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          child: Container(
            height: chartHeight,
            child: Stack(
              children: [
                // Doughnut chart
                SfCircularChart(
                  legend: Legend(
                    isVisible: false,
                  ),
                  series: <CircularSeries>[
                    DoughnutSeries<ChartData, String>(
                      dataSource: dataSource,
                      xValueMapper: (ChartData data, _) => data.category,
                      yValueMapper: (ChartData data, _) => data.target + data.sales,
                      pointColorMapper: (ChartData data, _) {
                        return _getColorForCategory(data.category);
                      },
                      dataLabelSettings: const DataLabelSettings(isVisible: false),
                      legendIconType: LegendIconType.circle,
                      innerRadius: '90%',
                    ),
                  ],
                ),
              //Target & Sales Displaying in center
                Positioned(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Target: $totalTarget',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Sales: $totalSales',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            height: chartHeight,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 2.0, right: 4.0),
            child: Table(
              columnWidths: {
                0: FixedColumnWidth(60),
                1: FixedColumnWidth(50),
                2: FixedColumnWidth(50),
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
                      child: Text(
                        '',
                        style: const TextStyle(
                            fontSize: 0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 5.0),
                      child: Text(
                        'Target',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                     padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 5.0),
                      child: Text(
                        'Sales',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                // Legends data target & Sales
                ...dataSource.map((data) {
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0, right: 2.0, bottom: 2.0),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              color: _getColorForCategory(data.category),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              data.category,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
                        child: Text(
                          '${data.target}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
                        child: Text(
                          '${data.sales}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Color _getColorForCategory(String category) {
  if (category == 'North') {
    return Colors.blue;
  } else if (category == 'South') {
    return Colors.orange;
  } else if (category == 'East') {
    return Colors.deepOrange;
  } else {
    return const Color.fromARGB(255, 54, 244, 149);
  }
}
