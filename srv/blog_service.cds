using my.renee as my from '../db/data/data-model';

service BlogService {
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

service CurateService {
    @Capabilities : {     
        InsertRestrictions.Insertable: false,
        UpdateRestrictions.Updatable: true,
        DeleteRestrictions.Deletable: false }
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

service UserService {
entity Users as projection on my.Users;
entity Categories as projection on my.Categories;
entity UserRole as projection on my.UserRole;
entity UserExpertise as projection on my.UserExpertise;
};

service AdminService {
        @Capabilities : {     
        InsertRestrictions.Insertable: true,
        UpdateRestrictions.Updatable: true,
        DeleteRestrictions.Deletable: false }
    entity Categories as projection on my.Categories;
    entity WorkFlowStatus as projection on my.WorkFlowStatus;
    entity ProductVersions as projection on my.ProductVersions;
    entity Classifications as projection on my.Classifications;
}