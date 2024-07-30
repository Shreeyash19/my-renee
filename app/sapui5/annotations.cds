
using BlogService as service from '../../srv/blog_service';

annotate service.Blogs with @(
    // Worklist Item Detail
    odata.draft.enabled,
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {   
                $Type : 'UI.DataField',
                Label : 'S-ID',
                Value : s_id,
                ![@Common.FieldControl] : #ReadOnly,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
                ![@UI.Hidden]: true,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Text',
                Value : text,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Classification',
                Value : classification.label,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Author',
                Value : author.email,
                ![@UI.Hidden],
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status.label,
            },
        ],
    },
    // Worklist line items
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'S-ID',
            Value : s_id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Created at',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status.label,
         },
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Text',
            Value : text,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Classification',
            Value : classification.label,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Created by',
            Value : author.email,
            ![@UI.Hidden]: true,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Changed at',
            Value : modifiedAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Changed by',
            Value : modifiedBy,
        },             
    ],

        UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{s_id} - {title}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.HeaderInfo: {
        TypeName: 'My Lesson',
        TypeNamePlural: 'My Lessons',
  },
  title #FieldControl: '#Mandatory',
);


annotate service.Blogs with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Users',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'f_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'l_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'internal',
            },
        ],
    }
};

annotate service.Blogs with {
    status @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'WorkFlowStatus',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : status.code,
                ValueListProperty : 'code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'label',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'blogs_ID',
            },
        ],
    }
};

annotate service.Classifications with {
    label @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Classifications',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : label,
                    ValueListProperty : 'label',
                },
            ],
            Label : 'Classification',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Blogs with {
    text @UI.MultiLineText : true
};
annotate service.Classifications with {
    label @Common.FieldControl : #Mandatory
};

annotate service.WorkFlowStatus with {
    label @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'WorkFlowStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : label,
                    ValueListProperty : 'label',
                },
            ],
            Label : 'Workflow Status',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.WorkFlowStatus with {
    code @Common.Text : {
        $value : label,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.WorkFlowStatus with {
    label @Common.FieldControl : #Mandatory
};
annotate service.Blogs with {
    title @Common.FieldControl : #Mandatory
};
annotate service.Blogs with {
    text @Common.FieldControl : #Mandatory
};
annotate service.Users with {
    email @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Users',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : email,
                    ValueListProperty : 'email',
                },
            ],
            Label : 'Author',
        },
        Common.ValueListWithFixedValues : true
)};
