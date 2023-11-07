import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:high_chart/high_chart.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'KindaCode.com',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const MyBarCharts());
  }
}
// Generate some dummy data for the chart
// This will be used to draw the red line
final List<FlSpot> dummyData1 = List.generate(8, (index) {
  return FlSpot(index.toDouble(), index * Random().nextDouble());
});

// This will be used to draw the orange line
final List<FlSpot> dummyData2 = List.generate(8, (index) {
  return FlSpot(index.toDouble(), index * Random().nextDouble());
});

// This will be used to draw the blue line
final List<FlSpot> dummyData3 = List.generate(8, (index) {
  return FlSpot(index.toDouble(), index * Random().nextDouble());
});


class MyBarCharts extends StatelessWidget {
  const MyBarCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            height: double.maxFinite,
               child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: GridView.count(
                   crossAxisCount: 1,
                   children: [
                     const LineCharts(),
                     BarCharts(),
                     const PieCharts(),
                     const TriangularCharts(),
                     const ExampleChart(),
                     ],
                  ),
                );
              }
               ),
          ),

      )
    );
  }
}

class LineCharts extends StatefulWidget {

  const LineCharts({super.key,});

  @override
  State<LineCharts> createState() => _LineChartsState();
}

class _LineChartsState extends State<LineCharts> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text("Line Chart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),   SizedBox(
          height: 20,
        ),
        Expanded(
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: false),
              lineBarsData: [
                // The red line
                LineChartBarData(
                  spots: dummyData1,
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.indigo,
                ),
                // The orange line
                LineChartBarData(
                  spots: dummyData2,
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.red,
                ),
                // The blue line
                LineChartBarData(
                  spots: dummyData3,
                  isCurved: false,
                  barWidth: 3,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}


// Define data structure for a bar group
class DataItem {
  int x;
  double y1;
  double y2;
  double y3;
  DataItem(
      {required this.x, required this.y1, required this.y2, required this.y3}
      );
}

class BarCharts extends StatelessWidget {
  BarCharts({Key? key}) : super(key: key);

  // Generate dummy data to feed the chart
  final List<DataItem> _myData = List.generate(
      30,
          (index) => DataItem(
        x: index,
        y1: Random().nextInt(20) + Random().nextDouble(),
        y2: Random().nextInt(20) + Random().nextDouble(),
        y3: Random().nextInt(20) + Random().nextDouble(),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text("Bar Chart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),   const SizedBox(
            height: 20,
          ),
          Expanded(
            child: BarChart(
                BarChartData(
                borderData: FlBorderData(
                    border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide(width: 1),
                      bottom: BorderSide(width: 1),
                    )),
                groupsSpace: 10,
                barGroups: [
                  BarChartGroupData(x: 1, barRods: [
                    BarChartRodData(fromY: 0, toY: 10, width: 15, color: Colors.amber,borderRadius: BorderRadius.circular(0.0)),
                  ]),
                  BarChartGroupData(x: 2, barRods: [
                    BarChartRodData(fromY: 0, toY: 10, width: 15, color: Colors.amber,borderRadius: BorderRadius.circular(0.0)),
                  ]),
                  BarChartGroupData(x: 3, barRods: [
                    BarChartRodData(fromY: 0, toY: 15, width: 15, color: Colors.amber,borderRadius: BorderRadius.circular(0.0)),
                  ]),
                  BarChartGroupData(x: 4, barRods: [
                    BarChartRodData(fromY: 0, toY: 10, width: 15, color: Colors.amber,borderRadius: BorderRadius.circular(0.0)),
                  ]),

                ])),
          ),
        ],
      ),
    );
  }
}


class PieCharts extends StatelessWidget {
  const PieCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text("Pie Chart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),   const SizedBox(
            height: 20,
          ),
          Expanded(
              child: PieChart(
                  PieChartData(
                  centerSpaceRadius: 50,
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 2,
                  sections: [
                    PieChartSectionData(
                        value: 35, color: Colors.purple, radius: 70),
                    PieChartSectionData(
                        value: 40, color: Colors.amber, radius: 70),
                    PieChartSectionData(
                        value: 55, color: Colors.green, radius: 70),
                    PieChartSectionData(
                        value: 70, color: Colors.orange, radius: 70),
                  ])
              )
          ),
        ],
      ),
    );
  }
}

class TriangularCharts extends StatelessWidget {
  const TriangularCharts ({super.key});

@override
Widget build(BuildContext context) {
  final List<ChartData> chartData = [
    ChartData('David', 25,Colors.yellow),
    ChartData('Steve', 38,Colors.yellow),
    ChartData('Jack', 34,Colors.yellow),
    ChartData('Others', 52,Colors.yellow)
  ];
  return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text("Triangular Chart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),   const SizedBox(
            height: 20,
          ),

          Expanded(
              child: SfPyramidChart(
                  series:PyramidSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y
                  )
              )
          ),
        ],
      )
  );
}
}

class ChartData {
  ChartData(this.x, this.y, this.color,);
  final String x;
  final double y;
  final Color color;
}

class ExampleChart extends StatefulWidget {
  const ExampleChart({Key? key}) : super(key: key);

  @override
  _ExampleChartState createState() => _ExampleChartState();
}

class _ExampleChartState extends State<ExampleChart> {
  final String _chartData = '''{
      title: {
          text: 'Combination chart'
      },    
      xAxis: {
          categories: ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
      },
      labels: {
          items: [{
              html: 'Total fruit consumption',
              style: {
                  left: '50px',
                  top: '18px',
                  color: ( // theme
                      Highcharts.defaultOptions.title.style &&
                      Highcharts.defaultOptions.title.style.color
                  ) || 'black'
              }
          }]
      },
      series: [{
          type: 'column',
          name: 'Jane',
          data: [3, 2, 1, 3, 3]
      }, {
          type: 'column',
          name: 'John',
          data: [2, 4, 5, 7, 6]
      }, {
          type: 'column',
          name: 'Joe',
          data: [4, 3, 3, 5, 0]
      }, {
          type: 'spline',
          name: 'Average',
          data: [3, 2.67, 3, 6.33, 3.33],
          marker: {
              lineWidth: 2,
              lineColor: Highcharts.getOptions().colors[3],
              fillColor: 'white'
          }
      }, {
          type: 'pie',
          name: 'Total consumption',
          data: [{
              name: 'Jane',
              y: 13,
              color: Highcharts.getOptions().colors[0] // Jane's color
          }, {
              name: 'John',
              y: 23,
              color: Highcharts.getOptions().colors[1] // John's color
          }, {
              name: 'Joe',
              y: 19,
              color: Highcharts.getOptions().colors[2] // Joe's color
          }],
          center: [100, 80],
          size: 100,
          showInLegend: false,
          dataLabels: {
              enabled: false
          }
        }]
    }''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('High Charts'),
      ),
      body: HighCharts(
        loader: const SizedBox(
          width: 200,
          child: LinearProgressIndicator(),
        ),
        size: const Size(415, 400),
        data: _chartData,
        scripts: const [
          "https://code.highcharts.com/highcharts.js",
          'https://code.highcharts.com/modules/networkgraph.js',
          'https://code.highcharts.com/modules/exporting.js',
        ],
      ),
    );
  }
}