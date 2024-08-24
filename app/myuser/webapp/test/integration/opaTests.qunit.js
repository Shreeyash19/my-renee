sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/myuser/test/integration/FirstJourney',
		'sap/btp/myuser/test/integration/pages/UsersList',
		'sap/btp/myuser/test/integration/pages/UsersObjectPage'
    ],
    function(JourneyRunner, opaJourney, UsersList, UsersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/myuser') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheUsersList: UsersList,
					onTheUsersObjectPage: UsersObjectPage
                }
            },
            opaJourney.run
        );
    }
);