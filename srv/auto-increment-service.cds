using my.renee as my from '../db/data/data-model';

service MyAutoIncrementService {
    entity MyBlogs as projection on my.Blogs;
}