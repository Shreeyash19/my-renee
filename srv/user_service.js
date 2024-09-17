const cds = require('@sap/cds');

console.log("user_service.js is being loaded.");

module.exports = (srv) => {
    
    console.log('Service implementation initialized for User Service');

    srv.before('*', 'Users', async (req) => {
        console.log("Before handler triggered for request:", req.event);
        const userId = req.user && req.user.id; // Capture the authenticated user ID
        console.log('Authenticated User ID from req: ', userId);

        if (!userId) {
            console.log('No User ID found in req! Exit with 401');
            return req.reject(401, 'User ID not found');
        }

        if (userId && userId === 'Anonymous') {
            console.log('User is invalid and unknown. Exit with 401', UserId);
            return req.reject(401, 'User ID "Anonymous" invalid');
        }

        try {
            const userExists = await cds.transaction(req).run(SELECT.one.from(Users, (u) => {
                u.ID}).where({ID: userId})); 
                console.log('User exists?', userExists);

            if (!userExists) {
                let user_email = userId;


                console.log('User inserted successfully');
            }
        } catch (error) {
            console.error('Error during user lookup or insertion:', error);
            return req.reject(500, 'Server error');
        }
    });
};