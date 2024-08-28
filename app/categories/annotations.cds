using AdminService as service from '../../srv/admin_service';
annotate service.Categories with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Category',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Value : parent_ID,
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
            Label : 'Categories',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Value : parent_ID,
            Label : 'Parent',
        },
    ],
);

annotate service.Categories with {
    parent @(
        Common.Text : {
            $value : parent.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Categories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : parent_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'parent/descr',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        )
};

annotate service.Categories with {
    ID @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Categories with @odata.draft.enabled;