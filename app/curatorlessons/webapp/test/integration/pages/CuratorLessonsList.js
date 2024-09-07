sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'sap.btp.curatorlessons',
            componentId: 'CuratorLessonsList',
            contextPath: '/CuratorLessons'
        },
        CustomPageDefinitions
    );
});