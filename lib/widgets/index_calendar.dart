import 'package:flutter/material.dart';
/**
 * Created by luhai on 2020/7/17
 */

import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';

CalendarController controller= new CalendarController(
  minYear: 2018,
  minYearMonth: 1,
  maxYear: 2025,
  maxYearMonth: 12,
  showMode: CalendarConstants.MODE_SHOW_WEEK_AND_MONTH,
  offset: 1,
);

CalendarViewWidget calendar= CalendarViewWidget(
  calendarController: controller,
//  itemSize: 40,
//  boxDecoration: BoxDecoration(color: Colors.red),
  weekBarItemWidgetBuilder: weekBar,
  dayWidgetBuilder: dayWidget,
);

Widget dayWidget(DateModel dateModel){
  return DefaultCombineDayWidget(dateModel);
}

Widget weekBar() {
  return CustomStyleWeekBarItem();
}

class CustomStyleWeekBarItem extends BaseWeekBar {
  List<String> weekList = ["SUN", "MON", "TUE", "WEN", "THU", "SUN", "SAT"];

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List();

    var items = getWeekDayWidget();
    children.add(Row(
      children: items,
    ));

    return Column(
      children: children,
    );
  }

  @override
  Widget getWeekBarItem(int index) {
    return new Container(
      margin: EdgeInsets.only(top: 22, bottom: 22),
      child: new Center(
        child: new Text(
          weekList[index],
          style:
          TextStyle(fontWeight: FontWeight.w200, color: Colors.green),
        ),
      ),
    );
  }
}



class DefaultCombineDayWidget extends BaseCombineDayWidget {
  DefaultCombineDayWidget(DateModel dateModel) : super(dateModel);

  @override
  Widget getNormalWidget(DateModel dateModel) {
    //实现默认状态下的UI
    return Container(
      color: Colors.red,
      child: Text('${dateModel.day}'),
    );
  }

  @override
  Widget getSelectedWidget(DateModel dateModel) {
    //绘制被选中的UI
    return Container(
      color: Colors.lightGreen,
      child: Text('${dateModel.day}'),
    );
  }
}