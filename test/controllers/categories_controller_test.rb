require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  let(:category_id) { 'xyz' }
  let(:categories)  { create_list :category, 5 }

  describe 'GET /categories' do
    before  { categories }
    subject { JSON.parse body }

    it 'returns an array of places' do
      get categories_path

      assert_response :success
      assert_equal categories.count, subject.count
    end
  end

  describe 'GET /categories/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        get category_path(id: category_id)
      end
    end
  end

  describe 'POST /categories' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        post categories_path
      end
    end
  end

  describe 'PUT /categories/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        put category_path(id: category_id)
      end
    end
  end

  describe 'DELETE /categories/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        delete category_path(id: category_id)
      end
    end
  end
end