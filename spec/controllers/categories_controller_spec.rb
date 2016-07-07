require 'rails_helper'

describe CategoriesController do
  context 'index' do
    it 'renders the page with categories' do
      category = create(:category)

      get :index

      expect(response).to render_template(:index)
      expect(assigns(:categories).first.name).to eq(category.name)
    end

    it 'rendors the show page of a category' do
      category = create(:category)
      vendor = create(:vendor)

      get :show, id: category

      expect(response).to render_template(:show)
      expect(assigns(:category).slug).to eq(category.slug)
      expect(assigns(:vendors).first).to eq(vendor.name)
      expect(assigns(:items).name).to eq("Item")
    end
  end
end
