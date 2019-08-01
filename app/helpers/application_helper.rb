module ApplicationHelper

# CUSTOM HELPERS
# ruby modules 
# app/helper when ever we created controller helper file with that name available corresponding view
# apply on pages view visible outputing a green or red box upon visible status in css and html
# these helpers are only for views 
# USEFUL FOR

# 1- Frequently used code 
# 2- Storing complex code to simplify view templates
# 3- writing large sections of Ruby code

    def error_messages_for(object) # take this object and pass it on to the render file 
        render(:partial => 'application/error_messages', :locals => {:object => object })
    end
    def status_tag(boolean, options={}) #options is a empty hash 
        options[:true_text] ||= '' #set the span tag with emtpy text
        options[:false_text] ||= ''

        if boolean
            content_tag(:span, options[:true_text], :class => 'status true')
        else
            content_tag(:span, options[:false_text], :class => 'status false')
        end
    end

end
