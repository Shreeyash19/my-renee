const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { Blogs } = this.entities;

    // Log to ensure the service impl is being initialized
    console.log('Service implementation initialized for BlogService');

    this.before('CREATE', 'Blogs', async (req) => {
        console.log('Before create hook triggered'); // Log when the hook is triggered
        console.log('Request Data:', req.data); // Log the incoming request data

        const tx = cds.transaction(req);
        const lastEntry = await tx.run(
          SELECT.one.from(Blogs).orderBy('ID desc').limit(1)
        );

        // console.log('Last ID entry:', lastEntry.ID);

        // // Generate the next ID
        // let nextNumberId = 1;
        // if (lastEntry && lastEntry.ID) {
        //     const match = lastEntry.ID;
        //     if (match) {
        //         nextNumberId = match + 1;
        //     }
        // }
        // console.log('Generated ID:', nextNumberId);
        // req.data.ID = nextNumberId;

        // Generate the next S-ID
        let nextNumber = 1;
        if (lastEntry && lastEntry.s_id) {
          const match = lastEntry.s_id.match(/S(\d{4})/);
          console.log("Last S-ID's numeral: ", match[1]);
          if (match) {
            nextNumber = parseInt(match[1], 10) + 1;
          }
        }
    
        const nextS_ID = `S${nextNumber.toString().padStart(4, '0')}`;
        console.log('Generated S-ID:', nextS_ID);

        req.data.s_id = nextS_ID;

        // Determine workflow status as 'Draft'
        // Assume, Draft == '000'
        const draft = '000';
        const classi_default = '000'; 
        if (req.data) {
          console.log("Workflow status at Create: ", req.data.status_code)
          console.log("Classification at Create: ", req.data.classification_code)
          req.data.status_code = draft;
          req.data.classification_code = classi_default; 
        }
      });

});