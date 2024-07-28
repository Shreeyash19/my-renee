sap.ui.define([
    "sap/ui/core/mvc/Controller"
], function(Controller) {
    "use strict";

    return Controller.extend("sap.btp.blogdetail.controller.DetailView", {
        onInit: function() {
            var oModel = this.getView().getModel();
            console.log(oModel);
        },

        onClassificationChange: function(oEvent) {
            var selectedKey = oEvent.getSource().getSelectedKey();
            sap.m.MessageToast.show("Selected Classification: " + selectedKey);
        }
    });
});