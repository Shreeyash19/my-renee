sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/versions/test/integration/FirstJourney',
		'sap/btp/versions/test/integration/pages/ProductVersionsList',
		'sap/btp/versions/test/integration/pages/ProductVersionsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductVersionsList, ProductVersionsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/versions') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductVersionsList: ProductVersionsList,
					onTheProductVersionsObjectPage: ProductVersionsObjectPage
                }
            },
            opaJourney.run
        );
    }
);