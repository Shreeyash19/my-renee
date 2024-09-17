using my.renee as my from '../db/data/data-model';

@path: '/curateService'
@(requires: 'authenticated-user')
service CurateService {
    //entity lessons as projection on my.lessons; 
    entity WorkFlowStatus @(restrict: [ 
        { grant: ['READ'], to: 'renee-Curator' }
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
        { grant: ['READ'], to: 'renee-Curator' }
        ])
        as projection on my.ProductVersions;
    entity LessonCategories @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as projection on my.LessonCategories;
    entity LessonVersions @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as projection on my.LessonVersions;
    entity LessonRelated @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as projection on my.LessonRelated;
    entity LessonPersonas @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as projection on my.LessonPersonas;
    entity SourceTypes @(restrict: [ 
        { grant: ['READ'], to: 'renee-Curator' }
        ])
        as projection on my.SourceTypes;
    entity LessonScopes @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Curator' }
        ])
        as projection on my.LessonScopes;
    entity ScopeItems @(restrict: [
            { grant: ['READ'], to: 'renee-Curator' }
        ]) 
        as projection on my.ScopeItems;    

    // Define the lesson entity with Categories and Users relationships
    entity CuratorLessons @(restrict: [ 
        { grant: ['READ', 'WRITE'], to: 'renee-Curator' }
        ])
        as select from my.Lessons {
        ID, s_id, title, text, status, classification, internal, 
        personas, versions, related, source, source_type, project,
        scopeItems, categories  
        } where exists (
            select from my.Categories as c
            where c.ID in (
            select category.ID from my.UserCategories as u
            where u.user.ID = $user 
            )
        );
};