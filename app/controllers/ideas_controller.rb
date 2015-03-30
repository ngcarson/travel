class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  # Guests can only see index & show.
  before_filter :authenticate_user!, except: [:index, :show]

  # Sets the variable for ideas for the method to be called from views.
  def index
    @ideas = Idea.all
    @hash = Gmaps4rails.build_markers(@ideas) do |idea, marker|
      marker.lat idea.latitude
      marker.lng idea.longitude

      # Associates the travel "Idea" description in the Google map's marker pin. 
      marker.infowindow idea.Idea
    end
  end

  # Read + Show action for posted ideas.
  def show
  end

  def new
    @idea = current_user.ideas.build
  end

  def edit
  end

  # Create action for new ideas.
  def create
    @idea = current_user.ideas.build(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, alert: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # Edit action for updating user's posted idea.
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, alert: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes the idea.
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, alert: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find_by(id: params[:id])
    end

    def correct_user
      @idea = current_user.ideas.find_by(id: params[:id])
      redirect_to ideas_path, alert: "You are not allowed to edit this." if @idea.nil?
    end

    # Only allows the white list through.
    def idea_params
      params.require(:idea).permit(:latitude, :longitude, :Idea, :Destination, :Start, :End, :Tags, :image)
    end
end