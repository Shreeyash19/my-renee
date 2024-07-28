sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/blogdetail/test/integration/FirstJourney',
		'sap/btp/blogdetail/test/integration/pages/BlogsObjectPage',
		'sap/btp/blogdetail/test/integration/pages/BlogCategoriesObjectPage'
    ],
    function(JourneyRunner, opaJourney, BlogsObjectPage, BlogCategoriesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/blogdetail') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBlogsObjectPage: BlogsObjectPage,
					onTheBlogCategoriesObjectPage: BlogCategoriesObjectPage
                }
            },
            opaJourney.run
        );
    }
);