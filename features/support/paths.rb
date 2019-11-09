module NavigationHelpers
   
    def path_to(page_name)
      case page_name
  
      
    #   when /^the (RottenPotatoes )?home\s?page$/ then '/movies'
    
     when /^Requests/ then 
        "/user/234/requests"
        
      when /^Pending Transactions/ then 
        "/user/234/requests/pending"
  
      # Add more mappings here.
      # Here is an example that pulls values out of the Regexp:
      #
      #   when /^(.*)'s profile page$/i
      #     user_profile_path(User.find_by_login($1))
  
      when /^the edit page for "([^"]*)"$/i
        "/user/#{Request.find_by_title($1).user_tarjimly_id}/requests/#{Request.find_by_title($1).id}/edit"
      
    #   when /^the details page for "([^"]*)"$/i
    #     "/movies/#{ Movie.find_by_title($1).id}"
  
    #   when /^the Similar Movies page for "([^"]*)"$/i
    #     "/movies/#{Movie.find_by_title($1).id}/similar"
  
      else
        begin
          page_name =~ /^the (.*) page$/
          path_components = $1.split(/\s+/)
          self.send(path_components.push('path').join('_').to_sym)
        rescue NoMethodError, ArgumentError
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
            "Now, go and add a mapping in #{__FILE__}"
        end
      end
    end
  end