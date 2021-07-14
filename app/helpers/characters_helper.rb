module CharactersHelper

    def field_completed?(object, attribute, condition)
        if object.send(attribute).send(condition)
            content_tag :p, "N/A"
        else
            content_tag :p, object.send(attribute)
        end
    end

end