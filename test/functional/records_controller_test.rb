require 'test_helper'

class RecordsControllerTest < ActionController::TestCase
  setup do
    @record = records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create record" do
    assert_difference('Record.count') do
      post :create, record: { contact_ID: @record.contact_ID, contact_email: @record.contact_email, contact_mobile: @record.contact_mobile, contact_name: @record.contact_name, corp_address: @record.corp_address, corp_desk: @record.corp_desk, corp_fax: @record.corp_fax, corp_name: @record.corp_name, corp_website: @record.corp_website, summary: @record.summary }
    end

    assert_redirected_to record_path(assigns(:record))
  end

  test "should show record" do
    get :show, id: @record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @record
    assert_response :success
  end

  test "should update record" do
    put :update, id: @record, record: { contact_ID: @record.contact_ID, contact_email: @record.contact_email, contact_mobile: @record.contact_mobile, contact_name: @record.contact_name, corp_address: @record.corp_address, corp_desk: @record.corp_desk, corp_fax: @record.corp_fax, corp_name: @record.corp_name, corp_website: @record.corp_website, summary: @record.summary }
    assert_redirected_to record_path(assigns(:record))
  end

  test "should destroy record" do
    assert_difference('Record.count', -1) do
      delete :destroy, id: @record
    end

    assert_redirected_to records_path
  end
end
