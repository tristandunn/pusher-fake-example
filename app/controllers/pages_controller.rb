class PagesController < ApplicationController
  def index
    Pusher["chat"].trigger("message", { body: "A user joined." })
  end
end
