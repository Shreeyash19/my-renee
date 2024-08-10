sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/myexpertise/test/integration/FirstJourney',
		'sap/btp/myexpertise/test/integration/pages/UsersObjectPage'
    ],
    function(JourneyRunner, opaJourney, UsersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/myexpertise') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheUsersObjectPage: UsersObjectPage
                }
            },
            opaJourney.run
        );
    }
);