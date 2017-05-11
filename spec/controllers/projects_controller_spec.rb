require 'rails_helper'

describe ProjectsController do
  let(:user) { FactoryGirl.create(:user) }

   before(:each) do
    sign_in user
   end
  describe "GET index" do
    @users = User.all
  end
end