var cardsTemplate = Handlebars.compile(`
<div class="container">

  <div class="row">
    <div class="well col-md-3">
      Create New
    </div>
    <div class="well col-md-3">
      Ready
    </div>
    <div class="well col-md-3">
      In Progress
    </div>
    <div class="well col-md-3">
      Done
    </div>
  </div>

  <div class="row">
    <div class="well col-md-3">
      <form>
        <div class="form-group">
          <label for="cardTitle">Title</label>
          <input class="form-control" id="cardTitle">
        </div>
        <div class="form-group">
          <label for="cardBody">Body</label>
          <input class="form-control" id="cardBody">
        </div>
        <div class="form-group">
          <label for="cardAcceptance">Acceptance</label>
          <input class="form-control" id="cardAcceptance">
        </div>
        <button class="btn btn-default" id="cardCreateButton">Create</button>
      </form>
    </div>
    <div class="col-md-3">
      {{#each ready}}
        <div class="well">
          {{this.title}}
        </div>
      {{/each}}
    </div>
    <div class="col-md-3">
      {{#each progress}}
        <div class="well">
          {{this.title}}
        </div>
      {{/each}}
    </div>
    <div class="well col-md-3">
      {{#each done}}
        {{this.title}}
      {{/each}}
    </div>
  </div>


</div>
`);
