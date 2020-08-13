require 'prawn'
class UsersController < ApplicationController
  USERS = { "lifo" => "world" }
  before_action :authenticate
    def index
      @users = User.all
      respond_to do |format|
        format.html
        format.xml { render xml: @users }
        format.json {render json: @users }
      end
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
      2.times { @user.shipping_addresses.build } 
    end
    
    def create
      @user = User.create(user_params)
      session[:current_user_name] = @user.name
      if @user.save
        redirect_to users_path, notice: "You Have Successfully Created User With Shipping Address"
      else
        render 'new'
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
    end

    def download_pdf
      @user = User.find(params[:id])
      send_data generate_pdf(@user),
                filename: "#{@user.name}.pdf",
                type: "application/pdf"
    end

    def echo
      render plain: "The parameter 'foo' is set as #{params[:testing].as_json}"
    end

    def test
      logger =  Rails.logger
      sher = Sherlock.new(logger)
      puts "#{sher.investigate}"
      child = ChildClassOne.new
      child.just_print_child
      my_tome = Document.new('pablo', 'esco', 'Never mess with pablo esco bar')
      my_tome.on_load do | doc |
        puts "hey, I've been loaded!"
      end
      words = my_tome.each_word {|word| puts word}
      characters = my_tome.each_character {|content| puts content}
      enum = Enumerator.new( my_tome, :each_character )

      render plain: "#{words },#{characters},#{enum.count}"
    end

    private
      def user_params
        params.require(:user).permit( :name, :agreement, :email, :email_confirmation, shipping_addresses_attributes: [ :city, :country ] )
      end

      def authenticate
        authenticate_or_request_with_http_digest do |username|
          USERS[username]
        end
      end

      def generate_pdf(user)
        Prawn::Document.new do
          text user.name, align: :center
          text "Name: #{user.name}"
        end.render
      end
end
