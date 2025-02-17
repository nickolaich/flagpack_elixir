defmodule Flagpack do
  @moduledoc """
  Provides 4x3 country flags as `Phoenix.Component`. Based on [flagpack.xyz](https://flagpack.xyz/).

  Each component accepts an optional class attribute in order to be able to add extra classes to the component.

  ## Usage
      <Flagpack.usa />
      <Flagpack.usa class="w-5 h-5" />

  You may use the `Flagpack.flag/1` function and pass a flag name.

      <Flagpack.flag name={:usa}/>
      <Flagpack.flag name={:usa} class="w-5 h-5" />
  """
  use Phoenix.Component

  attr :class, :string, default: "", required: false, doc: "extra classes to be added"
  attr :name, :atom, required: true, doc: "the name of the icon to be rendered"

  @doc false
  def flag(assigns) do
    apply(Flagpack, assigns.name, [assigns])
  end

  <%= for %{func: func, alpha: alpha, svg: svg} <- @flags do %>
  @doc """
  Renders the <%= Flagpack.Helpers.country_name_by_alpha(alpha) %> flag.

  ## Examples
      <Flagpack.<%= func %> />
      <Flagpack.<%= func %> class="w-5 h-5" />
  """
  attr :class, :string, default: "", required: false, doc: "extra classes to be added"

  def <%= func %>(assigns) do
    ~H"""
    <div class={"#{@class}"}>
      <%= svg %>
    </div>
    """
  end
  <% end %>
end
