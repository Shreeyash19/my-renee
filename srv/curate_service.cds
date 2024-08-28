using my.renee as my from '../db/data/data-model';

service CurateService @(requires: 'authenticated-user'){
    //entity Blogs as projection on my.Blogs; 
    entity WorkFlowStatus @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as projection on my.WorkFlowStatus;
    entity Categories @(restrict: [ 
        { grant: ['READ'], to: 'renee-Curator' }
        ])
        as projection on my.Categories;
    entity Classifications @(restrict: [ 
        { grant: ['READ'], to: 'renee-Curator' }
        ])
        as projection on my.Classifications;
    entity ProductVersions @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as projection on my.ProductVersions;
    entity BlogCategories @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as projection on my.BlogCategories;
    entity BlogVersions @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as projection on my.BlogVersions;
    entity BlogRelated @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as projection on my.BlogRelated;
    entity BlogPersonas @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as projection on my.BlogPersonas;
    entity SourceTypes @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as projection on my.SourceTypes;

    // Define the Blog entity with Categories and Users relationships
    entity CuratorBlogs @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as select from my.Blogs {
        ID, s_id, title, text, status, classification, internal, 
        personas, versions, related, source, source_type, project,
        categories  
        } where exists (
            select from my.Categories as c
            where c.ID in (
            select category.ID from my.UserCategories as u
            where u.user.ID = $user 
            )
        );
};