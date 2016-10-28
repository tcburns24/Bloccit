module Roadmap

  def get_roadmap(roadmap_id)
    response = self.class.get(api_endpoint("/roadmaps/#{roadmap_id}"), headers: { "authorization" => @auth_token })
    @mentor_availability = JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get(api_endpoint("/checkpoints/#{checkpoint_id}"), headers: { "authorization" => @auth_token })
    @mentor_availability = JSON.parse(response.body)
  end

end
