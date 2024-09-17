using my.renee as my from '../db/data/data-model';

@path: '/userService'
@(requires: 'authenticated-user')
service UserService {
    entity Categories
        as projection on my.Categories;
    entity UserRole 
        as projection on my.UserRole;
    entity UserCategories
        as projection on my.UserCategories;
    entity Teams 
        as projection on my.Teams;
    entity User 
        as select from my.Users {
        ID, f_name, l_name, email, role, team, expertise
    } where ID = $user.id ;
};