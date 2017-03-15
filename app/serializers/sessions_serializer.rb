class SessionsSerializer < ActiveModel::Serializer
  #just some basic attributes
  attributes :id, :email, :token

  def token
    object.auth_token
  end
end
