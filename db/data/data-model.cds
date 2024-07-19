namespace my.renee;

using { Country , managed } from '@sap/cds/common';


  entity Blogs {
    key ID : Integer;
    s_id : String;
    classification : Association to Classifications;
    title  : String;
    text  : String;
    author : Association to Users;
    status : Association to WorkFlowStatus;
  }

  entity BlogCurators {
    key ID : Integer;
    blog : Association to Blogs;
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

  entity Users {
    key ID : Integer;
    f_name   : String;
    l_name   : String;
    email   : String;
    internal : String;
    role : Association to UserRole;
    my_blogs  : Association to many Blogs on my_blogs.author = $self;
    curated_blogs : Association to many BlogCurators on curated_blogs.curator = $self;
    expertises : Association to many UserExpertise;
  }

entity UserExpertise {
  key ID : Integer;
  user : Association to Users;
  expertise : Association to Categories;
}  

entity Categories {
    key ID : Integer;
    parent : Association to Categories;
    description   : String;
    blogs  : Association to many BlogCategories;
    experts : Association to many UserExpertise;
    }

entity Classifications {
    key ID : Integer;
    description   : String;
    blogs  : Association to many Blogs;
    }

entity WorkFlowStatus {
    key ID : Integer;
    description   : String;
    blogs  : Association to many Blogs;
    }

entity ProductVersions {
    key ID : Integer;
    version   : Integer;
    blogs  : Association to many BlogVersions;
    }

entity UserRole {
    key ID : Integer;
    role   : String;
    users  : Association to many Users on users.role = $self;
    }