namespace my.renee;

using { cuid, Country , managed, sap } from '@sap/cds/common';

/// Users 

  entity Users : cuid, managed {
    f_name   : String;
    l_name   : String;
    email   : String;
    internal : String;
    role : Association to UserRole;
    my_blogs  : Composition of many Blogs;
    curated_blogs : Composition of many BlogCurators on curated_blogs.curator = $self;
    expertises : Composition of many UserExpertise on expertises.user = $self;
  }
@cds.odata.valuelist
entity UserExpertise : cuid {
  user : Association to Users;
  expertise : Association to Categories;
}

@cds.odata.valuelist
entity UserRole : sap.common.CodeList {
    key code : Integer;
    // label   : String;
    users  : Association to many Users on users.role = $self;
    }


entity BlogCurators {
  key ID : Integer;
  blog : Association to Blogs;
  curator : Association to Users;
}   

/// Blogs

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
  related    : Composition of many BlogRelated;
  }

@cds.odata.valuelist
entity Categories {
    key code : Integer;
    descr : String;
    parent : Association to Categories;
    blogs  : Association to many BlogCategories;
    experts : Association to many UserExpertise;
    }
 

entity BlogCategories : cuid {
  // key ID : Integer;
  blog : Association to Blogs;
  category : Association to Categories;
}

entity BlogVersions : cuid {
  // key ID : Integer;
  blog : Association to Blogs;
  version : Association to ProductVersions;
}
  
entity BlogRelated : cuid {
  // key ID : Integer;
  blog : Association to Blogs;
  related : Association to Blogs;
}  

entity BlogPersonas : cuid {
    // key ID : Integer;
    persona : Association to Personas;
    blog    : Association to Blogs;
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


  