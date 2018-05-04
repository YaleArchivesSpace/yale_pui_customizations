# read in routes
my_routes = File.join(File.dirname(__FILE__), "routes.rb")
Plugins.extend_aspace_routes(my_routes)

AppConfig[:pui_page_custom_actions] << {
   'record_type' => ['resource'],
   'erb_partial' => 'shared/csv'
   }
AppConfig[:pui_page_actions_print] = false
AppConfig[:pui_page_actions_request] = false

AppConfig[:record_inheritance] = {
  :archival_object => {
    :inherited_fields => [
                          {
                            :property => 'title',
                            :inherit_directly => true
                          },
                          {
                            :property => 'component_id',
                            :inherit_directly => false
                          },
                          {
                            :property => 'language',
                            :inherit_directly => true
                          },
                          {
                            :property => 'dates',
                            :inherit_directly => true
                          },
                          {
                            :property => 'extents',
                            :inherit_directly => false
                          },
                          {
                            :property => 'linked_agents',
                            :inherit_if => proc {|json| json.select {|j| j['role'] == 'creator'} },
                            :inherit_directly => false
                          },
                          {
                            :property => 'notes',
                            :inherit_if => proc {|json| json.select {|j| j['type'] == 'accessrestrict'} },
                            :inherit_directly => true
                          }
                         ]
  }
}
AppConfig[:record_inheritance][:archival_object][:composite_identifiers] = {
  :include_level => true,
  :identifier_delimiter => ' '
}

AppConfig[:pui_search_results_page_size] = 20
AppConfig[:pui_block_referrer] = true # patron privacy; blocks full 'referer' when going outside the domain
AppConfig[:pui_enable_staff_link] = true # attempt to add a link back to the staff interface

# The following determine which 'tabs' are on the main horizontal menu
AppConfig[:pui_hide] = {}
AppConfig[:pui_hide][:repositories] = false
AppConfig[:pui_hide][:resources] = false
AppConfig[:pui_hide][:digital_objects] = true
AppConfig[:pui_hide][:accessions] = true
AppConfig[:pui_hide][:subjects] = false
AppConfig[:pui_hide][:agents] = false
AppConfig[:pui_hide][:classifications] = true
AppConfig[:pui_hide][:search_tab] = false

# The following determine globally whether the various "badges" appear on the Repository page
# can be overriden at repository level below (e.g.:  AppConfig[:repos][{repo_code}][:pui_hide][:counts] = true
AppConfig[:pui_hide][:record_badge] = true

AppConfig[:pui_hide][:accession_badge] = true
AppConfig[:pui_hide][:classification_badge] = true

AppConfig[:pui_repos]['brbl'] = {}
AppConfig[:pui_repos]['mssa'] = {}

AppConfig[:pui_repos]['brbl'][:hide] = {:accession_badge => false}
AppConfig[:pui_repos]['mssa'][:hide] = {:classification_badge => false}
# The following determines globally whether the 'container inventory' navigation tab/pill is hidden on resource/collection page
AppConfig[:pui_hide][:container_inventory] = false
