# clientDefs 

```
PATH is one of 
  1) CUSTOM_PATH - custom/Espo/Custom/Resources/metadata/clientDefs/{Scope}.json;
  2) MODULE_PATH - application/Espo/Modules/{ModuleName}/Resources/metadata/clientDefs/{Scope}.json;
  3) BASE_PATH - application/Espo/Resources/metadata/clientDefs/{Scope}.json

```

Contains data, related with view only. 
`All the parameters are optional and has to be set only, if is not a default.`

## controller

## collection

## acl

## aclPortal

## createDisabled

## searchPanelDisabled

## acl

## aclPortal

## views

(list|edit|detail)

## recordViews

## modalViews

## filterList
Contains a list of filters

## boolFilterList

## defaultFilterData

## selectDefaultFilters

Used as default set filter on the select modal
Object 'filter' => 'active'
    
## formDependency

## menu

```

'menu' => 
      array (
        'list' => 
        array (
          'buttons' => 
          array (
            0 => 
            array (
              'label' => 'Target Lists',
              'link' => '#TargetList',
              'acl' => 'read',
              'style' => 'default',
              'aclScope' => 'TargetList',
            ),
          ),
          'dropdown' => 
          array (
            0 => 
            array (
              'label' => 'Mass Emails',
              'link' => '#MassEmail',
              'acl' => 'read',
              'aclScope' => 'MassEmail',
            ),
            1 => 
            array (
              'label' => 'Email Templates',
              'link' => '#EmailTemplate',
              'acl' => 'read',
              'aclScope' => 'EmailTemplate',
            ),
          ),
        ),
      ),
```

## relationshipPanels

```    	 	
        relationshipPanelName => 
	          create (true|false: true by default),
    	      select (true|false: true by default),
        	  rowActionsView - view => 'views/record/row-actions/relationship-view-only',
            'readOnly' => true,
          'view' => 'views/scheduled-job/record/panels/log',
          'layout' => 'listForTeam',
          'selectPrimaryFilterName' => 'active',
          'filterList' => 
          array (
            0 => 'all',
            1 => 'accountActive',
          ),
          'layout' => 'listForAccount',
          'orderBy' => 'name',
          'createAction' => 'createRelatedQuote',
        	),
 ```

## sidePanels
```
array (
        'detail' => 
        array (
          0 => 
          array (
            'name' => 'activities',
            'label' => 'Activities',
            'view' => 'crm:views/record/panels/activities',
            'aclScope' => 'Activities',
          ),
          1 => 
          array (
            'name' => 'history',
            'label' => 'History',
            'view' => 'crm:views/record/panels/history',
            'aclScope' => 'Activities',
          ),
        ),
        'detailSmall' => 
        array (
          0 => 
          array (
            'name' => 'activities',
            'label' => 'Activities',
            'view' => 'crm:views/record/panels/activities',
            'aclScope' => 'Activities',
          ),
          1 => 
          array (
            'name' => 'history',
            'label' => 'History',
            'view' => 'crm:views/record/panels/history',
            'aclScope' => 'Activities',
          ),
        ),
      ),
      
```
      
## bottomPanels

```
'defaultSidePanelFieldLists' => 
      array (
        'detail' => 
        array (
        ),
        'detailSmall' => 
        array (
        ),
        'edit' => 
        array (
        ),
        'editSmall' => 
        array (
        ),
      ),
        
        'defaultSidePanel' => 
      array (
        'edit' => false,
        'editSmall' => false,
      ),
      'defaultSidePanelFieldLists' => 
      array (
        'detail' => 
        array (
          0 => 'createdAt',
        ),
      ),
```

## additionalLayouts
```'additionalLayouts' => 
      array (
        'detailPortal' => 
        array (
          'type' => 'detail',
        ),
        'detailSmallPortal' => 
        array (
          'type' => 'detail',
        ),
        'listPortal' => 
        array (
          'type' => 'list',
        ),
      ),

```


     
      
## massActionList
contains a list of additional massActionList
```
- 'massActionList' => 
      array (
        0 => 'pushToGoogle',
      ),
```

## checkAllResultMassActionList

```
      'checkAllResultMassActionList' => 
      array (
        0 => 'pushToGoogle',
      ),
```

## massActionDefs
```
'massActionDefs' => 
      array (
        'pushToGoogle' => 
        array (
          'confirmationMessage' => 'confirmationGoogleContactsPush',
          'successMessage' => 'successGoogleContactsPush',
          'url' => 'GoogleContacts/action/push',
          'aclScope' => 'GoogleContacts',
          'configCheck' => 'integrations.Google',
        ),
      ),
```

## iconClass
