namespace my.renee;

using { cuid, Country , managed, sap } from '@sap/cds/common';

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
    parent : Composition of many Categories;
    blogs  : Association to many BlogCategories;
    experts : Association to many UserExpertise;
    }
 

  entity BlogCategories : cuid {
    // key ID : Integer;
    blog : Association to many Blogs;
    category : Composition of many Categories;
  }
  
  entity BlogVersions : cuid {
    // key ID : Integer;
    blog : Association to Blogs;
    version : Composition of many ProductVersions;
  }
    
  entity BlogRelated : cuid {
    // key ID : Integer;
    blog : Association to Blogs;
    related : Association to Blogs;
  }  

entity BlogPersonas : cuid {
    // key ID : Integer;
    blog    : Association to Blogs;
    persona : Composition of many Personas;
    }

@cds.odata.valuelist
 entity Classifications  : sap.common.CodeList {
     key code : Integer;
    //  descr   : String;
     blogs  : Association to many Blogs;
    }

@cds.odata.valuelist
entity Personas   : sap.common.CodeList {
    key code : Integer;
    // descr : String;
    blogs : Association to many BlogPersonas;
    }    
@cds.odata.valuelist
entity WorkFlowStatus : sap.common.CodeList {
    key code : Integer;
    // descr  : String;
    authorstatus : String;
    curatorstatus : String;
    blogs  : Association to many Blogs;
    }

@cds.odata.valuelist
entity ProductVersions : sap.common.CodeList {
    key code : Integer;
    // descr : String(4);
    blogs  : Association to many BlogVersions;
    }
@cds.odata.valuelist
entity MetaConfigurations : sap.common.CodeList {
    key code : Integer;
    // descr: String;
    // name: String;
    config : Association to many Configurations;
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
  my_blogs  : Association to many Blogs;
  curated_blogs : Association to many BlogCurators on curated_blogs.curator = $self;
  expertises : Composition of many UserExpertise;
}
@cds.odata.valuelist
entity UserExpertise {
  key ID : Integer;
  user : Association to Users;
  expertise : Association to Categories;
}

@cds.odata.valuelist
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