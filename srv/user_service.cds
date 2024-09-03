using my.renee as my from '../db/data/data-model';

service UserService @(requires: 'authenticated-user'){
    entity Categories @(restrict: [ 
        { grant: ['READ'], to: 'renee-Curator' } 
        ])
        as projection on my.Categories;
    entity UserRole @(restrict: [ 
        { grant: ['READ'], to: 'renee-Curator' } 
        ])
        as projection on my.UserRole;
    entity UserCategories @(restrict: [ 
        { grant: ['READ', 'WRITE', DELETE], to: 'renee-Curator' } 
        ])
        as projection on my.UserCategories;
    entity Teams @(restrict: [ 
        { grant: ['READ'], to: 'renee-Curator' } 
        ])
        as projection on my.Teams;
    entity User @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' } 
        ])
        as select from my.Users {
        ID, f_name, l_name, email, role, team, expertise
    } where ID = $user.id ;
};