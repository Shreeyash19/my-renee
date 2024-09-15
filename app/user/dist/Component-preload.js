//@ui5-bundle sap/btp/user/Component-preload.js
sap.ui.predefine("sap/btp/user/Component", ["sap/fe/core/AppComponent"],function(e){"use strict";return e.extend("sap.btp.user.Component",{metadata:{manifest:"json"}})});
sap.ui.require.preload({
	"sap/btp/user/i18n/i18n.properties":'# This is the resource bundle for sap.btp.user\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=User\n\n#YDES: Application description\nappDescription=Maintain Expert Categories\n\n#XFLD,87\nflpTitle=Maintain Expertise Categories\n',
	"sap/btp/user/manifest.json":'{"_version":"1.59.0","sap.app":{"id":"sap.btp.user","type":"application","i18n":{"bundleUrl":"i18n/i18n.properties","supportedLocales":[""]},"applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap/generator-fiori:worklist","version":"1.14.4","toolsId":"6c00d94f-0f64-40d7-a76f-5d45d02968c0"},"dataSources":{"mainService":{"uri":"odata/v4/user/","type":"OData","settings":{"annotations":[],"odataVersion":"4.0"}}},"crossNavigation":{"inbounds":{"User-Maintain":{"semanticObject":"User","action":"Maintain","title":"{{flpTitle}}","signature":{"parameters":{},"additionalParameters":"allowed"}}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.127.1","libs":{"sap.m":{},"sap.ui.core":{},"sap.ushell":{},"sap.fe.templates":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"sap.btp.user.i18n.i18n","supportedLocales":[""]}},"":{"dataSource":"mainService","preload":true,"settings":{"operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}},"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties","settings":{"supportedLocales":[""]}}},"resources":{"css":[]},"routing":{"config":{},"routes":[{"pattern":":?query:","name":"UserList","target":"UserList"},{"pattern":"User({key}):?query:","name":"UserObjectPage","target":"UserObjectPage"}],"targets":{"UserList":{"type":"Component","id":"UserList","name":"sap.fe.templates.ListReport","options":{"settings":{"contextPath":"/User","variantManagement":"Page","hideFilterBar":true,"navigation":{"User":{"detail":{"route":"UserObjectPage"}}},"controlConfiguration":{"@com.sap.vocabularies.UI.v1.LineItem":{"tableSettings":{"type":"ResponsiveTable"}}}}}},"UserObjectPage":{"type":"Component","id":"UserObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"contextPath":"/User"}}}}}},"sap.fiori":{"registrationIds":[],"archeType":"transactional"},"sap.cloud":{"public":true,"service":"my-renee.service"}}'
});
//# sourceMappingURL=Component-preload.js.map
