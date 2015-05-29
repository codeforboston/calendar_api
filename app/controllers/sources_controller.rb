class SourcesController < InheritedResources::Base

  respond_to :json

  private

    def source_params
      params.require(:source).permit(:name, :format, :url, :approved, :notes)
    end
end

