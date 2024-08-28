sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/curatorblogs/test/integration/FirstJourney',
		'sap/btp/curatorblogs/test/integration/pages/CuratorBlogsList',
		'sap/btp/curatorblogs/test/integration/pages/CuratorBlogsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CuratorBlogsList, CuratorBlogsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/curatorblogs') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCuratorBlogsList: CuratorBlogsList,
					onTheCuratorBlogsObjectPage: CuratorBlogsObjectPage
                }
            },
            opaJourney.run
        );
    }
);