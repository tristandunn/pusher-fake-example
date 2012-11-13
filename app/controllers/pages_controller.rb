class PagesController < ApplicationController
  def index
    Pusher.trigger(["chat"], "message", { body: "A user joined." })
  end
end
