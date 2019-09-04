# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


<h2>Tous les events</h2>
  <div class="table-responsive">
    <table class="table table-striped table-sm">
      <thead>
        <tr>
          <th>#</th>
          <th>Titre</th>
          <th style="width: 500px;">Description</th>
          <th>Début</th>
          <th>Durée</th> 
          <th>Lieu</th>
          <th>Prix</th>
          <th></th>
        </tr>
      </thead>
      
      <tbody>
       <% @event.each do |event| %>
        <tr>
          <td><%= event.id %></td>
          <td><%= event.title%></td>
          <td><%= event.description%></td>
          <td><%= event.start_date %></td>
          <td><%= event.duration %> min</td>
          <td><%= event.location %></td>
          <td><%= event.price%></td>
          <td><%= link_to 'Supprimer', admin_event_path(event.id), method: :delete, data: { confirm: 'Es-tu sûr?' }, class: "btn btn-danger" %></td>
        </tr>

       <% end %>
      </tbody>
    </table>
