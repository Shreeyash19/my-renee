const validator = require('validator')
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
                let user_email;

                if (!validator.isEmail(userId)) {
                    console.log('Invalid userId:', userId);
                    return req.reject(400, 'Invalid userId');
                }

                if (validator.isEmail(userId)) {
                    user_email = userId;  
                }

                console.log('Inserting new user with ID:', userId);

                await cds.transaction(req).run(
                    INSERT.into(Users).entries({ ID: userId, email: user_email })
                );

                console.log('User inserted successfully');
            }
        } catch (error) {
            console.error('Error during user lookup or insertion:', error);
            return req.reject(500, 'In Users: Server error', error);
        }
    });
};