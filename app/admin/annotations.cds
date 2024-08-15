using AdminService as service from '../../srv/blog_service';
annotate service.Categories with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : parent_code,
            Label : 'Parent category ID',
        },
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
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Maintain Categories',
            ID : 'MaintainCategories',
            Target : '@UI.FieldGroup#MaintainCategories',
        },
    ],
    UI.FieldGroup #MaintainCategories : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : parent_code,
                Label : 'Parent category ID',
            },
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
        ],
    },
);

annotate service.Categories with {
    parent @Common.Text : parent.descr
};

annotate service.Categories with {
    code @Common.Text : descr
};

