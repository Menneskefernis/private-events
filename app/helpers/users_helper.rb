module UsersHelper
  def form_of_address(use_verb = false)
    base_address = current_user == @user ? "You" : @user.name
    unless use_verb
      base_address
    else
      base_address == "You" ? base_address + " have" : @user.name + " has"
    end
  end
end
