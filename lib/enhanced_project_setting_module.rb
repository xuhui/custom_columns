module EnhancedProjectSettingModule

  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
       alias_method_chain :project_settings_tabs, :enhanced
    end
  end

  module InstanceMethods
    def project_settings_tabs_with_enhanced
      tabs = [{:name => 'info', :action => :edit_project, :partial => 'projects/edit', :label => :label_information_plural},
              {:name => 'modules', :action => :select_project_modules, :partial => 'projects/settings/modules', :label => :label_module_plural},
              {:name => 'members', :action => :manage_members, :partial => 'projects/settings/members', :label => :label_member_plural},
              {:name => 'versions', :action => :manage_versions, :partial => 'projects/settings/versions', :label => :label_version_plural},
              {:name => 'categories', :action => :manage_categories, :partial => 'projects/settings/issue_categories', :label => :label_issue_category_plural},
              {:name => 'wiki', :action => :manage_wiki, :partial => 'projects/settings/wiki', :label => :label_wiki},
              {:name => 'repositories', :action => :manage_repository, :partial => 'projects/settings/repositories', :label => :label_repository_plural},
              {:name => 'boards', :action => :manage_boards, :partial => 'projects/settings/boards', :label => :label_board_plural},
              {:name => 'activities', :action => :manage_project_activities, :partial => 'projects/settings/activities', :label => :enumeration_activities},
              {:name => 'columns', :action => :manage_boards, :partial => 'projects/settings/custom_columns', :label => :label_issue_columns_plural}
              ]
      tabs.select {|tab| User.current.allowed_to?(tab[:action], @project)}
    end
  end

end


