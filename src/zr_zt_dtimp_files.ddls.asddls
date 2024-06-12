@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED ZZT_DTIMP_FILES'
define root view entity ZR_ZT_DTIMP_FILES
  as select from zzt_dtimp_files
  association [0..1] to ZR_ZT_DTIMP_CONF as _configuration on $projection.UuidConf = _configuration.UUID
{
  key uuid                  as UUID,
      @Consumption.valueHelpDefinition: [{  entity: {   name: 'ZC_ZT_DTIMP_CONF' ,
                                                                element: 'UUID'  }     }]
      uuid_conf             as UuidConf,
      @Semantics.mimeType: true
      mime_type             as MimeType,
      @Semantics.largeObject:
      { mimeType: 'MimeType',
      fileName: 'FileName',
      contentDispositionPreference: #ATTACHMENT }
      attachment            as Attachment,
      file_name             as FileName,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      jobcount              as Jobcount,
      jobname               as Jobname,
      cast( loghandle as abap.char( 22 ) ) as LogHandle,
      
      _configuration
}
