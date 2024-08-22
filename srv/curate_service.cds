using my.renee as my from '../db/data/data-model';

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