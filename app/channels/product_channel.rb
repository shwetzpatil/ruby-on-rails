class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "product_channel"
  end

  def unsubscribed
  end

  def listen (data)
    stop_all_streams
    stream_for data["product_id"]
  end
end
