require 'rails_helper'

describe VendorsController do
  context 'index' do
    it 'renders the page with vendor' do
      vendor = create(:vendor)

      get :index

      expect(response).to render_template(:index)
      expect(assigns(:approved).first.name).to eq(vendor.name)
      expect(assigns(:rejected).size).to eq(0)
      expect(assigns(:retired).size).to eq(0)
    end
  end

  it "rendors retired vendors" do
    vendor = create(:vendor, status: "retired")

    get :retired_index

    expect(response).to render_template(:retired_index)
    expect(assigns(:vendors).first.name).to eq(vendor.name)
  end

  it "shows each vendor" do
    vendor = create(:vendor)

    get :show, vendor_slug: vendor.slug

    expect(response).to render_template(:show)
  end
end
