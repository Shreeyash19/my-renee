"use strict";

const cds = require("@sap/cds");
const proxy = require("@sap/cds-odata-v2-adapter-proxy");
const express = require("express");

cds.on("bootstrap", app => app.use(proxy()));
cds.on("bootstrap", (app) => {
    app.use(express.json({ limit: '50MB' }));
})

module.exports = cds.server;