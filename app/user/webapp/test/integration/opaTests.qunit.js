sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/user/test/integration/FirstJourney',
		'sap/btp/user/test/integration/pages/UserList',
		'sap/btp/user/test/integration/pages/UserObjectPage'
    ],
    function(JourneyRunner, opaJourney, UserList, UserObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/user') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheUserList: UserList,
					onTheUserObjectPage: UserObjectPage
                }
            },
            opaJourney.run
        );
    }
);