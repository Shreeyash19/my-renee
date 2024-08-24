sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'sap.btp.categories',
            componentId: 'Categories_textsObjectPage',
            contextPath: '/Categories/texts'
        },
        CustomPageDefinitions
    );
});