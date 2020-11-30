# yale_pui_customizations

## Requirements
+ Using Yale's custom build of ArchivesSpace. To run without that custom build (with attendant consequences too numerous to detail here), remove lines 39–48 from [`public/plugin_init.rb`](blob/master/public/plugin_init.rb#L39-L48)
+ Setting in `config.rb` of which environment this is running in

    `AppConfig[:environment] = '(DEV | TEST | PROD)'`
