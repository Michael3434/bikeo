<h1> Add a bike : </h1>

<%= form_for @bike do |f| %>
<%= owner_id = current_id b%>
<%= f.select :type, [["Road", "Road"], ["Mountain", "Mountain"], ["Cruiser", "Cruiser"], ["Fixed gear", "Fixed gear"], ["Single speed", "Single speed"], ["Electric", "Electric"], ["Tandem", "Tandem"], ["Other", "Other"]], id: "type", prompt: "Select..." %>
<%= f. XXX :size, [["121 cm or less","121 cm or less"], ["129 cm", "129 cm"], ["137 cm", "137 cm"], ["144 cm", "144 cm"], ["152 cm", "152 cm"], ["160 cm", "160 cm"], ["167 cm", "167 cm"], ["175 cm","175 cm"], ["182 cm", "182 cm"], ["190 cm or more"]] %>
<%= f. XXX :accessories %>
<%= f.text_field :title %>
<%= f.text_area :description %>
<%= :price_hour %>
<%= :price_day %>
<%= :price_week %>
<%= :price_month %>
<%= :price_year %>
<%= :country %>
<%= :city %>
<%= :address %>
<%= f.text_field :zipcode %>
<%= f.text_field :state %>
<%= f.submit %>
<% end %>
