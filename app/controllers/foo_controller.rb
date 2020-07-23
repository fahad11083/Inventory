class FooController < ApplicationController
    def echo
        params.permit!
        render plain: "The Parameter 'foo' is set as #{params[:foo].as_json}"
    end
end
