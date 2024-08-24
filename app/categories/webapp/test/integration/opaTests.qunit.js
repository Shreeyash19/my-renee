sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/categories/test/integration/FirstJourney',
		'sap/btp/categories/test/integration/pages/CategoriesList',
		'sap/btp/categories/test/integration/pages/CategoriesObjectPage',
		'sap/btp/categories/test/integration/pages/Categories_textsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CategoriesList, CategoriesObjectPage, Categories_textsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/categories') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCategoriesList: CategoriesList,
					onTheCategoriesObjectPage: CategoriesObjectPage,
					onTheCategories_textsObjectPage: Categories_textsObjectPage
                }
            },
            opaJourney.run
        );
    }
);