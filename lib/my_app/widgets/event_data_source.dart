


import 'package:tasko/my_models/calendar_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
class EventDataSource extends CalendarDataSource{

EventDataSource(List<ModelCalendar> appointments){

  this.appointments=appointments;

}

ModelCalendar getEvent(int index)=> appointments![index] as ModelCalendar;

@override
  String getSubject(int index)=> getEvent(index).event_name;






}