using my.renee as my from '../db/data/data-model';

@path: '/lessonService'
@(requires: 'authenticated-user')
service LessonService {

    entity Users 
        as projection on my.Users;
    entity WorkFlowStatus 
        as projection on my.WorkFlowStatus;
    entity Categories as projection on my.Categories;
    entity ProductVersions 
        as projection on my.ProductVersions;
    entity LessonCategories 
        as projection on my.LessonCategories;
    entity LessonCurators
        as projection on my.LessonCurators;
    entity LessonVersions 
        as projection on my.LessonVersions;
    entity LessonRelated
        as projection on my.LessonRelated;
    entity LessonScopes 
        as projection on my.LessonScopes;
    entity ScopeItems 
        as projection on my.ScopeItems;

// Define the lesson entity with User relationship
    entity Lessons 
        as select from my.Lessons {
        ID, s_id, title, text, status, classification, internal, 
        personas, versions, related, source, source_type, project,
        categories, author, createdBy, scopeItems  
        } where createdBy = $user         
};


