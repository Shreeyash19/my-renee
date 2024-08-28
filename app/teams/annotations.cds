using AdminService as service from '../../srv/admin_service';
annotate service.Teams with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Code',
                Value : code,
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
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
            Label : 'Code',
            Value : code,
        },
        {
            $Type : 'UI.DataField',
            Value : descr,
        },
    ],
);

annotate service.Teams with @odata.draft.enabled;
annotate service.Teams with @(
    Capabilities.DeleteRestrictions : {
		    Deletable : false
		  }
);