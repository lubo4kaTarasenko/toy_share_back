require 'telegram/bot'

class Api::ProductsController < ActionController::API
  def create
    CreateProduct.call(params: params, user: current_user)

    { message: 'success' }
  end

  def index
    result = GetProducts.call(params: params)

    render json: { products: result.products, pages: result.pages_count, user: current_user&.email }
  end

  def show
    product = Product.includes(:category, :subcategory, :images, :user, :comments).find_by(url_name: params[:name])
    comments_arr = product.comments.map { |c| { id: c.id, body: c.body, email: c.user.email } }

    render json: {
      product: product.attributes.merge(
        category: product.category.name,
        subcategory: product.subcategory.name,
        images: product.images.pluck(:url),
        user: product.user.email
      ),
      comments: comments_arr
    }
  end

  def delete
    product = Product.find(params[:id])
    product.delete
    render json: { success: true }
  end

  def wanna_thing
    product = Product.find(params[:id])
    UserMailer.with(user_email: current_user.email, product: product).proposal_email.deliver_now

    body = "#{current_user.email} хоче отримати  Вашу річ #{product.name}"
    Notification.create(body: body, user: product.user, kind: 'proposal', status: 'new')
    notify_in_telegram(product.user, body)

    render json: { success: true }
  end

  def thing_to_change
    product = Product.find(params[:id])
    product_change = Product.find(params[:change_id])
    UserMailer.with(user_email: current_user.email, product: product,
                    product_change: product_change).proposal_email.deliver_now

    body = "#{current_user.email} хоче обміняти Вашу #{product.name} на #{product_change.name}"
    Notification.create(body: body, user: product.user, kind: 'proposal', status: 'new')
    notify_in_telegram(product.user, body)

    render json: { success: true }
  end

  private

  def notify_in_telegram(user, text)
    return unless user.telegram_chat_id

    client = Telegram::Bot::Client.new(ENV['TELEGRAM_TOYSHARE_TOKEN'])
    client.api.send_message(chat_id: user.telegram_chat_id, text: text)
  end
end
