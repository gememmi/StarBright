class EntriesController < ApplicationController
    

    def index 
        render json: @current_user.entries.all
    end

    def show
        entries = @current_user.entries.find(id: session[:user_id])
        render json: entries, status: :success
    end

    def create 
        mood_rating = MoodRating.find_by(score: params[:score])
        newEntry = @current_user.entries.create!(entry_params.merge(mood_rating_id: mood_rating.id))
        # newEntry = @current_user.entries.create!(entry_params.merge(:user_id => user.id))
        # byebug;
        render json: newEntry, status: :created
    end

    def update
        entry = Entry.find_by(id: params[:id])
        entry.update(entry_params)
        render json: entry, status: :updated
    end

    def destroy
        entry = Entry.find_by(id: params[:id])
        entry.destroy
        head :no_content
    end

    private

    def entry_params
        params.permit(:title, :content, :user_id, :mood_rating_id)
    end
end
