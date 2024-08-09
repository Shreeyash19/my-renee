sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/curate/test/integration/FirstJourney',
		'sap/btp/curate/test/integration/pages/BlogsList',
		'sap/btp/curate/test/integration/pages/BlogsObjectPage'
    ],
    function(JourneyRunner, opaJourney, BlogsList, BlogsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/curate') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBlogsList: BlogsList,
					onTheBlogsObjectPage: BlogsObjectPage
                }
            },
            opaJourney.run
        );
    }
);