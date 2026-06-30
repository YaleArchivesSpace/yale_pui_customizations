Rails.application.config.after_initialize do

  yale_nav_config_path = File.join(File.dirname(__FILE__), 'config', 'nav_config.yml')
  YALE_NAV_CONFIG = YAML.load_file(yale_nav_config_path).freeze

  ApplicationHelper.module_eval do
    def yale_repo_lookup
      repos = MemoryLeak::Resources.get(:repository) || []
      repos.each_with_object({}) { |r, h| h[r['repo_code']] = r if r['repo_code'] }
    end
  end

  RecordHelper.class_eval do
    # Override icon_for_type to apply custom Yale icons
    def icon_for_type(primary_type)
      case primary_type
      when 'repository'
        'fa fa-home'
      when  'resource'
        'yc yc-collection'
      when 'archival_object'
        'fa fa-file-o'
      when 'digital_object'
        'fa fa-th'
      when 'accession'
        'fa fa-yale-accession'
      when 'subject'
        'fa fa-tag'
      when  'agent_person'
        'fa fa-user'
      when 'agent_corporate_entity'
        'fa fa-university'
      when 'agent_family'
        'fa fa-users'
      when 'agent_software'
        'fa fa-save'
      when 'classification'
        'fa fa-sitemap'
      when 'top_container'
        'fa fa-archive'
      when 'digital_object_component'
        'fa fa-th-large'
      else
        'fa fa-square'
      end
    end
  end

  ArchivesSpaceClient.class_eval do
    # Override get_all_series to filter out series that are not the direct
    # descendent of a Resource record
    alias_method :get_all_series_pre_yale, :get_all_series
    def get_all_series(resource_uri)
      all_series = get_all_series_pre_yale(resource_uri)
      all_series.delete_if {|record| record.json['parent']}
      all_series
    end
  end
end
