using my.renee as my from '../db/data/data-model';

service UserService {
entity Users as projection on my.Users;
entity Categories as projection on my.Categories;
entity UserRole as projection on my.UserRole;
entity UserExpertise as projection on my.UserExpertise;
entity MyBlogs as projection on my.Blogs; 
};