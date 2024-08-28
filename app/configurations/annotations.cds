using AdminService as service from '../../srv/admin_service';

annotate service.Configurations with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Configuration Description',
                Value : config_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : name,
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
            Label : 'Configuration Description',
            Value : config_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : name,
        },
    ],
);

annotate service.Configurations with {
    config @(
        Common.Text : {
            $value : config.name,
            ![@UI.TextArrangement] : #TextLast
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'MetaConfigurations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : config_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
            ],
            Label : 'Configuration Description',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.MetaConfigurations with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Configurations with @odata.draft.enabled;
annotate service.Configurations with @(
    Capabilities.InsertRestrictions : {
        Insertable : true,
    },
    Capabilities.UpdateRestrictions : {
        Updatable : true,
    }, 
    Capabilities.DeleteRestrictions : {
        Deletable : false
  }
);