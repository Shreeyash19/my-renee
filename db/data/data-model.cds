namespace my.renee;

using { cuid, Country , managed, sap, User } from '@sap/cds/common';

  entity Blogs : cuid, managed {
    s_id : String(10);
    classification : Association to Classifications;
    title  : String;
    text   : LargeString;
    author : Association to Users;
    curators : Association to BlogCurators;
    status : Association to WorkFlowStatus;
    categories : Composition of many BlogCategories on categories.blog = $self;
    versions   : Composition of many BlogVersions on versions.blog = $self;
    personas   : Composition of many BlogPersonas on personas.blog = $self;
    related    : Composition of many BlogRelated on related.blog = $self;
    internal : Boolean;
  }

entity Categories {
    key code : Integer;
    descr : String;
    parent : Association to Categories;
    blogs  : Association to BlogCategories;
    experts : Association to UserExpertise;
    }
 

  entity BlogCategories {
    key blog : Association to Blogs;
    key ID : Integer;
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

entity BlogPersonas : cuid {
    key blog    : Association to Blogs;
    persona : Association to Personas;
    }

@cds.odata.valuelist
 entity Classifications  : sap.common.CodeList {
     key code : Integer;
     blogs  : Association to Blogs;
    }

entity Personas   : sap.common.CodeList {
    key code : Integer;
    blogs : Association to BlogPersonas;
    }    
@cds.odata.valuelist
entity WorkFlowStatus : sap.common.CodeList {
    key code : Integer;
    authorstatus : String;
    curatorstatus : String;
    blogs  : Association to Blogs;
    }

@cds.odata.valuelist
entity ProductVersions : sap.common.CodeList {
    key code : Integer;
    blogs  : Association to BlogVersions;
    }
@cds.odata.valuelist
entity MetaConfigurations : sap.common.CodeList {
    key code : Integer;
    config : Association to Configurations;
}

entity Configurations : cuid {
  config : Association to MetaConfigurations;
  name : String;
}

/// Users 

entity Users : cuid, managed {
  f_name   : String;
  l_name   : String;
  email   : String;
  internal : String;
  role : Association to UserRole;
  my_blogs  : Association to Blogs on my_blogs.author = $self;
  curated_blogs : Association to many BlogCurators on curated_blogs.curator = $self;
  expertises : Composition of many UserExpertise on expertises.user = $self;
}

entity UserExpertise {
  key user : Association to Users;
  key ID : Integer;
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