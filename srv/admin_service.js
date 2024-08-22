const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { Classifications } = this.entities;

    this.before('CREATE', 'Classifications', async (req) => {
        const tx = cds.transaction(req);
        const lastEntry = await tx.run(
          SELECT.one.from(Classifications).orderBy('code desc').limit(1)
        );
        // Generate the next Code #
        let nextNumber = 100;
        if (lastEntry && lastEntry.code) {
          const match = lastEntry.code;
          console.log("Last Code's numeral: ", match);
          if (match) {
            nextNumber = match + 100;
            console.log("This Code's computed numeral: ", nextNumber);
          }
        }      
        req.data.code = nextNumber
      }); 
});