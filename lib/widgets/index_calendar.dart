/**
 * Created by luhai on 2020/7/17
 */

import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';

CalendarController controller= new CalendarController(
    minYear: 2018,
    minYearMonth: 1,
    maxYear: 2025,
    maxYearMonth: 12,
    showMode: CalendarConstants.MODE_SHOW_MONTH_AND_WEEK
);

CalendarViewWidget calendar= CalendarViewWidget(
  calendarController: controller,

);