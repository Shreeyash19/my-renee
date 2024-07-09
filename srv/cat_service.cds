using my.renee as my from '../db/data/data-model';

service BlogService {
entity Blogs @readonly as projection on my.Blogs;
entity Users @readonly as projection on my.Users;
entity WorkFlowStatus @readonly as projection on my.WorkFlowStatus;
entity Categories @readonly as projection on my.Categories;
entity Classifications @readonly as projection on my.Classifications;
entity ProductVersions @readonly as projection on my.ProductVersions;
entity UserRole @readonly as projection on my.UserRole;
}
