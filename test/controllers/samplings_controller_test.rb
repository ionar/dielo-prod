require 'test_helper'

class SamplingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sampling = samplings(:one)
  end

  test "should get index" do
    get samplings_url
    assert_response :success
  end

  test "should get new" do
    get new_sampling_url
    assert_response :success
  end

  test "should create sampling" do
    assert_difference('Sampling.count') do
      post samplings_url, params: { sampling: { data: @sampling.data, lote: @sampling.lote, peso: @sampling.peso, product_id: @sampling.product_id, quantidade_produzida: @sampling.quantidade_produzida } }
    end

    assert_redirected_to sampling_url(Sampling.last)
  end

  test "should show sampling" do
    get sampling_url(@sampling)
    assert_response :success
  end

  test "should get edit" do
    get edit_sampling_url(@sampling)
    assert_response :success
  end

  test "should update sampling" do
    patch sampling_url(@sampling), params: { sampling: { data: @sampling.data, lote: @sampling.lote, peso: @sampling.peso, product_id: @sampling.product_id, quantidade_produzida: @sampling.quantidade_produzida } }
    assert_redirected_to sampling_url(@sampling)
  end

  test "should destroy sampling" do
    assert_difference('Sampling.count', -1) do
      delete sampling_url(@sampling)
    end

    assert_redirected_to samplings_url
  end
end
