require 'rails_helper'

describe 'projects/index.html.erb' do
it 'displays project details correctly' do
  assign(:project, Project.create(name: 'Test', blood_group: 'A+', email: 'test@gmail.com', address: 'test123'))

  render

  rendered.should contain('Test')
  rendered.should contain('A+')
  rendered.should contain('test@gamil.com')
  rendered.should contain('test123')
end
end
