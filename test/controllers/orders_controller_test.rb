require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    post line_items_url, params: { product_id: products(:ruby).id }
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      assert_redirected_to store_path
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { address: @order.address, email: @order.email, integer: @order.integer, name: @order.name, pay_type: @order.pay_type, string: @order.string, text: @order.text } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end

  test "requires item in cart" do
    get new_order_url
    assert_redirected_to store_path
    assert_equal flash[:notice], 'Your cart is empty'
  end

end