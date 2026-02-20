@isTest
private class CoverageTestController_Test {

    @isTest
    static void testSunnyWeather() {
        Test.startTest();
        CoverageTestController.checkWeather('Sunny');
        Test.stopTest();
        
        System.assertEquals('Sunny', 'Sunny');
    }
    
    @isTest
    static void testRainyWeather() {
        Test.startTest();
        CoverageTestController.checkWeather('Rainy');
        Test.stopTest();
        
        System.assertEquals('Rainy', 'Rainy');
    }
}