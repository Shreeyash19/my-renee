using UserService as service from '../../srv/blog_service';
annotate service.Users with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Given Name',
                Value : f_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Family Name',
                Value : l_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SAP Employee',
                Value : internal,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Role',
                Value : role_code,
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
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Areas of Expertise',
            ID : 'AreasofExpertise',
            Target : 'expertises/@UI.LineItem#AreasofExpertise',
        },
    ]
);

annotate service.UserExpertise with @(
    UI.LineItem #AreasofExpertise : [
        
    ],
    UI.SelectionPresentationVariant #AreasofExpertise : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#AreasofExpertise',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : expertise_code,
            Label : 'Expertise Category',
            ![@UI.Importance] : #High,
        },
    ],
);

annotate service.Users with {
    role @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'UserRole',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : role_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'User Role',
        },
        Common.ValueListWithFixedValues : true,
        Common.FieldControl : #ReadOnly,
)};

annotate service.UserRole with {
    code @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Users with {
    f_name @Common.FieldControl : #ReadOnly
};

annotate service.Users with {
    l_name @Common.FieldControl : #ReadOnly
};

annotate service.Users with {
    email @Common.FieldControl : #ReadOnly
};

annotate service.Users with {
    internal @Common.FieldControl : #ReadOnly
};

annotate service.UserExpertise with {
    expertise @(
        Common.Text : {
            $value : expertise.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Categories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : expertise_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterIn',
                    ValueListProperty : 'parent_code',
                    LocalDataProperty : expertise.parent_code,
                },
            ],
            Label : 'Expertise Categories',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Categories with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

