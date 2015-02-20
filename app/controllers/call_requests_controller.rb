class CallRequestsController < ApplicationController
  def create
    from = params[:from]
    to = params[:to]

    user = User.where('name LIKE ?', "%#{to}%").first

    if user
      @call_request = CallRequest.create(user_id: user.id, from: from)

      Pusher["assistant_for_#{user.id}"].trigger('call', {
        message: from,
        id: @call_request.id
      })

      render json: @call_request.id
    else
      render json: { error: "Usuario no encontrado" }
    end
  end

  def respond
    @call_request = CallRequest.find(params[:id])
  end

  def process_response
    @call_request = CallRequest.find(params[:id])

    if params[:response] == 'wait'
      response = "Espere #{params[:minutes]} minutos"
    else
      response = CallRequest::RESPONSES[params[:response].to_sym]
    end

    @call_request.response = response
    @call_request.save

    redirect_to root_path
  end

  def check_response
    @call_request = CallRequest.find(params[:id])

    render json: { status: @call_request.has_response?, response: @call_request.response }
  end
end
