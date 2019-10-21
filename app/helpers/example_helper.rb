module ExampleHelper
  def delete_example?(e)
    e.is_author?(current_user) || e.phrase.is_author?(current_user)
  end
end

