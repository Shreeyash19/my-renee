const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { Blogs } = this.entities;

    // Log to ensure the service impl is being initialized
    console.log('Service implementation initialized for BlogService');

    this.before('CREATE', Blogs, async (req) => {
        console.log('Before create Blogs hook triggered'); // Log when the hook is triggered
        console.log('Request Data:', req.data); // Log the incoming request data

        const tx = cds.transaction(req);
        const lastEntry = await tx.run(
          SELECT.one.from(Blogs).orderBy('s_id desc').limit(1)
        );

        // Generate the next S-ID
        let nextNumber = 1;
        if (lastEntry && lastEntry.s_id) {
          console.log("Last S-ID: ", lastEntry.s_id);
          const match = lastEntry.s_id.match(/S(\d{4})/);
          console.log("Last S-ID's numeral: ", match[1]);
          if (match) {
            nextNumber = parseInt(match[1], 10) + 1;
          }
        }
    
        const nextS_ID = `S${nextNumber.toString().padStart(4, '0')}`;
        console.log('Generated S-ID:', nextS_ID);

        req.data.s_id = nextS_ID;

        // Accessing current user
        if (req.user && req.user.id) {
          const { userId } = req.user.id;
          console.log("Current user: ", userId)
          let author_email;
          if (req.data && !req.data.author) {
            // The data do not contain an author ID
            // Use user's ID as author
            req.data.author = userId;
          };

        };
        
      });
});