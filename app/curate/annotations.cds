using BlogService as service from '../../srv/blog_service';
annotate service.Blogs with {
    curators @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'BlogCurators',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : curators_ID,
                ValueListProperty : 'ID',
            },
        ],
    }
};

