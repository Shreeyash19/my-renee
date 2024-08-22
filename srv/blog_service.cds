using my.renee as my from '../db/data/data-model';

service BlogService {
entity Blogs as projection on my.Blogs;
entity Users as projection on my.Users;
entity WorkFlowStatus as projection on my.WorkFlowStatus;
entity Categories as projection on my.Categories;
entity ProductVersions as projection on my.ProductVersions;
entity UserRole as projection on my.UserRole;
entity UserExpertise as projection on my.UserExpertise;
entity BlogCategories as projection on my.BlogCategories;
entity BlogCurators as projection on my.BlogCurators;
entity BlogVersions as projection on my.BlogVersions;
entity BlogRelated as projection on my.BlogRelated;
};


