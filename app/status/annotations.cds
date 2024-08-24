using AdminService as service from '../../srv/admin_service';
annotate service.WorkFlowStatus with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'code',
                Value : code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'authorstatus',
                Value : authorstatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'curatorstatus',
                Value : curatorstatus,
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
            Label : 'Status',
            Value : code,
        },
        {
            $Type : 'UI.DataField',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Author Status',
            Value : authorstatus,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Curator Status',
            Value : curatorstatus,
        },
    ],
);

annotate service.WorkFlowStatus with {
    code @(
        Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextLast
    },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'WorkFlowStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Workflow Status',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.WorkFlowStatus with @odata.draft.enabled; 
annotate service.WorkFlowStatus with @(   
  Capabilities.InsertRestrictions : {
    Insertable : true,
  },
  Capabilities.UpdateRestrictions : {
    Updatable : true,
  },
  // For now we do not want to allow deleting PersonasWorkFlowStatuses at all.
  // We might want to get more lenient when we can probe for the  
  // lack of use of a WorkFlowStatus. Then we may want to follow
  // this guide: Adding actions to tables, 
  // https://sapui5.hana.ondemand.com/sdk/#/topic/b623e0bbbb2b4147b2d0516c463921a0 
  Capabilities.DeleteRestrictions : {
    Deletable : false
  }
);