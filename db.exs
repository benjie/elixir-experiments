defmodule Db do
  defstruct keys: %{}
  def new() do
    %Db{}
  end

  def destroy(dbref) do :ok end

  def write(dbref, key, element) do
    %{dbref | keys: Map.put(dbref.keys, key, element) }
  end

  def delete(dbref, key) do
    %{dbref | keys: Map.drop(dbref.keys, [key])}
  end

  def read(dbref, key) do
    case dbref.keys do
      %{^key => val} -> {:ok, val}
      _ -> {:error, :instance}
    end
  end

  def match(dbref, element) do
    for {key, ^element} <- Map.to_list(dbref.keys) do
      key
    end
  end
end
