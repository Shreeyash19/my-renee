using AdminService as service from '../../srv/blog_service';
annotate service.Categories with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : parent_code,
            Label : 'Parent Category',
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
                Label : 'Parent Category ID',
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
    UI.PresentationVariant #vh_Categories_parent : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : parent_code,
                Descending : false,
            },
        ],
    },
);


annotate service.Categories with {
    parent @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Categories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : parent_code,
                    ValueListProperty : 'parent_code',
                },
            ],
            Label : 'Parent Category',
            PresentationVariantQualifier : 'vh_Categories_parent',
        },
        Common.ValueListWithFixedValues : false,
    )
};

