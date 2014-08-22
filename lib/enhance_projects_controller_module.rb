module EnhanceProjectsControllerModule

  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def columns
      settings = (params[:settings] || {}).dup.symbolize_keys
      @project.cstmcols = settings[:issue_list_default_columns].to_json.to_s
      @project.save
      flash[:notice] = l(:notice_successful_update)
      redirect_to settings_project_path(@project, :tab => 'columns')
    end
  end

end



