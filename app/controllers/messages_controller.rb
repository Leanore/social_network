class MessagesController < ApplicationController
  before_filter :load_user
  # GET /messages
  # GET /messages.json
  def index
    #@messages = Message.all
    @sent_messages = @user.sent_messages.all
    @received_messages = @user.received_messages.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])
    #@message = @user.received_messages.find(params[:id]) || @user.sent_messages.find(params[:id]) 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    #@message = Message.new
    @message = @user.sent_messages.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end


  # POST /messages
  # POST /messages.json
  def create
    #@message = Message.new(params[:message])
    @message = @user.sent_messages.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to [@user, @message], notice: 'Message was sent.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    #@message = @user.received_messages.find(params[:id]) || @user.sent_messages.find(params[:id]) 
    @message.destroy

    respond_to do |format|
      format.html { redirect_to user_messages_url }
      format.json { head :no_content }
    end
  end
  
  def load_user
    @user = User.find(params[:user_id])
  end
end
