//@ui5-bundle sap/btp/personas/Component-preload.js
sap.ui.require.preload({
	"sap/btp/personas/Component.js":function(){
sap.ui.define(["sap/fe/core/AppComponent"],function(e){"use strict";return e.extend("sap.btp.personas.Component",{metadata:{manifest:"json"}})});
},
	"sap/btp/personas/i18n/i18n.properties":'# This is the resource bundle for sap.btp.personas\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Administration services\n\n#YDES: Application description\nappDescription=Target Audience\n\n#XFLD,75\nflpTitle=Maintain Target Audiences\n',
	"sap/btp/personas/manifest.json":'{"_version":"1.59.0","sap.app":{"id":"sap.btp.personas","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap/generator-fiori:worklist","version":"1.14.4","toolsId":"636dbdfe-c8b6-42ca-b0a5-49f4dee7ec9d"},"dataSources":{"mainService":{"uri":"/odata/v4/admin/","type":"OData","settings":{"annotations":[],"odataVersion":"4.0"}}},"crossNavigation":{"inbounds":{"Personas-Maintain":{"semanticObject":"Personas","action":"Maintain","title":"{{flpTitle}}","signature":{"parameters":{},"additionalParameters":"allowed"}}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.127.0","libs":{"sap.m":{},"sap.ui.core":{},"sap.ushell":{},"sap.fe.templates":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"sap.btp.personas.i18n.i18n"}},"":{"dataSource":"mainService","preload":true,"settings":{"operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}},"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties"}},"resources":{"css":[]},"routing":{"config":{},"routes":[{"pattern":":?query:","name":"PersonasList","target":"PersonasList"},{"pattern":"Personas({key}):?query:","name":"PersonasObjectPage","target":"PersonasObjectPage"}],"targets":{"PersonasList":{"type":"Component","id":"PersonasList","name":"sap.fe.templates.ListReport","options":{"settings":{"contextPath":"/Personas","variantManagement":"Page","hideFilterBar":true,"navigation":{"Personas":{"detail":{"route":"PersonasObjectPage"}}},"controlConfiguration":{"@com.sap.vocabularies.UI.v1.LineItem":{"tableSettings":{"type":"ResponsiveTable"}}}}}},"PersonasObjectPage":{"type":"Component","id":"PersonasObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"contextPath":"/Personas"}}}}}},"sap.fiori":{"registrationIds":[],"archeType":"transactional"},"sap.cloud":{"public":true,"service":"my-renee.service"}}'
});
//# sourceMappingURL=Component-preload.js.map
