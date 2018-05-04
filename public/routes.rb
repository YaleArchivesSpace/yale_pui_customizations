ArchivesSpacePublic::Application.routes.draw do
  match 'repositories/:rid/resources/:id/csv' => 'resources_addons#csv_out', :via => [:get], defaults: { format: 'csv' }  
end
