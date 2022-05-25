<div class="messages">

  <h2>Today</h2>
  
  <div class="message">
    <div class="date">05:40 PM</div>
    <div class="body">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Odit voluptates praesentium error modi mollitia ad quos eos? Eaque, explicabo dolores?</div>
  </div>
  
  <div class="message">
    <div class="date">05:40 PM</div>
    <div class="body">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Odit voluptates praesentium error modi mollitia ad quos eos? Eaque, explicabo dolores?</div>
  </div>
  
  <div class="message">
    <div class="date">05:40 PM</div>
    <div class="body">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Odit voluptates praesentium error modi mollitia ad quos eos? Eaque, explicabo dolores?</div>
  </div>
  
  <h2>Yesterday</h2>
  
  <div class="message">
    <div class="date">05:40 PM</div>
    <div class="body">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Odit voluptates praesentium error modi mollitia ad quos eos? Eaque, explicabo dolores?</div>
  </div>
  
  <div class="message">
    <div class="date">05:40 PM</div>
    <div class="body">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Odit voluptates praesentium error modi mollitia ad quos eos? Eaque, explicabo dolores?</div>
  </div>
  
  <div class="message">
    <div class="date">05:40 PM</div>
    <div class="body">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Odit voluptates praesentium error modi mollitia ad quos eos? Eaque, explicabo dolores?</div>
  </div>
  
  <h2>May 22, 2022</h2>

  <div class="message">
    <div class="date">05:40 PM</div>
    <div class="body">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Odit voluptates praesentium error modi mollitia ad quos eos? Eaque, explicabo dolores?</div>
  </div>
  
  <div class="message">
    <div class="date">05:40 PM</div>
    <div class="body">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Odit voluptates praesentium error modi mollitia ad quos eos? Eaque, explicabo dolores?</div>
  </div>
  
  <div class="message">
    <div class="date">05:40 PM</div>
    <div class="body">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Odit voluptates praesentium error modi mollitia ad quos eos? Eaque, explicabo dolores?</div>
  </div>

</div>

<style>
  h2 {
    font-family: var(--serif);
    font-size: 1.3rem;
    margin-bottom: 15px;
  }
  h2:not(:first-child) {
    margin: 15px 0;
  }
  .messages {
    display: grid;
    gap: 12px;
    /* border: 1px solid red; */
  }
  .message {
    padding-bottom: 12px;
    border-bottom: 1px dashed var(--border);
  }
  .message + .message:last-child {
    border-bottom: none !important;
  }
  .date {
    font-weight: bold;
  }
</style>