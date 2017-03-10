require 'rails_helper'
include Sorcery::TestHelpers::Rails::Controller

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_user(user, login_path)
  end

  it "render users index page" do
    get :index
    expect(response).to render_template :index
  end

  it "render new user page" do
    get :new
    expect(response).to render_template :new
  end
end
