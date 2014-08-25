module CustomColumnsModule

  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
       alias_method_chain :default_columns_names, :project
    end
  end

  module InstanceMethods
    def default_columns_names_with_project
      puts "XH: #{__FILE__} #{__LINE__} PROJECT\n #{project.present?}"
      puts "XH: #{__FILE__} #{__LINE__} PROJECT\n #{project}" if project.present?
      setting = JSON.parse project.cstmcols if project.present? && project.cstmcols && project.cstmcols.size > 0
      puts "XH: #{__FILE__} #{__LINE__} PROJECT\n #{setting ? setting.size : 'nil'}"
      setting = Setting.issue_list_default_columns unless setting
      puts "XH: #{__FILE__} #{__LINE__} PROJECT\n #{setting ? setting.size : 'nil'}"
      r = @default_columns_names ||= begin
        default_columns = setting.map(&:to_sym)
        project.present? ? default_columns : [:project] | default_columns
      end
      puts "XH: default_columns_names return #{r}"
      return r
    end
  end

end

