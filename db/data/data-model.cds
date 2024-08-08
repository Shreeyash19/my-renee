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
  }

  entity BlogCurators {
    key ID : Integer;
    blog : Association to Blogs on blog.curators = $self;
    curator : Association to Users;
  }  

  entity BlogCategories {
    key ID : Integer;
    blog : Association to Blogs;
    category : Association to Categories;
  }
  
  entity BlogVersions {
    key ID : Integer;
    blog : Association to Blogs;
    version : Association to ProductVersions;
  }
    
  entity BlogRelated {
    key ID : Integer;
    blog : Association to Blogs;
    related : Association to Blogs;
  }  

  entity Users : cuid, managed {
    f_name   : String;
    l_name   : String;
    email   : String;
    internal : String;
    role : Association to UserRole;
    my_blogs  : Association to many Blogs;
    curated_blogs : Association to many BlogCurators on curated_blogs.curator = $self;
    expertises : Association to many UserExpertise;
  }

entity UserExpertise {
  key ID : Integer;
  user : Association to Users;
  expertise : Association to Categories;
}  
@cds.odata.valuelist
entity Categories {
    key code : Integer;
    descr : String;
    parent : Association to Categories;
    blogs  : Association to many BlogCategories;
    experts : Association to many UserExpertise;
    }

@cds.odata.valuelist
 entity Classifications  : sap.common.CodeList {
     key code : Integer;
    //  descr   : String;
     blogs  : Association to many Blogs;
    }

@cds.odata.valuelist
entity Personas {
    key code : String(3);
    descr : String;
    blogs : Association to many BlogPersonas;
    }    
@cds.odata.valuelist
entity WorkFlowStatus : sap.common.CodeList {
    key code : Integer;
    // descr  : String;
    blogs  : Association to many Blogs;
    }
@cds.odata.valuelist
entity ProductVersions {
    key code : Integer;
    label : String(100);
    blogs  : Association to many BlogVersions;
    }

entity BlogPersonas {
    key ID : Integer;
    persona : Association to Personas;
    blog    : Association to Blogs;
    }

@cds.odata.valuelist
entity UserRole {
    key code : Integer;
    label   : String;
    users  : Association to many Users on users.role = $self;
    }