module EnhancedProjectSettingModule

  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
       alias_method_chain :project_settings_tabs, :enhanced
    end
  end

  module InstanceMethods
    def project_settings_tabs_with_enhanced
      tabs = project_settings_tabs_without_enhanced
      tabs << {:name => 'columns', :action => :edit_project, :partial => 'projects/settings/custom_columns', :label => :label_issue_columns_plural}
      tabs.select {|tab| User.current.allowed_to?(tab[:action], @project)}
    end
  end

end


