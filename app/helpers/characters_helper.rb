module CharactersHelper

    def field_completed?
        <% if @character.age.nil? %>
            N/A
        <% else %>
            <%= @character.age %>
        <% end %></p>
    end

end