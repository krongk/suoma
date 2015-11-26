require 'test_helper'

class TravellerGroupsControllerTest < ActionController::TestCase
  setup do
    @traveller_group = traveller_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:traveller_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create traveller_group" do
    assert_difference('TravellerGroup.count') do
      post :create, traveller_group: { agency_contact_id: @traveller_group.agency_contact_id, price_for_sb: @traveller_group.price_for_sb, price_receivable: @traveller_group.price_receivable, price_received: @traveller_group.price_received, trav_date: @traveller_group.trav_date, trip_id: @traveller_group.trip_id }
    end

    assert_redirected_to traveller_group_path(assigns(:traveller_group))
  end

  test "should show traveller_group" do
    get :show, id: @traveller_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @traveller_group
    assert_response :success
  end

  test "should update traveller_group" do
    patch :update, id: @traveller_group, traveller_group: { agency_contact_id: @traveller_group.agency_contact_id, price_for_sb: @traveller_group.price_for_sb, price_receivable: @traveller_group.price_receivable, price_received: @traveller_group.price_received, trav_date: @traveller_group.trav_date, trip_id: @traveller_group.trip_id }
    assert_redirected_to traveller_group_path(assigns(:traveller_group))
  end

  test "should destroy traveller_group" do
    assert_difference('TravellerGroup.count', -1) do
      delete :destroy, id: @traveller_group
    end

    assert_redirected_to traveller_groups_path
  end
end
