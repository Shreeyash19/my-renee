using BlogService as service from '../../srv/blog_service';
using from '../../db/data/data-model';

annotate service.Blogs with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'S-ID',
                Value : s_id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Workflow Status',
                Value : status_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Classification',
                Value : classification_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SAP internal',
                Value : internal,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Content',
            ID : 'Content',
            Target : '@UI.FieldGroup#Content',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Attributes',
            ID : 'Attributes',
            Target : '@UI.FieldGroup#Attributes',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'S-ID',
            Value : s_id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Classification',
            Value : classification_code,
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
            Value : status_code,
            Label : 'Workflow Status',
        },
        {
            $Type : 'UI.DataField',
            Label : 'SAP internal',
            Value : internal,
        },
    ],
    UI.FieldGroup #Attributes : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : categories.category_ID,
                Label : 'Categories',
            },
            {
                $Type : 'UI.DataField',
                Value : personas.persona_code,
                Label : 'Target Audience ',
            },
            {
                $Type : 'UI.DataField',
                Value : related.related.ID,
                Label : 'Related Lessons',
            },
            {
                $Type : 'UI.DataField',
                Value : versions.version_code,
                Label : 'Product Version',
            },
            {
                $Type : 'UI.DataField',
                Value : source_type_code,
                Label : 'Source Type',
            },
            {
                $Type : 'UI.DataField',
                Label : 'Source',
                Value : source,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Project',
                Value : project,
            },
        ],
    },
    UI.FieldGroup #Content : {
        $Type : 'UI.FieldGroupType',
        Data : [
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
        ],
    },
);

annotate service.Blogs with {
    classification @(
        Common.Text : {
            $value : classification.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
        Common.FieldControl : #Optional,
    )
};

annotate service.Classifications with {
    code @(
        Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    },
        )
};

annotate service.Blogs with {
    status @(
        Common.Text : {
            $value : status.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
        )
};

annotate service.WorkFlowStatus with {
    code @Common.Text : {
        $value : authorstatus,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Blogs with {
    s_id @Common.FieldControl : #ReadOnly
};

annotate service.Blogs with {
    title @Common.FieldControl : #Mandatory
};

annotate service.Blogs with {
    text @(
        Common.FieldControl : #Mandatory,
        UI.MultiLineText : true,
    )
};

annotate service.Blogs with {
    project @Common.FieldControl : #Optional
};

annotate service.Blogs with {
    source_type @(
        Common.FieldControl : #Optional,
        Common.Text : {
            $value : source_type.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Blogs with {
    source @Common.FieldControl : #Optional
};

annotate service.BlogVersions with {
    version @(
        Common.Text : {
            $value : version.descr,
            ![@UI.TextArrangement] : #TextOnly
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
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Personas with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.BlogScopes with {
    scope @(
        Common.Text : {
            $value : scope.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.FieldControl : #ReadOnly,
    )
};

annotate service.BlogRelated with {
    related @(
        Common.Text : {
            $value : blog.s_id,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Blogs',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : related.ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterInOut',
                    ValueListProperty : 'title',
                    LocalDataProperty : related.title,
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.FieldControl : #Optional,
    )
};

annotate service.Blogs with {
    ID @Common.Text : {
        $value : s_id,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Blogs with @odata.draft.enabled;
annotate service.SourceTypes with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.BlogCategories with {
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
    ID @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Blogs with {
    internal @Common.FieldControl : #ReadOnly
};

