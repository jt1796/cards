var cardsTemplate = Handlebars.compile(`
<div class="container">

  <div class="row">
    <div class="well col-md-2">
      Create New
    </div>
    <div class="well col-md-3">
      Ready
    </div>
    <div class="well col-md-4">
      In Progress
    </div>
    <div class="well col-md-3">
      Done
    </div>
  </div>


  <div class="row">
    <div class="well col-md-2">
      <form>
        <div class="form-group">
          <label for="cardTitle">Title</label>
          <input class="form-control" id="cardTitle">
        </div>
        <button class="btn btn-default" id="cardButton">Create</button>
      </form>
    </div>
    <div class="well col-md-3">
      {{#each model}}
        {{#if this.attributes.stack == 'ready'}}
          <div>
          {{this.attributes.title}}
          </div><br/>
        {{/if}}
      {{/each}}
    </div>
    <div class="well col-md-4">
    </div>
    <div class="well col-md-3">
    </div>
  </div>


</div>
`);
