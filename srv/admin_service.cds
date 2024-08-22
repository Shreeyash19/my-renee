using my.renee as my from '../db/data/data-model';

service AdminService 
{
    entity Categories as projection on my.Categories;
    entity WorkFlowStatus as projection on my.WorkFlowStatus;
    entity ProductVersions as projection on my.ProductVersions;
    entity Classifications as projection on my.Classifications;
    entity Personas as projection on my.Personas;
    entity Configurations as projection on my.Configurations;
};
