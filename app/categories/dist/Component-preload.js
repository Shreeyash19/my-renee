//@ui5-bundle sap/btp/categories/Component-preload.js
sap.ui.predefine("sap/btp/categories/Component", ["sap/fe/core/AppComponent"],function(e){"use strict";return e.extend("sap.btp.categories.Component",{metadata:{manifest:"json"}})});
sap.ui.require.preload({
	"sap/btp/categories/i18n/i18n.properties":'# This is the resource bundle for sap.btp.categories\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Categories\n\n#YDES: Application description\nappDescription=Maintain Categories\n\n#XFLD,57\nflpTitle=Maintain Categories\n\n#XFLD,57\nflpTitle=Maintain Categories\n',
	"sap/btp/categories/manifest.json":'{"_version":"1.59.0","sap.app":{"id":"sap.btp.categories","type":"application","i18n":{"bundleUrl":"i18n/i18n.properties","supportedLocales":[""]},"applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap/generator-fiori:worklist","version":"1.14.4","toolsId":"ab5fe21b-124e-4824-a365-f57fd0ff86d0"},"dataSources":{"mainService":{"uri":"odata/v4/admin/","type":"OData","settings":{"annotations":[],"odataVersion":"4.0"}}},"crossNavigation":{"inbounds":{"Categories-Maintain":{"semanticObject":"Categories","action":"Maintain","title":"{{flpTitle}}","signature":{"parameters":{},"additionalParameters":"allowed"}}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.127.1","libs":{"sap.m":{},"sap.ui.core":{},"sap.ushell":{},"sap.fe.templates":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"sap.btp.categories.i18n.i18n","supportedLocales":[""]}},"":{"dataSource":"mainService","preload":true,"settings":{"operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}},"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties","settings":{"supportedLocales":[""]}}},"resources":{"css":[]},"routing":{"config":{},"routes":[{"pattern":":?query:","name":"CategoriesList","target":"CategoriesList"},{"pattern":"Categories({key}):?query:","name":"CategoriesObjectPage","target":"CategoriesObjectPage"}],"targets":{"CategoriesList":{"type":"Component","id":"CategoriesList","name":"sap.fe.templates.ListReport","options":{"settings":{"contextPath":"/Categories","variantManagement":"Page","hideFilterBar":true,"navigation":{"Categories":{"detail":{"route":"CategoriesObjectPage"}}},"controlConfiguration":{"@com.sap.vocabularies.UI.v1.LineItem":{"tableSettings":{"type":"ResponsiveTable"}}}}}},"CategoriesObjectPage":{"type":"Component","id":"CategoriesObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"contextPath":"/Categories"}}}}}},"sap.fiori":{"registrationIds":[],"archeType":"transactional"},"sap.cloud":{"public":true,"service":"my-renee.service"}}'
});
//# sourceMappingURL=Component-preload.js.map
