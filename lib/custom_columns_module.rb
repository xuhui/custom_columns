module CustomColumnsModule

  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
       alias_method_chain :default_columns_names, :project
    end
  end

  module InstanceMethods
    def default_columns_names_with_project
      setting = JSON.parse project.cstmcols if project.present? && project.cstmcols.size > 0
      setting = Setting.issue_list_default_columns unless setting
      @default_columns_names ||= begin
        default_columns = setting.map(&:to_sym)
        project.present? ? default_columns : [:project] | default_columns
      end
    end
  end

end

