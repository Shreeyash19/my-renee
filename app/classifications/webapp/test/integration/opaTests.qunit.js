sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/classifications/test/integration/FirstJourney',
		'sap/btp/classifications/test/integration/pages/ClassificationsList',
		'sap/btp/classifications/test/integration/pages/ClassificationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ClassificationsList, ClassificationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/classifications') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheClassificationsList: ClassificationsList,
					onTheClassificationsObjectPage: ClassificationsObjectPage
                }
            },
            opaJourney.run
        );
    }
);