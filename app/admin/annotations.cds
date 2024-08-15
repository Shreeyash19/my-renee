using AdminService as service from '../../srv/blog_service';
annotate service.Categories with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : code,
            Label : 'Category ID',
        },
        {
            $Type : 'UI.DataField',
            Value : descr,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : parent_code,
            Label : 'Parent category ID',
        },
    ]
);

annotate service.Categories with {
    parent @Common.Text : parent.descr
};

annotate service.Categories with {
    code @Common.Text : descr
};

