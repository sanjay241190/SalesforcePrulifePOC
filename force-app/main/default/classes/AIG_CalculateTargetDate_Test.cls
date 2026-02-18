/*
* Created by : Manu Devaraju
* Description : Test Class for AIG_CalculateTargetDate
* Usage : AIG_CalculateTargetDate is used to calculate Milestone dates using Business hours and Holidays
*/

@isTest 
public class AIG_CalculateTargetDate_Test {
     
     /*
* Method :calculateBusinessHours 
* Description : Adds an interval of time from a start Datetime traversing business hours only. Returns the result Datetime in the local time zone.
* Params : List of AIG_SetDateParameters
* Output : List of Dates
*/ 
    @isTest static void calculateBusinessHours(){
        List<AIG_SetDateParameters> parms = new List<AIG_SetDateParameters>();
        
        // DML on Business hours in NOT allowed - Business hours is an Organization data rather than User data.
        // https://success.salesforce.com/ideaView?id=08730000000l59QAAQ
        // Get the default business hours
        BusinessHours bh = [SELECT Id FROM BusinessHours WHERE IsDefault=true];
        // Create Datetime on May 28, 2013 at 1:06:08 AM in the local timezone.
        Datetime targetTime = Datetime.newInstance(2019, 5, 28, 1, 6, 8);
        // Find whether the time is within the default business hours
        Boolean isWithin= BusinessHours.isWithin(bh.id, targetTime);
        
        //Set Parameters
        AIG_SetDateParameters parm = new  AIG_SetDateParameters();
        parm.businessHoursId = bh.Id;
        parm.daysAfter = 2;
        parm.startDate = system.today();
        parms.add(parm);
        // Calculate Milestone Dates
        List<Date> targetDates = AIG_CalculateTargetDate.getTargetDate(parms);
        System.assert(!targetDates.isEmpty(), 'Milestone System Generated Dates are Retrieved Successfully');  
        
    }
      /*
* Method :calculateBusinessHours 
* Description : Adds an interval of time from a start Datetime traversing business hours only. Returns the result Datetime in the local time zone.
* Params : List of AIG_SetDateParameters
* Output : Empty List of Dates
*/    
    @isTest static void calculateBusinessHoursEmpty(){
        
        List<AIG_SetDateParameters> parms = new List<AIG_SetDateParameters>();
        List<Date> targetDates = AIG_CalculateTargetDate.getTargetDate(parms);
        System.assert(targetDates.isEmpty(), 'Milestone System Generated Dates are Retrieved with Empty List');
        
    }
}