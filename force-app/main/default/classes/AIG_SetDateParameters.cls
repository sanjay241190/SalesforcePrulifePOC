/*
 * Created by :  Karan Kalra
 * Description : Calculate Business Hours - Define business hours and holidays in the RPI
 * Use the BusinessHours methods to set the business hours at which your customer support team operates.
 * @parameters : AIG_SetDateParameters 
 * Sample Input : 
 * Usage : Used in the Milestone flows to calculate Business hours
 * 
*/
global class AIG_SetDateParameters {
@InvocableVariable global Date startDate;
@InvocableVariable global Integer daysAfter;
@InvocableVariable global ID businessHoursId;
}