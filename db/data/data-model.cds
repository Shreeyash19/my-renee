namespace my.renee;

using { Country , managed } from '@sap/cds/common';


  entity Blogs {
    key ID : Integer;
    s_id : String;
    title  : String;
    text  : String;
    author : Association to Users;
    status : Association to  WorkFlowStatus ;
    category : Association to Categories;
    classification : Association to Classifications ;
    version : Association to ProductVersions;
    related : Association to Blogs;
  }

  entity Users {
    key ID : Integer;
    f_name   : String;
    l_name   : String;
    email   : String;
    internal : String;
    role : Association to UserRole;
    blogs  : Association to many Blogs on blogs.author = $self;
  }

entity Categories {
    key ID : Integer;
    parent : Association to Categories;
    description   : String;
    blogs  : Association to many Blogs on blogs.category = $self;
    }

entity Classifications {
    key ID : Integer;
    description   : String;
    blogs  : Association to many Blogs on blogs.classification = $self;
    }

entity WorkFlowStatus {
    key ID : Integer;
    description   : String;
    blogs  : Association to many Blogs on blogs.status = $self;
    }

entity ProductVersions {
    key ID : Integer;
    version   : Integer;
    blogs  : Association to many Blogs on blogs.version = $self;
    }

entity UserRole {
    key ID : Integer;
    role   : String;
    users  : Association to many Users on users.role = $self;
    }