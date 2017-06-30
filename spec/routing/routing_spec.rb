require "rails_helper"

RSpec.describe PagesController, type: :routing do
  describe "routing" do

    it "routes / to pages#index" do
      expect(get: '/').to route_to(controller: 'pages', action: 'index')
    end

    it "routes /shows to shows#index" do
      expect(get: '/shows').to route_to(controller: 'shows', action: 'index')
    end

    it 'routes /shows/:slug to shows#show' do
      expect(get: '/shows/arco-arena-2-12').to route_to(
        controller: 'shows',
        action: 'show',
        slug: 'arco-arena-2-12'
      )
    end

    it 'routes /:slug to pages#show' do
      expect(get: '/hello-world').to route_to(
        controller: 'pages',
        action: 'show',
        slug: 'hello-world'
      )
    end
  end
end
