public class CoverageTestController {
    public static void checkWeather(String status) {
        // Path 1: This will be covered
        if (status == 'Sunny') {
            System.debug('It is a beautiful day!');
            System.debug('Remember your sunscreen.');
        } 
        
        // Path 2: We will purposely NOT cover this block
        else if (status == 'Rainy') {
            System.debug('Grab an umbrella.');
            System.debug('Drive safely in the rain.');
            System.debug('Check for local flooding alerts.');
            System.debug('Ensure your windshield wipers work.');
        }
    }
}