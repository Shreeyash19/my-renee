namespace my.renee;

using { cuid, managed } from '@sap/cds/common';
using { sap.common.CodeList } from '@sap/cds/common';

entity Categories : cuid {
    parent : Association to Categories
      @Common.Text : 'parent_text'; // Text association for the value list
    descr : String;
    blogs  : Association to BlogCategories;
    experts : Association to UserCategories;
}
 
@cds.odata.valuelist
entity BlogVersions {
  key version : Association to ProductVersions;
  key blog : Association to Blogs;
}
  
@cds.odata.valuelist
entity BlogRelated {
  key related : Association to Blogs;
  key blog : Association to Blogs;
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

entity BlogScopes {
  key scope : Association to ScopeItems;
  key blog : Association to Blogs;
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
  my_blogs  : Association to Blogs on my_blogs.author = $self;
  curated_blogs : Association to many BlogCurators on curated_blogs.curator = $self;
  expertise : Composition of many UserCategories on expertise.user = $self;
}

entity BlogCategories {
  key category_ID : UUID;
  key blog_ID : UUID;
  // Associations
  blog : Association to Blogs on blog_ID = blog.ID;
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