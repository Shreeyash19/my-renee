using my.renee as my from '../db/data/data-model';


service AdminService @(requires: 'authenticated-user')
{
    // Configurations for lesson authoring and curation 
    entity Categories @(restrict: [ 
        { grant: ['READ','WRITE'], to: 'renee-Administrator' },
        { grant: ['READ'], to: 'renee-Curator' },
        { grant: ['READ'], to: 'renee-Author' }
        ])
        as projection on my.Categories;
    entity Classifications @(restrict: [ 
        { grant: ['READ','WRITE'], to: 'renee-Administrator' },
        { grant: ['READ'], to: 'renee-Curator' },
        { grant: ['READ'], to: 'renee-Author' }
        ])
        as projection on my.Classifications;
    // PowerPoint Deck creation related configuration
    entity Configurations @(restrict: [ 
        { grant: ['READ','WRITE'], to: 'renee-Administrator' }
        ])
        as projection on my.Configurations;
    entity WorkFlowStatus @(restrict: [ 
        { grant: ['READ','WRITE'], to: 'renee-Administrator' },
        { grant: ['READ'], to: 'renee-Curator' },
        { grant: ['READ'], to: 'renee-Author' }
          ])
        as projection on my.WorkFlowStatus;
    entity ProductVersions @(restrict: [ 
        { grant: ['READ','WRITE'], to: 'renee-Administrator' },
        { grant: ['READ'], to: 'renee-Curator' },
        { grant: ['READ'], to: 'renee-Author' }
        ])
        as projection on my.ProductVersions;

    entity Personas @(restrict: [ 
        { grant: ['READ','WRITE'], to: 'renee-Administrator' },
        { grant: ['READ'], to: 'renee-Curator' },
        { grant: ['READ'], to: 'renee-Author' }
        ])
        as projection on my.Personas;
    entity SourceTypes @(restrict: [ 
        { grant: ['READ','WRITE'], to: 'renee-Administrator' },
        { grant: ['READ'], to: 'renee-Curator' },
        { grant: ['READ'], to: 'renee-Author' }
        ])
        as projection on my.SourceTypes;
    
    // User related configurations
    entity Teams @(restrict: [ 
        { grant: ['READ','WRITE'], to: 'renee-Administrator' },
        { grant: ['READ'], to: 'renee-Curator' },
        { grant: ['READ'], to: 'renee-Author' }
        ])
    as projection on my.Teams;
    

};
