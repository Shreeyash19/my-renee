using my.renee as my from '../db/data/data-model';


service BlogService @(requires: 'authenticated-user'){

    entity Users @(restrict: [ 
        { grant: ['READ'], to: 'renee-Author' }
        ])
        as projection on my.Users;
    entity WorkFlowStatus @(restrict: [
            { grant: ['READ'], to: 'renee-Author' }
        ])
        as projection on my.WorkFlowStatus;
    entity Categories as projection on my.Categories;
    entity ProductVersions @(restrict: [
            { grant: ['READ'], to: 'renee-Author' }
        ])
        as projection on my.ProductVersions;
    entity BlogCategories @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Author' }
        ])
        as projection on my.BlogCategories;
    entity BlogCurators @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Author' }
        ])
        as projection on my.BlogCurators;
    entity BlogVersions @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Author' }
        ])
        as projection on my.BlogVersions;
    entity BlogRelated @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Author' }
        ])
        as projection on my.BlogRelated;
    entity BlogScopes @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Author' }
        ])
        as projection on my.BlogScopes;
    entity ScopeItems @(restrict: [
            { grant: ['READ'], to: 'renee-Author' }
        ]) 
        as projection on my.ScopeItems;

// Define the Blog entity with User relationship
    entity Blogs @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Author' }
        ])
        as select from my.Blogs {
        ID, s_id, title, text, status, classification, internal, 
        personas, versions, related, source, source_type, project,
        categories, author, createdBy, scopeItems  
        } where createdBy = $user         
};


