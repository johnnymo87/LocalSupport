require "spec_helper"

describe JobsController do
  describe "routing" do
    let(:org) { double 'Organization', id: 1 }

    # /organizations/:organization_id/jobs
    it "routes to #index" do
      get("/organizations/#{org.id}/jobs").should route_to(
                                                      {
                                                          action: 'index',
                                                          controller: 'jobs',
                                                          organization_id: '1'
                                                      }
                                                  )
    end

    # it "routes to #new" do
    #   get("/jobs/new").should route_to("jobs#new")
    # end
    #
    # it "routes to #show" do
    #   get("/jobs/1").should route_to("jobs#show", :id => "1")
    # end
    #
    # it "routes to #edit" do
    #   get("/jobs/1/edit").should route_to("jobs#edit", :id => "1")
    # end
    #
    # it "routes to #create" do
    #   post("/jobs").should route_to("jobs#create")
    # end
    #
    # it "routes to #update" do
    #   put("/jobs/1").should route_to("jobs#update", :id => "1")
    # end
    #
    # it "routes to #destroy" do
    #   delete("/jobs/1").should route_to("jobs#destroy", :id => "1")
    # end

  end
end
