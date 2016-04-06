class TweetsController < ApplicationController
before_action :set_tweet, only: [:edit, :update, :show, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def edit

  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = User.first
    if @tweet.save
      flash[:success] = "Tweet was successfully created"
      redirect_to tweet_path(@tweet)
    else
      render 'new'
    end
  end

  def update
    if @tweet.update(tweet)
      flash[:success] = "Tweet was successfully updated"
      redirect_to tweet(@tweet)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @tweet.destroy
    flash[:success] = "Tweet was successfully deleted"
    redirect_to tweets_path
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:title, :description)
  end

end
