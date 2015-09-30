require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname:"John",email:"john@example.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chefname should be present" do
    @chef.chefname =" "
    assert_not @chef.valid?
  end
  
  test "chefname should not be too long" do
    @chef.chefname = "x" * 41
    assert_not @chef.valid?
  end
  
  test "chefname should not bee too short" do
    @chef.chefname = "xx"
    assert_not @chef.valid?
  end
  
  test "email should be present" do
   @chef.email = " "
   assert_not @ched.valid?
  end
  
  test "email length should be within bounds" do
    @chef.email = "x" *101+"@example.com"
    assert_not @chef.valid?
  end
  
  



end