using AdminService as service from '../../srv/blog_service';
annotate service.Personas with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Target Audience ID',
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
            Label : 'Target Audience ID',
            Value : code,
        },
        {
            $Type : 'UI.DataField',
            Value : descr,
        },
    ],
);
