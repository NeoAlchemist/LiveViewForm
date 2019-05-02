defmodule LvFormWeb.PageLive do
  use Phoenix.LiveView
  
  alias LvFormWeb.PageView
    
    
  def render(assigns) do
    ~L"""
    
    - HTML5 + Material Design -
    
    <div class="mui-divider"></div>
    <div class="mui-container-fluid">
    <br/>
        <table class="mui-table">
        <thead>
          <tr>
            <th>Column 1</th>
            <th>Column 2</th>
          </tr>
        </thead>
        <tbody>
          <%= for i <- @val do %>
          <tr>
            <td>Cell <%= i %></td>
            <td>Cell <%= i %></td>
          </tr>
          <% end %>

        </tbody>
      </table>
     
   
        <button phx-click="add" class="mui-btn mui-btn--primary mui-btn--raised">ADD + </button>
        <div class="mui-dropdown">
        <button class="mui-btn mui-btn--primary" data-mui-toggle="dropdown">
          Dropdown
          <span class="mui-caret"></span>
        </button>
        <ul class="mui-dropdown__menu">
          <li><a phx-click="remove" href="#">Rimovi</a></li>
        </ul>
      </div>

      <div class="mui-divider"></div>
   
      <ul class="mui-tabs__bar">
        <li class="mui--is-active"><a data-mui-toggle="tab" data-mui-controls="pane-default-1">Tab-1</a></li>
        <li><a data-mui-toggle="tab" data-mui-controls="pane-default-2">Tab-2</a></li>
        <li><a data-mui-toggle="tab" data-mui-controls="pane-default-3">Tab-3</a></li>
      </ul>
      <div class="mui-tabs__pane mui--is-active" id="pane-default-1"><button class="mui-btn mui-btn--primary" onclick="activateModal()">Activate modal</button></div>
      <div class="mui-tabs__pane" id="pane-default-2">Pane-2</div>
      <div class="mui-tabs__pane" id="pane-default-3">Pane-3</div>
    </div>
    <br/>
    <br/>
    - Polymer Spinner + Vaadin Date Picker - 
    <div class="mui-divider"></div>
    
    <vaadin-date-picker id="start" label="Data" placeholder="Placeholder">
    </vaadin-date-picker>
    <br/>
    Data scelta: <%= @ap %>
    <br/>
    Spinner 
    <br/>
    <paper-spinner active></paper-spinner>
    <br/>
    <br/>
    <br/>
    """
  end


  def mount(_session, socket) do
    {:ok, assign(socket, val: [2, 1], ap: "")}
  end

  def handle_event("add", _, socket = %{assigns: %{val: val = [h | _]}}) do
    {:noreply, assign(socket, val: [h+1 | val])}
  end

  def handle_event("remove", _, socket = %{assigns: %{val: val = [_ | t]}}) do
    {:noreply, assign(socket, val: t)}
  end

  def handle_info(message, socket) do
    {:noreply, assign(socket, ap: message.payload)}
  end
end