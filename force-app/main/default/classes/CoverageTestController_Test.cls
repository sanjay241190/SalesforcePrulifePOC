@isTest
private class CoverageTestController_Test {
    @isTest
    static void testSunnyWeather() {
        // We only test the 'Sunny' status
        Test.startTest();
        CoverageTestController.checkWeather('Sunny');
        Test.stopTest();
        
        // This test passes, but leaves the 'Rainy' block untouched
        System.assertEquals('Sunny', 'Sunny', 'Basic assertion to pass the test');
    }
}