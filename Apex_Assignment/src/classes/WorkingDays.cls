public class WorkingDays{
  public Static Integer getWorkingDays(Datetime startDate,Datetime endDate)
  {
    Integer count = 0;
    while (startDate < endDate) {
        if (startDate.format('EEEEEE') != 'Saturday' && startDate.format('EEEEEE') != 'Sunday') {
            count++;
        }
        startDate = startDate.addDays(1);
    }
    return count;
  }
}