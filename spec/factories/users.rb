FactoryGirl.define do

	factory(:user) do
		email "bob@example.com"
		password "password"
		password_confirmation "password"

	end

	factory(:invalid_user) do
		email nil
		password "jopassword"
		password_confirmation "jopassword"
	end

end