/*
* Created by :  Karan Kalra
* Description : Calculate Business Hours - Define business hours and holidays in the RPI
* Use the BusinessHours methods to set the business hours at which your customer support team operates.
* @parameters : AIG_SetDateParameters 
* Sample Input : AIG_SetDateParameters {startDate : , daysAfter: , businessHoursId: }
* Usage : Used in the Milestone flows to calculate System generated target dates using Business Rules and Holidays
* 
*/
public class AIG_CalculateTargetDate {
 /*
* Method :getTargetDate 
* Description : Adds an interval of time from a start Datetime traversing business hours only. Returns the result Datetime in the local time zone.
* Params : List of AIG_SetDateParameters
*/ 
    @InvocableMethod (label='Calculate Target Date' description='Inputs List of Parameters and calculates next Business date') 
    public static List<Date> getTargetDate(List<AIG_SetDateParameters> inputParameters)
    {	
        List<Date> targetDates = new List<Date>();
        if(!inputParameters.isEmpty() && inputParameters[0]!= null){
            DateTime startDate = DateTime.valueOf(String.valueOf(inputParameters[0].startDate)+' '+String.valueOf(System.now()).subStringAfter(' '));
            Integer daysAfter = inputParameters[0].daysAfter*86400000; //Convert Days into milliseconds
            Date TDate = BusinessHours.add(inputParameters[0].businessHoursId, startDate, daysAfter).date();
            targetDates.add(TDate);
        } 
        return(targetDates);
    } 
}