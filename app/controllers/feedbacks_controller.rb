class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show]
  before_action :calculate_average_rating, only: [:index, :show]
  before_action :set_highest_and_lowest_rated_feedback, only: [:index]


  def index
    @feedbacks = Feedback.all
  end

  def show
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def calculate_average_rating
    @average_rating = Feedback.average(:rating).to_f.round(1)
  end

  def set_highest_and_lowest_rated_feedback
    @highest_rated_feedback = Feedback.order(rating: :desc).first
    @lowest_rated_feedback = Feedback.order(:rating).first
  end
end
