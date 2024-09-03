using AdminService as service from '../../srv/admin_service';
annotate service.ScopeItems with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
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
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
    ],
);
annotate service.ScopeItems with @(   
  Capabilities.InsertRestrictions : {
    Insertable : false,
  },
  Capabilities.UpdateRestrictions : {
    Updatable : false,
  },
  // For now we do not want to allow manually managing Scope Items at all.
  // We might want to get more lenient when we can probe for the  
  // lack of use of a ScopeItems. Then we may want to follow
  // this guide: Adding actions to tables, 
  // https://sapui5.hana.ondemand.com/sdk/#/topic/b623e0bbbb2b4147b2d0516c463921a0 
  Capabilities.DeleteRestrictions : {
    Deletable : false
  }
);
