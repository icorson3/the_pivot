require 'rails_helper'

describe ItemsController do
  context 'index' do
    it 'renders the page with items' do
      category = create(:category)
      vendor = create(:vendor, status: "approved")
      item = create(:item, category: category, vendor: vendor)

      get :index

      expect(response).to render_template(:index)
      expect(assigns(:categories)).to eq([category.slug])
      expect(assigns(:vendors)).to eq([vendor.name])
      expect(assigns(:items).first.name).to eq(item.name)
    end
  end
end
