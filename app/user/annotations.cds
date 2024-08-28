using UserService as service from '../../srv/user_service';
annotate service.User with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : expertise.category_ID,
                Label : 'Category',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Identification',
            ID : 'Identification',
            Target : '@UI.Identification',
        },
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
            Label : 'Email',
            Value : email,
        },
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
            Label : 'User Role',
            Value : role_code,
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Label : 'Team',
            Value : team_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'User Role',
            Value : role_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Family Name',
            Value : l_name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Given Name',
            Value : f_name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : email,
        },
    ],
);

annotate service.User with {
    role @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'UserRole',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : role_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'label',
                },
            ],
        },
        Common.Text : {
            $value : role.label,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
        Common.FieldControl : #ReadOnly,
    )
};

annotate service.UserRole with {
    code @Common.Text : {
        $value : label,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.User with {
    team @(
        Common.Text : {
            $value : team.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Teams with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.User with @odata.draft.enabled;
annotate service.User with @(
    Capabilities.InsertRestrictions : {
		    Insertable : false,
  },
    Capabilities.UpdateRestrictions : {
		    Updatable : true,
    },
    Capabilities.DeleteRestrictions : {
		    Deletable : false,
    }        
);
annotate service.UserCategories with @(
    UI.LineItem #ExpertiseCategories : [
        {
            $Type : 'UI.DataField',
            Value : category_ID,
            Label : 'Categories',
        },
        {
            $Type : 'UI.DataField',
            Value : category.parent_ID,
            Label : 'Parent',
        },
    ]
);

annotate service.Categories with {
    ID @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.UserCategories with {
    category_ID @(
        Common.Text : {
            $value : category.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Categories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : category_ID,
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
    parent @(
        Common.Text : 'parent_text',
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

