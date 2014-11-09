require 'rails_helper'

RSpec.describe "welcome/index", :type => :view do
  it "should render page" do
    #assign(:welcome)
    render
    expect(rendered).to match("Welcome to SYSCOMA")
  end
end
