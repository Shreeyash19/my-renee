sap.ui.define(
    ["sap/fe/core/AppComponent"],
    function (Component) {
        "use strict";

        return Component.extend("sap.btp.blogdetail.Component", {
            metadata: {
                manifest: "json"
            },

            /**
             * Gets the component startup parameters, setting preferredMode to 'create'.
             * @public
             * @returns 
             */
            getStartupParameters: function() {
                return Promise.resolve({
                    preferredMode: ["create"]
                });
            }
        });
    }
)
sap.ui.getCore().attachInit(function() {
    console.log("Core initialized");

    sap.ui.core.Component.create({
        name: "sap.btp.blogdetail",
        async: true
    }).then(function (oComponent) {
        console.log("Component created asynchronously");
        oComponent.placeAt("content");
    }).catch(function (error) {
        console.error("Error creating component:", error);
    });
});