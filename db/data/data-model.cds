namespace my.renee;

using { cuid, managed } from '@sap/cds/common';
using { sap.common.CodeList } from '@sap/cds/common';

entity Categories : cuid {
    parent : Association to Categories
      @Common.Text : 'parent_text'; // Text association for the value list
    descr : String;
    lessons  : Association to LessonCategories;
    experts : Association to UserCategories;
}
 
@cds.odata.valuelist
entity LessonVersions {
  key version : Association to ProductVersions;
  key lesson : Association to Lessons;
}
  
@cds.odata.valuelist
entity LessonRelated {
  key related : Association to Lessons;
  key lesson : Association to Lessons;
}

@cds.odata.valuelist
entity LessonPersonas : cuid {
  key lesson : Association to Lessons;
  persona : Association to Personas;
}

entity Classifications : CodeList {
  key code : Integer;
  lessons : Association to Lessons;
}

entity Personas : CodeList {
  key code : Integer; 
  lessons : Association to LessonPersonas;
}

entity WorkFlowStatus : CodeList {
  key code : Integer;
  authorstatus : String;
  curatorstatus : String;
  lessons : Association to Lessons;
}

entity ProductVersions : CodeList {
  key code : Integer;
  lessons : Association to LessonVersions;
}

entity ScopeItems : CodeList {
  key code : Integer;
  lessons : Association to LessonScopes;
}

entity LessonScopes {
  key scope : Association to ScopeItems;
  key lesson : Association to Lessons;
}

entity MetaConfigurations : CodeList {
  key code : Integer;
  config : Association to Configurations;
}

entity Configurations : cuid {
  config : Association to MetaConfigurations;
  name : String;
}

entity SourceTypes : CodeList {
  key code : Integer;  
}

/// Users
entity Teams : CodeList {
  key code : Integer;
  user : Association to Users; 
} 

entity Users : managed {
  key ID : String;     
  key email   : String;
  f_name   : String;
  l_name   : String;
  internal : String;
  role : Association to UserRole;
  team : Association to Teams;
  my_lessons  : Association to Lessons on my_lessons.author = $self;
  curated_lessons : Association to many LessonCurators on curated_lessons.curator = $self;
  expertise : Composition of many UserCategories on expertise.user = $self;
}

entity LessonCategories {
  key category_ID : UUID;
  key lesson_ID : UUID;
  // Associations
  lesson : Association to Lessons on lesson_ID = lesson.ID;
  category : Association to Categories on category_ID = category.ID;
}

entity UserCategories {
  key category_ID : UUID;
  key user_ID : String;
  // Associations
  user : Association to Users on user_ID = user.ID;
  category : Association to Categories on category_ID = category.ID;
}

entity UserRole {
    key code : Integer;
    label   : String;
    users  : Association to many Users on users.role = $self;
}

entity LessonCurators {
  key ID : Integer;
  lesson : Association to Lessons;
  curator : Association to Users;
}

// Lesson / lesson related entities
entity Lessons : cuid, managed {
  s_id : String(10);
  classification : Association to Classifications default '000';
  title  : String;
  text   : LargeString;
  internal : Boolean default true;
  project : LargeString;
  source_type : Association to SourceTypes default 8;
  source : LargeString;
  author : Association to Users;
  curators : Association to LessonCurators;
  status : Association to WorkFlowStatus default '000';
  categories : Composition of many LessonCategories on categories.lesson = $self;
  versions   : Composition of many LessonVersions on versions.lesson = $self;
  personas   : Composition of many LessonPersonas on personas.lesson = $self;
  related    : Composition of many LessonRelated on related.lesson = $self;
  scopeItems : Composition of many LessonScopes on scopeItems.lesson = $self;
}