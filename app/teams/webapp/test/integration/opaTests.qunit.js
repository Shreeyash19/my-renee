sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/teams/test/integration/FirstJourney',
		'sap/btp/teams/test/integration/pages/TeamsList',
		'sap/btp/teams/test/integration/pages/TeamsObjectPage'
    ],
    function(JourneyRunner, opaJourney, TeamsList, TeamsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/teams') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTeamsList: TeamsList,
					onTheTeamsObjectPage: TeamsObjectPage
                }
            },
            opaJourney.run
        );
    }
);