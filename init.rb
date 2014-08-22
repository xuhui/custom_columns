
ActionDispatch::Callbacks.to_prepare do

  require_dependency 'issue_query'
  require_dependency 'projects_helper'
  require_dependency 'projects_controller'
  IssueQuery.send(:include, CustomColumnsModule) unless IssueQuery.included_modules.include?(CustomColumnsModule)
  ProjectsHelper.send(:include, EnhancedProjectSettingModule) unless IssueQuery.included_modules.include?(EnhancedProjectSettingModule)
  ProjectsController.send(:include, EnhanceProjectsControllerModule) unless IssueQuery.included_modules.include?(EnhanceProjectsControllerModule)
end

Redmine::Plugin.register :custom_columns do
  name 'Custom Issue Columns by Project'
  author 'Zhou Xuhui'
  description 'Custom issue columns by project'
  version '0.0.1'
  url 'https://github.com/xuhui/custom_columns'
  author_url 'https://github.com/xuhui'
  permission :manage_columns, {:projects => :columns}, :require => :member
end

