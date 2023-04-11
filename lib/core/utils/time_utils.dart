class TimeUtils {
  static int calculateHours(DateTime postHour) {
    DateTime now = DateTime.now().toUtc();
    int nowToMinutes = now.hour * 60 + now.minute;
    int postHourToMinutes = postHour.hour * 60 + postHour.minute;
    if(now.day != postHour.day) {
      nowToMinutes += 1440;
    }
    return (nowToMinutes - postHourToMinutes)~/60;
  }
  
}