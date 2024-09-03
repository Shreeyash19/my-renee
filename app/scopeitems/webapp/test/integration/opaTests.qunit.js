sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/scopeitems/test/integration/FirstJourney',
		'sap/btp/scopeitems/test/integration/pages/ScopeItemsList',
		'sap/btp/scopeitems/test/integration/pages/ScopeItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ScopeItemsList, ScopeItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/scopeitems') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheScopeItemsList: ScopeItemsList,
					onTheScopeItemsObjectPage: ScopeItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);