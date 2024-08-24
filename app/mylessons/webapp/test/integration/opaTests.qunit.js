sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/mylessons/test/integration/FirstJourney',
		'sap/btp/mylessons/test/integration/pages/BlogsList',
		'sap/btp/mylessons/test/integration/pages/BlogsObjectPage'
    ],
    function(JourneyRunner, opaJourney, BlogsList, BlogsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/mylessons') + '/index.html'
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