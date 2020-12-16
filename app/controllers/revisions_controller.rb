class RevisionsController < ApplicationController
  before_action :set_revision, only: [:show, :edit, :update, :destroy]

  # GET /revisions
  # GET /revisions.json
  def index
    @revisions = Revision.where(article_id: params[:id])
  end

 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_revision
      @revision = Revision.find(params[:id])
    end

end
