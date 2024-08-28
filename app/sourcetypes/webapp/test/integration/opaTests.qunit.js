sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/com/sourcetypes/test/integration/FirstJourney',
		'sap/com/sourcetypes/test/integration/pages/SourceTypesList',
		'sap/com/sourcetypes/test/integration/pages/SourceTypesObjectPage'
    ],
    function(JourneyRunner, opaJourney, SourceTypesList, SourceTypesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/com/sourcetypes') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSourceTypesList: SourceTypesList,
					onTheSourceTypesObjectPage: SourceTypesObjectPage
                }
            },
            opaJourney.run
        );
    }
);