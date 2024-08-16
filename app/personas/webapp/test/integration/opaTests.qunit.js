sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/personas/test/integration/FirstJourney',
		'sap/btp/personas/test/integration/pages/PersonasList',
		'sap/btp/personas/test/integration/pages/PersonasObjectPage'
    ],
    function(JourneyRunner, opaJourney, PersonasList, PersonasObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/personas') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePersonasList: PersonasList,
					onThePersonasObjectPage: PersonasObjectPage
                }
            },
            opaJourney.run
        );
    }
);