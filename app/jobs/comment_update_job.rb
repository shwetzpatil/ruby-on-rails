class CommentUpdateJob < ApplicationJob
  queue_as :default

  def perform(comment, current_user, product)
  ProductChannel.broadcast_to comment.product_id, comment: render_comment(comment, current_user), average_rating: product.average_rating
  end

  private
  def
    render_comment(comment, current_user)
    CommentsController.render(partial: 'comments/comment', locals: { comment: comment, current_user: current_user,user_ability: Ability.new(current_user) })
  end
end
