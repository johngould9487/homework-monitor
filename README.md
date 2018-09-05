Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.


<div id="home-page">
  <div id="overlay-title">
    <h1>Homework Monitor</h1>
    <%= link_to t(".sign_in", default: "Login"), new_user_session_path, class: "btn btn-default" %>
  </div>
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="7000">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
      <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <%= image_tag "logo-teacher", style: "opacity: 0.4; height: 100vh;", class: "carousel-center", alt: "" %>
      </div>
      <div class="item">
        <%= image_tag "logo-guardian", style: "opacity: 0.4; height: 100vh;", class: "carousel-center", alt: "" %>
      </div>
      <div class="item">
        <%= image_tag "logo-student", style: "opacity: 0.4; height: 100vh;", class: "carousel-center", alt: "" %>
      </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
