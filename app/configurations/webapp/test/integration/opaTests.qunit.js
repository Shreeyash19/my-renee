sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/configurations/test/integration/FirstJourney',
		'sap/btp/configurations/test/integration/pages/ConfigurationsList',
		'sap/btp/configurations/test/integration/pages/ConfigurationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ConfigurationsList, ConfigurationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/configurations') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheConfigurationsList: ConfigurationsList,
					onTheConfigurationsObjectPage: ConfigurationsObjectPage
                }
            },
            opaJourney.run
        );
    }
);