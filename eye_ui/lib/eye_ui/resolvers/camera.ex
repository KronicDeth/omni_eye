defmodule EyeUi.Resolvers.Camera do

  def get_config(_parent, _args, _resolution) do
    {:ok, Eye.Camera.get_config()}
  end

  def set_size(_parent, args, _resolution) do
    Eye.Camera.set_size(args[:width], args[:height])
    {:ok, Eye.Camera.get_config()}
  end

  def set_effect(_parent, args, _resolution) do
    Eye.Camera.set_image_effect(args.effect)
    |> case do
         :ok -> {:ok, Eye.Camera.get_config}
         {:error, reason} -> {:error, %{message: reason}}
       end
    {:ok, Eye.Camera.get_config()}
  end

end
