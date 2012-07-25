module AdminHelper
def admin?
    if current_user.roles.first.name == "Admin"
     true
    else
     false
    end
  end
end
