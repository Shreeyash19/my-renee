using my.renee as my from '../db/data/data-model';

@path: '/adminService'
@(requires_: 'authenticated-user')
service AdminService {
    // Configurations for lesson authoring and curation
    entity Categories      as projection on my.Categories;
    entity Classifications as projection on my.Classifications;
    // PowerPoint Deck creation related configuration
    entity Configurations  as projection on my.Configurations;
    entity WorkFlowStatus  as projection on my.WorkFlowStatus;
    entity ProductVersions as projection on my.ProductVersions;
    entity Personas        as projection on my.Personas;
    entity SourceTypes     as projection on my.SourceTypes;
    entity ScopeItems      as projection on my.ScopeItems;
    // User related configurations
    entity Teams           as projection on my.Teams;


};
