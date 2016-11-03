class FiguresController < ApplicationController

  get '/' do
    redirect to '/figures'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    if @figure
      erb :'figures/show'
    else
      redirect to '/figures'
    end
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.landmarks.create(params[:landmark])
    @figure.titles.create(params[:title])
    redirect to "/figures/#{@figure.id}"
  end



  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])

    @figure.landmarks.create(params[:landmark])
    @figure.titles.create(params[:title])
    redirect to "/figures/#{@figure.id}"
  end


end
