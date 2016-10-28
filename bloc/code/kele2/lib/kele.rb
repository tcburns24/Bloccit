require 'httparty'
require 'roadmap'

class Kele
  include HTTParty
  include Roadmap

  def initialize(username, password)
    response = self.class.post(api_endpoint("sessions"), body: { "email": username, "password": password })
    puts response.code
    raise "Invalid email or password" if response.code == 404
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(api_endpoint("users/me"), headers: { "authorization" => @auth_token })
    @user_data = JSON.parse(response.body)
    # @user_data.keys.each do |key|
    #   self.class.send(:define_method, key.to_sym) do
    #     @user_data[key]
    #   end
    # end
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get(api_endpoint("/mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
    @mentor_availability = JSON.parse(response.body)
  end

  private

  def api_endpoint(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end
