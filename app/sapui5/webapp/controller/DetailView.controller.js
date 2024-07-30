sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/odata/v4/ODataModel"
], function (Controller, ODataModel) {
    "use strict";

    return Controller.extend("sap.btp.blogdetail.controller.DetailView", {

        onInit: function () {
            this._oModel = this.getOwnerComponent().getModel();
        },

        onCreateEntity: function () {
            var oNewEntity = {
                name: "New Entry",
                description: "Description of the new entry"
            };

            this._oModel.create("/MyBlog", oNewEntity, {
                success: function () {
                    sap.m.MessageToast.show("New instance of entity created successfully");
                },
                error: function (oError) {
                    sap.m.MessageToast.show("Error creating entity instance: " + oError.message);
                }
            });
        }
    });
});