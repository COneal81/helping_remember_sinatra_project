class MemoriesController < ApplicationController

  # GET: /memories
  get "/memories" do
    erb :"/memories/index.html"
  end

  # GET: /memories/new
  get "/memories/new" do
    erb :"/memories/new.html"
  end

  # POST: /memories
  post "/memories" do
    redirect "/memories"
  end

  # GET: /memories/5
  get "/memories/:id" do
    erb :"/memories/show.html"
  end

  # GET: /memories/5/edit
  get "/memories/:id/edit" do
    erb :"/memories/edit.html"
  end

  # PATCH: /memories/5
  patch "/memories/:id" do
    redirect "/memories/:id"
  end

  # DELETE: /memories/5/delete
  delete "/memories/:id/delete" do
    redirect "/memories"
  end
end
