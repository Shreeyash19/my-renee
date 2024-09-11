//@ui5-bundle sap/btp/status/Component-preload.js
sap.ui.predefine("sap/btp/status/Component", ["sap/fe/core/AppComponent"],function(t){"use strict";return t.extend("sap.btp.status.Component",{metadata:{manifest:"json"}})});
sap.ui.require.preload({
	"sap/btp/status/i18n/i18n.properties":'# This is the resource bundle for sap.btp.status\r\n\r\n#Texts for manifest.json\r\n\r\n#XTIT: Application name\r\nappTitle=Workflow Status \r\n\r\n#YDES: Application description\r\nappDescription=Maintain statuses\r\n\r\n#XFLD,78\r\nflpTitle=Maintain Workflow Statuses\r\n',
	"sap/btp/status/manifest.json":'{"_version":"1.59.0","sap.app":{"id":"sap.btp.status","type":"application","i18n":{"bundleUrl":"i18n/i18n.properties","supportedLocales":[""]},"applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap/generator-fiori:worklist","version":"1.14.4","toolsId":"046eb2a2-593e-4b3e-9b10-6f0f2d9c39ff"},"dataSources":{"mainService":{"uri":"/odata/v4/admin/","type":"OData","settings":{"annotations":[],"odataVersion":"4.0"}}},"crossNavigation":{"inbounds":{"Workflow Status-Maintain":{"semanticObject":"Workflow Status","action":"Maintain","title":"{{flpTitle}}","signature":{"parameters":{},"additionalParameters":"allowed"}}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.127.1","libs":{"sap.m":{},"sap.ui.core":{},"sap.ushell":{},"sap.fe.templates":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"sap.btp.status.i18n.i18n","supportedLocales":[""]}},"":{"dataSource":"mainService","preload":true,"settings":{"operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}},"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties","settings":{"supportedLocales":[""]}}},"resources":{"css":[]},"routing":{"config":{},"routes":[{"pattern":":?query:","name":"WorkFlowStatusList","target":"WorkFlowStatusList"},{"pattern":"WorkFlowStatus({key}):?query:","name":"WorkFlowStatusObjectPage","target":"WorkFlowStatusObjectPage"}],"targets":{"WorkFlowStatusList":{"type":"Component","id":"WorkFlowStatusList","name":"sap.fe.templates.ListReport","options":{"settings":{"contextPath":"/WorkFlowStatus","variantManagement":"Page","hideFilterBar":true,"navigation":{"WorkFlowStatus":{"detail":{"route":"WorkFlowStatusObjectPage"}}},"controlConfiguration":{"@com.sap.vocabularies.UI.v1.LineItem":{"tableSettings":{"type":"ResponsiveTable"}}}}}},"WorkFlowStatusObjectPage":{"type":"Component","id":"WorkFlowStatusObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"contextPath":"/WorkFlowStatus"}}}}}},"sap.fiori":{"registrationIds":[],"archeType":"transactional"},"sap.cloud":{"public":true,"service":"my-renee.service"}}'
});
//# sourceMappingURL=Component-preload.js.map
