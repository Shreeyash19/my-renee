sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/curatorlessons/test/integration/FirstJourney',
		'sap/btp/curatorlessons/test/integration/pages/CuratorLessonsList',
		'sap/btp/curatorlessons/test/integration/pages/CuratorLessonsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CuratorLessonsList, CuratorLessonsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/curatorlessons') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCuratorLessonsList: CuratorLessonsList,
					onTheCuratorLessonsObjectPage: CuratorLessonsObjectPage
                }
            },
            opaJourney.run
        );
    }
);