sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/btp/status/test/integration/FirstJourney',
		'sap/btp/status/test/integration/pages/WorkFlowStatusList',
		'sap/btp/status/test/integration/pages/WorkFlowStatusObjectPage'
    ],
    function(JourneyRunner, opaJourney, WorkFlowStatusList, WorkFlowStatusObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/btp/status') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheWorkFlowStatusList: WorkFlowStatusList,
					onTheWorkFlowStatusObjectPage: WorkFlowStatusObjectPage
                }
            },
            opaJourney.run
        );
    }
);