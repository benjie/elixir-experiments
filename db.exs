defmodule Db do
  def new() do
    []
  end

  def destroy(dbref) do :ok end

  def write([], key, element) do
    [{key, element}]
  end
  def write([{key, _} | tail], key, element) do
    [{key, element} | tail]
  end
  def write([head | tail], key, element) do
    [head | write(tail, key, element)]
  end

  def delete([], key) do
    []
  end
  def delete([{key, _} | tail], key) do
    tail
  end
  def delete([head | tail], key) do
    [head | delete(tail, key)]
  end

  def read([], key) do
    {:error, :instance}
  end
  def read([{key, value} | tail], key) do
    {:ok, value}
  end
  def read([head | tail], key) do
    read(tail, key)
  end

  def match([], element) do
    []
  end
  def match([{key, element} | tail], element) do
    [key | match(tail, element)]
  end
  def match([head | tail], element) do
    match(tail, element)
  end
end
