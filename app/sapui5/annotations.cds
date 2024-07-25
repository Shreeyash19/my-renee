
using BlogService as service from '../../srv/blog_service';

annotate service.Blogs with @(
    // Worklist Item Detail
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            // {
            //     $Type : 'UI.DataField',
            //     Label : 'ID',
            //     Value : ID,
            // },
            {   
                $Type : 'UI.DataField',
                Label : 'S-ID',
                Value : s_id,
            },
            {   
                $Type : 'UI.DataField',
                Label : 'Classification',
                Value : classification.description,
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
            // {
            //     $Type : 'UI.DataField',
            //     Label : 'Author',
            //     Value : author.email,
            // },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status.description,
            },
        ],
    },
    // Worklist line items
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'S-ID',
            Value : s_id,
            EditMode: #Display // This makes the field read-only
        },
        {
            $Type : 'UI.DataField',
            Label : 'Created at',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status.description,
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
            Value : classification.description,
        },
        // {
        //     $Type : 'UI.DataField',
        //     Label : 'Created by',
        //     Value : author.email,
        // },
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
            Label : '{s_id} - Lesson',
            //Label : '{s_id} - {classification.description}',
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
    classification @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Classifications',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : classification_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'blogs_ID',
            },
        ],
    }
};

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
                LocalDataProperty : status_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'blogs_ID',
            },
        ],
    }
};

