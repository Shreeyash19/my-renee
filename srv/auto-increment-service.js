const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { MyBlogs } = this.entities;

    this.on('CREATE', 'MyBlogs', async (req) => {
        const nextId = await getNextId(MyBlogs);
        req.data.ID = nextId;
        return await INSERT.into(MyBlogs).entries(req.data);
    });

    async function getNextId(MyBlogs) {
        const result = await SELECT.one.from(MyBlogs).columns('max(ID) as maxId');
        return (result.maxId || 0) + 1;
    }
});