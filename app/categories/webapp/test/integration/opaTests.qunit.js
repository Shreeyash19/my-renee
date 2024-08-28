sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/categories/test/integration/FirstJourney',
		'sap/btp/categories/test/integration/pages/CategoriesList',
		'sap/btp/categories/test/integration/pages/CategoriesObjectPage'
    ],
    function(JourneyRunner, opaJourney, CategoriesList, CategoriesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/categories') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCategoriesList: CategoriesList,
					onTheCategoriesObjectPage: CategoriesObjectPage
                }
            },
            opaJourney.run
        );
    }
);