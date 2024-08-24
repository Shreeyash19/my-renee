namespace my.renee;

using { cuid, managed } from '@sap/cds/common';
using { sap.common.CodeList } from '@sap/cds/common';

entity Categories : CodeList {
    key code : Integer;
    parent : Association to Categories
      @Common.Text : 'desc'; // Text association for the value list
    blogs  : Association to BlogCategories;
    experts : Association to UserExpertise;
}
 
entity BlogCategories : cuid {
  key blog : Association to Blogs;
  category : Association to Categories;
}

entity BlogVersions : cuid {
  key blog : Association to Blogs;
  version : Association to ProductVersions;
}
  
entity BlogRelated : cuid {
  key blog : Association to Blogs;
  related : Association to Blogs;
}

@cds.odata.valuelist
entity BlogPersonas : cuid {
  key blog : Association to Blogs;
  persona : Association to Personas;
}

entity Classifications : CodeList {
  key code : Integer;
  blogs : Association to Blogs;
}

entity Personas : CodeList {
  key code : Integer; 
  blogs : Association to BlogPersonas;
}

entity WorkFlowStatus : CodeList {
  key code : Integer;
  authorstatus : String;
  curatorstatus : String;
  blogs : Association to Blogs;
}

entity ProductVersions : CodeList {
  key code : Integer;
  blogs : Association to BlogVersions;
}

entity ScopeItems : CodeList {
  key code : Integer;
  blogs : Association to BlogScopes;
}

entity BlogScopes : cuid {
  key blog : Association to Blogs;
  name : String;
  descr : String;
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

entity Users : cuid, managed {
  f_name   : String;
  l_name   : String;
  email   : String;
  internal : String;
  role : Association to UserRole;
  team : Association to Teams;
  my_blogs  : Association to Blogs on my_blogs.author = $self;
  curated_blogs : Association to many BlogCurators on curated_blogs.curator = $self;
  expertise : Composition of many UserExpertise on expertise.user = $self;
}

entity UserExpertise : cuid {
  key user : Association to Users;
  expertise : Association to Categories;
}

entity UserRole {
    key code : Integer;
    label   : String;
    users  : Association to many Users on users.role = $self;
}

entity BlogCurators {
  key ID : Integer;
  blog : Association to Blogs;
  curator : Association to Users;
}

// Lesson / Blog related entities
entity Blogs : cuid, managed {
  s_id : String(10);
  classification : Association to Classifications default '000';
  title  : String;
  text   : LargeString;
  internal : Boolean default true;
  project : LargeString;
  source_type : Association to SourceTypes default 8;
  source : LargeString;
  author : Association to Users;
  curators : Association to BlogCurators;
  status : Association to WorkFlowStatus default '000';
  categories : Composition of many BlogCategories on categories.blog = $self;
  versions   : Composition of many BlogVersions on versions.blog = $self;
  personas   : Composition of many BlogPersonas on personas.blog = $self;
  related    : Composition of many BlogRelated on related.blog = $self;
  scopeItems : Composition of many BlogScopes on scopeItems.blog = $self;
}