sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/sourcetypes/test/integration/FirstJourney',
		'sap/btp/sourcetypes/test/integration/pages/SourceTypesList',
		'sap/btp/sourcetypes/test/integration/pages/SourceTypesObjectPage'
    ],
    function(JourneyRunner, opaJourney, SourceTypesList, SourceTypesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/sourcetypes') + '/index.html'
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