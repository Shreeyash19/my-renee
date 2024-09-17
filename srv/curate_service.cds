using my.renee as my from '../db/data/data-model';

@path: '/curateService'
@(requires_: 'authenticated-user')
service CurateService {
    //entity lessons as projection on my.lessons; 
    entity WorkFlowStatus 
        as projection on my.WorkFlowStatus;
    entity Categories
        as projection on my.Categories;
    entity Classifications 
        as projection on my.Classifications;
    entity ProductVersions
        as projection on my.ProductVersions;
    entity LessonCategories
        as projection on my.LessonCategories;
    entity LessonVersions 
        as projection on my.LessonVersions;
    entity LessonRelated 
        as projection on my.LessonRelated;
    entity LessonPersonas 
        as projection on my.LessonPersonas;
    entity SourceTypes 
        as projection on my.SourceTypes;
    entity LessonScopes 
        as projection on my.LessonScopes;
    entity ScopeItems 
        as projection on my.ScopeItems;    

    // Define the lesson entity with Categories and Users relationships
    entity CuratorLessons 
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