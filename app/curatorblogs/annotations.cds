using CurateService as service from '../../srv/curate_service';
using from '../../db/data/data-model';

annotate service.CuratorBlogs with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : s_id,
                Label : 'S-ID',
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
            {
                $Type : 'UI.DataField',
                Label : 'Source Type',
                Value : source_type_code,
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
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Content',
            ID : 'Content',
            Target : '@UI.FieldGroup#Content',
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
            Value : s_id,
            Label : 'S-ID',
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
            Label : 'SAP Employee',
            Value : internal,
        },
    ],
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
                Value : personas.ID,
                Label : 'Target Audience',
            },
            {
                $Type : 'UI.DataField',
                Value : versions.version_code,
                Label : 'Product Version',
            },
            {
                $Type : 'UI.DataField',
                Value : related.related_ID,
                Label : 'Related Lessons',
            },
        ],
    },
    UI.HeaderInfo : {
        TypeName : 'Curator Worklist Item',
        TypeNamePlural : 'Curator Worklist Items',
        Title : {
            $Type : 'UI.DataField',
            Value : s_id,
        },
    },
);

annotate service.CuratorBlogs with {
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
        $value : curatorstatus,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.CuratorBlogs with {
    classification @(
        Common.Text : {
            $value : classification.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
        Common.FieldControl : #Mandatory,
    )
};

annotate service.Classifications with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.CuratorBlogs with {
    source_type @(
        Common.Text : {
            $value : source_type.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.SourceTypes with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
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
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Personas with {
    blogs @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.CuratorBlogs with @odata.draft.enabled;
		annotate service.CuratorBlogs with  @(  
		  Capabilities.InsertRestrictions : {
		    Insertable : false,
		  },
		  Capabilities.UpdateRestrictions : {
		    Updatable : true,
		  },
		  // For now we do not want to allow deleting Classifications at all.
		  // We might want to get more lenient when we can probe for the  
		  // lack of use of a classification. Then we may want to follow
		  // this guide: Adding actions to tables,
		  // https://sapui5.hana.ondemand.com/sdk/#/topic/b623e0bbbb2b4147b2d0516c463921a0
		  Capabilities.DeleteRestrictions : {
		    Deletable : false
		  }
);
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
        Common.FieldControl : #Mandatory,
    )
};

annotate service.Categories with {
    ID @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.CuratorBlogs with {
    text @(
        UI.MultiLineText : true,
        Common.FieldControl : #Mandatory,
    )
};

annotate service.CuratorBlogs with {
    title @Common.FieldControl : #Mandatory
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

annotate service.BlogRelated with {
    related @(
        Common.Text : {
            $value : related.s_id,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CuratorBlogs',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : related_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.CuratorBlogs with {
    ID @(
        Common.Text : {
        $value : s_id,
        ![@UI.TextArrangement] : #TextOnly,
    },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CuratorBlogs',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

