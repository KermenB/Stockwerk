class SiteUser
  include ActiveModel::Model

  attr_accessor :username, :password

  def login_valid?
    username == 'Adela' && password == '1234'
    # username == 'Adela' && password == 'My_157_Inception'
  end
end