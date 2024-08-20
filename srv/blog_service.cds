using my.renee as my from '../db/data/data-model';

service BlogService {
entity Blogs as projection on my.Blogs;
entity Users as projection on my.Users;
entity WorkFlowStatus as projection on my.WorkFlowStatus;
entity Categories as projection on my.Categories;
entity Classifications as projection on my.Classifications;
entity ProductVersions as projection on my.ProductVersions;
entity UserRole as projection on my.UserRole;
entity UserExpertise as projection on my.UserExpertise;
entity BlogCategories as projection on my.BlogCategories;
entity BlogCurators as projection on my.BlogCurators;
entity BlogVersions as projection on my.BlogVersions;
entity BlogRelated as projection on my.BlogRelated;
};


service CurateService {
    entity Blogs as projection on my.Blogs;
    entity WorkFlowStatus as projection on my.WorkFlowStatus;
    entity Categories as projection on my.Categories;
    entity Classifications as projection on my.Classifications;
    entity ProductVersions as projection on my.ProductVersions;
    entity BlogCategories as projection on my.BlogCategories;
    entity BlogVersions as projection on my.BlogVersions;
    entity BlogRelated as projection on my.BlogRelated;
    entity BlogPersonas as projection on my.BlogPersonas;
};
annotate CurateService.Blogs with @odata.draft.enabled: null;

service UserService {
entity Users as projection on my.Users;
entity Categories as projection on my.Categories;
entity UserRole as projection on my.UserRole;
entity UserExpertise as projection on my.UserExpertise;
};

service AdminService 
{
    entity Categories as projection on my.Categories;
    entity WorkFlowStatus as projection on my.WorkFlowStatus;
    entity ProductVersions as projection on my.ProductVersions;
    entity Classifications as projection on my.Classifications;
    entity Personas as projection on my.Personas;
    entity Configurations as projection on my.Configurations;
};
