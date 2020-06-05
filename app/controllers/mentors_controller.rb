class MentorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @mentors = policy_scope(User).where(mentor: true)
    authorize @mentors
    @mentors = User.geocoded # returns user with coordinates

    @markers = @mentors.map do |mentor|
      {
        lat: mentor.latitude,
        lng: mentor.longitude
        # infoWindow: render_to_string(partial: "info_window", locals: {user: mentor})
      }
      end
    end

    def show
      @mentor = policy_scope(User).find(params[:id])
      authorize @mentor
    end
  end