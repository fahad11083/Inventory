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
      person = Person.new
      puts person.serializable_hash
      person.first_name = "fahad"
      puts person.serializable_hash
      kid = Kid.new
      kid.grand
      json = { first_name: "fahad", last_name: "Anwaar" }.to_json
      person.password = '123'
      person.password_confirmation = '123'
      puts person.valid?
      puts person.password_digest
      person.from_json(json)
      render plain: "#{person.as_json}, #{person.first_name}"
      #render plain: "#{person.first_name},#{person.valid?},#{person.persisted?}"
      #person.age = 10
      #person.dob = 300
      #render plain: "#{person.valid?}"
      person.update(person.age)
      #person.first_name = "fahad"
      #person.last_name = "anwaar"
      #render plain: "#{ person.age_highest? },#{ person.dob_highest? },#{ person.to_model == person },#{ @user.to_partial_path },#{person.changed?},#{person.changes},"
      Prawn::Document.generate("hello.pdf") do
        text "Hello World!"
      end
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

    def download_pdf
      @user = User.find(params[:id])
      send_data generate_pdf(@user),
                filename: "#{@user.name}.pdf",
                type: "application/pdf"
    end

    def echo
      render plain: "The parameter 'foo' is set as #{params[:testing].as_json}"
    end

    private
      def user_params
        params.require(:user).permit( :name, shipping_addresses_attributes: [ :city, :country ] )
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
