sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/mylessons/test/integration/FirstJourney',
		'sap/btp/mylessons/test/integration/pages/LessonsList',
		'sap/btp/mylessons/test/integration/pages/LessonsObjectPage'
    ],
    function(JourneyRunner, opaJourney, LessonsList, LessonsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/mylessons') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLessonsList: LessonsList,
					onTheLessonsObjectPage: LessonsObjectPage
                }
            },
            opaJourney.run
        );
    }
);