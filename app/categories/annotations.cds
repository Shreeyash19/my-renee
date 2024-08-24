using AdminService as service from '../../srv/admin_service';
using from '../../db/data/data-model';

annotate service.Categories with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Code',
                Value : code,
                ![@UI.Hidden],
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Value : texts.code,
                Label : 'Parent',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Code',
            Value : code,
        },
        {
            $Type : 'UI.DataField',
            Value : descr,
        },
    ],
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
    UI.ConnectedFields #connected : {
        $Type : 'UI.ConnectedFieldsType',
        Template : '{code} {descr}',
        Data : {
            $Type : 'Core.Dictionary',
            code : {
                $Type : 'UI.DataField',
                Value : code,
            },
            descr : {
                $Type : 'UI.DataField',
                Value : descr,
            },
        },
    },
    UI.PresentationVariant #vh_Categories_texts_code : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : code,
                Descending : false,
            },
        ],
    },
);

annotate service.Categories with {
    blogs @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'BlogCategories',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : blogs_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'category_code',
            },
        ],
    }
};

annotate service.Categories with {
    experts @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'UserExpertise',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : experts_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'expertise_code',
            },
        ],
    }
};

annotate service.Categories with {
    parent @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Categories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : parent_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'parent_code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'parent/descr',
                },
            ],
            PresentationVariantQualifier : 'vh_Categories_parent',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : 'name',
    )
};

annotate service.Categories with@odata.draft.enabled;
annotate service.Categories.texts with {
    code @(
        Common.Text : {
            $value : descr,
            ![@UI.TextArrangement] : #TextLast
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Categories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'parent/descr',
                },
            ],
            Label : 'Parent',
            PresentationVariantQualifier : 'vh_Categories_texts_code',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Categories with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextLast,
    }
};

