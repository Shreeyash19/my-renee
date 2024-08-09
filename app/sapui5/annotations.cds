
using BlogService as service from '../../srv/blog_service';
using from '../../db/data/data-model';


annotate service.Blogs with @(
    // Worklist Item Detail
    fiori.draft.enabled,
    odata.draft.enabled,
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status.descr,
            },
            {   
                $Type : 'UI.DataField',
                Label : 'S-ID',
                Value : s_id,
                ![@Common.FieldControl] : #ReadOnly,
            },
            {
                $Type : 'UI.DataField',
                Value : classification_code,
                Label : 'Classification',
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
                Label : 'Author',
                Value : author.email,
                ![@UI.Hidden],
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
            Value : status.descr,
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
            Value : classification.descr,
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
            Target : '@UI.FieldGroup#GeneratedGroup',
            Label : '{s_id} - {title}',
        },
            {
                $Type : 'UI.CollectionFacet',
                Label : 'Attributes',
                ID : 'Attributes',
                Facets : [
                    {
                        $Type : 'UI.ReferenceFacet',
                        ID : 'Categories1',
                        Target : '@UI.FieldGroup#Categories',
                    },
                    {
                        $Type : 'UI.ReferenceFacet',
                        ID : 'TargetPersonas',
                        Target : '@UI.FieldGroup#TargetPersonas',
                    },
                    {
                        $Type : 'UI.ReferenceFacet',
                        ID : 'Versions',
                        Target : '@UI.FieldGroup#Versions',
                    },
                ],
            },
    ],
    UI.HeaderInfo: {
        TypeName: 'My Lesson',
        TypeNamePlural: 'My Lessons',
  },
  title #FieldControl: '#Mandatory',
    UI.FieldGroup #Categories : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : categories.category_code,
                Label : 'Categories',
            },
        ],
    },
    UI.FieldGroup #Personas : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : personas.ID,
                Label : 'Personas',
            },
        ],
    },
    UI.FieldGroup #Versions : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : versions.version_code,
                Label : 'Product Version',
            },
        ],
    },

    UI.FieldGroup #TargetPersonas : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : personas.persona_code,
                Label : 'Target Audience',
            },
        ],
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{s_id} - {title}',
            ID : 'Classification',
            Target : '@UI.FieldGroup#Classification',
        },
    ],
    UI.FieldGroup #Classification : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Label : 'Status',
            },
            {
                $Type : 'UI.DataField',
                Value : classification_code,
                Label : 'Classification',
            },
        ],
    },

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
    status @(Common : {
                ValueListWithFixedValues,
                ValueList : {
                    // SearchSupported : true,
                    CollectionPath  : 'WorkFlowStatus',
                    Parameters      : [{
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : status_code,
                        ValueListProperty : 'code'
                    }],
                    Label : 'Status',
                },
                // Text            : <NavigationProperty>.<TextProperty>,
                // TextArrangement : #TextOnly 
            },
        Common.Text : {
            $value : status.descr,
            ![@UI.TextArrangement] : #TextOnly
        },)
};


annotate service.Blogs with {
    classification @(Common : {
                ValueListWithFixedValues,
                ValueList : {
                    // SearchSupported : true,
                    CollectionPath  : 'Classifications',
                    Parameters      : [{
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : classification_code,
                        ValueListProperty : 'code'
                    }],
                    Label : 'Classification',
                },
                // Text            : <NavigationProperty>.<TextProperty>,
                // TextArrangement : #TextOnly 
            },
        Common.Text : {
            $value : classification.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        )
};

annotate service.Blogs with {
    text @UI.MultiLineText : true
};


annotate service.Classifications with {
    descr @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Classifications',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : descr,
                    ValueListProperty : 'descr',
                },
            ],
            Label : 'Classification',
        },
        Common.ValueListWithFixedValues : true
)};


annotate service.WorkFlowStatus with {
    descr @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'WorkFlowStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : descr,
                    ValueListProperty : 'descr',
                },
            ],
            Label : 'Workflow Status',
        },
        Common.ValueListWithFixedValues : true
)};

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
annotate service.Blogs with {
    s_id @Common.FieldControl : #ReadOnly
};
annotate service.Blogs with {
    ID @(
        Common.Text : {
            $value : s_id,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.FieldControl : #Optional,
    )
};

annotate service.BlogCategories with {
    category @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Categories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : category_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Category',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : {
            $value : category.descr,
            ![@UI.TextArrangement] : #TextOnly,
        },
        Common.FieldControl : #Mandatory,
)};

annotate service.Categories with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.BlogCategories with @(
    UI.LineItem #Categoriestable : [
    ]
);

annotate service.Personas with {
    descr @UI.MultiLineText : true
};

annotate service.Personas with {
    code @(
        Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly
    },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Personas',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Personas',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.BlogPersonas with {
    ID @(
        Common.Text : {
            $value : persona.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Personas',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'blogs_ID',
                },
            ],
            Label : 'Personas',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Personas with {
    blogs @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.BlogVersions with {
    version @(
        Common.Text : {
            $value : version.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ProductVersions',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : version_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Product Release',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.ProductVersions with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.BlogPersonas with {
    persona @(
        Common.Text : {
            $value : persona.descr,
            ![@UI.TextArrangement] : #TextOnly,
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Personas',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : persona_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Personas',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Classifications with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.WorkFlowStatus with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Blogs with {
    categories @Common.FieldControl : #Mandatory
};