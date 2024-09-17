using my.renee as my from '../db/data/data-model';

@path: '/lessonService'
@(requires: 'authenticated-user')
service LessonService {

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
    entity LessonCategories @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Author' }
        ])
        as projection on my.LessonCategories;
    entity LessonCurators @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Author' }
        ])
        as projection on my.LessonCurators;
    entity LessonVersions @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Author' }
        ])
        as projection on my.LessonVersions;
    entity LessonRelated @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Author' }
        ])
        as projection on my.LessonRelated;
    entity LessonScopes @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Author' }
        ])
        as projection on my.LessonScopes;
    entity ScopeItems @(restrict: [
            { grant: ['READ'], to: 'renee-Author' }
        ]) 
        as projection on my.ScopeItems;

// Define the lesson entity with User relationship
    entity Lessons @(restrict: [
            { grant: ['READ', 'WRITE', 'DELETE'], to: 'renee-Author' }
        ])
        as select from my.Lessons {
        ID, s_id, title, text, status, classification, internal, 
        personas, versions, related, source, source_type, project,
        categories, author, createdBy, scopeItems  
        } where createdBy = $user         
};


