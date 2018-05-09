# read in routes
my_routes = File.join(File.dirname(__FILE__), "routes.rb")
Plugins.extend_aspace_routes(my_routes)

AppConfig[:pui_page_custom_actions] << {
   'record_type' => ['resource'],
   'erb_partial' => 'shared/csv'
   }
