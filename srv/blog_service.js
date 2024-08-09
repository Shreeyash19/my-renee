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
          SELECT.one.from(Blogs).orderBy('s_id desc').limit(1)
        );

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
        // Assume, Draft code == '000'
        // Determine, '<Select classification>' code == '000'
        const draft = '000';
        const classi_default = '000'; 
        if (req.data) {
          console.log("Workflow status at Create: ", req.data.status_code)
          console.log("Classification at Create: ", req.data.classification_code)
          req.data.status_code = draft;
          req.data.classification_code = classi_default; 
        
          // Author = User
          // Accessing current user
          const { user } = cds.context
          console.log("Users: ", user, cds.User)
          if ( user && user.email) {
            req.data.author.email = user.email
          }    
        }
      });

});