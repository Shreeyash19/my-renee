using UserService as service from '../../srv/user_service';
using from '../../db/data/data-model';

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
                Label : 'Email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Role',
                Value : role_code,
            },
            {
                $Type : 'UI.DataField',
                Value : team.code,
                Label : 'Team',
            },
            {
                $Type : 'UI.DataField',
                Label : 'SAP Employee',
                Value : internal,
            },
            {
                $Type : 'UI.DataField',
                Value : expertise.expertise_code,
                Label : 'Expertise',
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
            Label : 'Email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Role',
            Value : role_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'SAP Employee',
            Value : internal,
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : f_name,
        },
        TypeName : '',
        TypeNamePlural : '',
    },
);

annotate service.Users with {
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

annotate service.UserExpertise with {
    expertise @(
        Common.Text : {
            $value : expertise.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
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
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'parent/descr',
                },
            ],
        },
    )
};

annotate service.Categories with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Teams with {
    code @(
        Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly
    },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Teams',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Users with @odata.draft.enabled;
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

annotate service.Categories with @(
    UI.PresentationVariant #vh_UserExpertise_expertise : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : code,
                Descending : false,
            },
        ],
    }
);

