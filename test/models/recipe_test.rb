require 'test_helper'
class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(chefname:"bob",email:"bob@example.com")
    @recipe = @chef.recipes.build(name:"Chicken Parm",summary:"This is the best chicken parm recipe ever",
        description:"heat oil,add onions,add tomato,add chicken,cook for 20minutes")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name =" "
    assert_not @recipe.valid?
  end
  
  test "name lenght should not be too long" do
    @recipe.name = "x" * 101
    assert_not @recipe.valid?
  end
  
  test "name lenght should not be too short" do  
    @recipe.name = "xxxx"
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    
    @recipe.summary = " "
    assert_not @recipe.valid?
    
  end
  
  test "summary lenght should not be too long" do
    @recipe.summary = "x" * 151
    
    assert_not  @recipe.valid?
  end
  
  test "summary lenght should not be too short" do
    @recipe.summary = "x" * 9
    assert_not @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description =" "
    assert_not @recipe.valid?
  end
  
  test "description lenght should not be too long" do
    @recipe.description = "x" * 501
    assert_not @recipe.valid?
  end
  
  test "description lenght should not be too short" do
    @recipe.description = "x" * 19
    assert_not @recipe.valid?
  end
  

end