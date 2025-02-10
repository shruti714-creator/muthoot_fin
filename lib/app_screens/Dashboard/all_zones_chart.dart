import 'package:flutter/material.dart';
import 'package:muthoot_fin/app_screens/Dashboard/doughnut_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AllZonesChart extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const AllZonesChart({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> dataSource = [
      ChartData('North', 1670, 1336),
      ChartData('South', 3400, 2720),
      ChartData('East', 1000, 800),
      ChartData('West', 2300, 1840),
    ];

    int totalTarget = 0;
    int totalSales = 0;

    for (var data in dataSource) {
      totalTarget += data.target;
      totalSales += data.sales;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:6.0, left: 4.0, right: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0, right: 12.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            items: <String>[
                              'Gold',
                              'Option 2',
                              'Option 3',
                              'Option 4',
                              'Option 5'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                            hint: const Text('Select'),
                            underline: const SizedBox(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            items: <String>[
                              'Option A',
                              'Option B',
                              'Option C',
                              'Option D',
                              'Option E'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                            hint: const Text('Select'),
                            underline: const SizedBox(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            DoughnutChart(
              dataSource: dataSource,
              totalTarget: totalTarget,
              totalSales: totalSales,
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.category, this.target, this.sales);
  final String category;
  final int target;
  final int sales;
}
