require 'spec_helper'

describe "payments/edit" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :amount => 1,
      :line_item_id => 1,
      :service_id => 1
    ))
  end

  it "renders the edit payment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", payment_path(@payment), "post" do
      assert_select "input#payment_amount[name=?]", "payment[amount]"
      assert_select "input#payment_line_item_id[name=?]", "payment[line_item_id]"
      assert_select "input#payment_service_id[name=?]", "payment[service_id]"
    end
  end
end
