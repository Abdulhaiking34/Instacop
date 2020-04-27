import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';

class RevenueChart extends StatefulWidget {
  @override
  _RevenueChartState createState() => _RevenueChartState();
}

class _RevenueChartState extends State<RevenueChart> {
  DateTime yearPick;

  static List<charts.Series<OrdinalSales, String>> _chartData() {
    final data = [
      new OrdinalSales('1', 5),
      new OrdinalSales('2', 25),
      new OrdinalSales('3', 0),
      new OrdinalSales('4', 75),
      new OrdinalSales('5', 75),
      new OrdinalSales('6', 75),
      new OrdinalSales('7', 75),
      new OrdinalSales('8', 75),
      new OrdinalSales('9', 75),
      new OrdinalSales('10', 200),
      new OrdinalSales('11', 75),
      new OrdinalSales('12', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    yearPick = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ConstScreen.setSizeWidth(15),
          vertical: ConstScreen.setSizeHeight(15)),
      child: Column(
        children: <Widget>[
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ConstScreen.setSizeHeight(10),
                  horizontal: ConstScreen.setSizeWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'TOTAL: ',
                    style: kBoldTextStyle.copyWith(fontSize: FontSize.s30),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '200,000,000 VND',
                    style: kBoldTextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: FontSize.s36,
                        color: kColorOrange),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          //TODO: Chart
          Expanded(
            flex: 3,
            child: Card(
              child: charts.BarChart(
                _chartData(),
                animate: true,
              ),
            ),
          ),
          //TODO: year picker
          Expanded(
            flex: 1,
            child: Card(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: ConstScreen.setSizeWidth(50),
                  ),
                  Text(
                    'Year Picker:',
                    style: kBoldTextStyle.copyWith(fontSize: FontSize.s36),
                  ),
                  //TODO: Year picker
                  Container(
                    height: ConstScreen.setSizeHeight(300),
                    width: ConstScreen.setSizeWidth(300),
                    child: YearPicker(
                      dragStartBehavior: DragStartBehavior.start,
                      firstDate: DateTime.utc(2010),
                      lastDate: DateTime.now(),
                      selectedDate: yearPick,
                      onChanged: (date) {
                        setState(() {
                          yearPick = date;
                        });
                      },
                    ),
                  ),
                  Text(
                    'CURRENT \n ${yearPick.year}',
                    style: kBoldTextStyle.copyWith(fontSize: FontSize.s30),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrdinalSales {
  final String month;
  final int sales;

  OrdinalSales(this.month, this.sales);
}
