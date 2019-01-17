defimpl JaSerializer.Formatter, for: JaSerializer.Builder.ResourceObject do
  alias JaSerializer.Formatter.Utils

  def format(resource) do
    relationships = Utils.array_to_hash(resource.relationships)
    links = Utils.array_to_hash(resource.links)
    meta = Utils.deep_format_keys(resource.meta)

    json = %{
      "id" => to_string(resource.id),
      "type" => resource.type
    }

    json
    |> Utils.put_if_present(
      "attributes",
      Utils.array_to_hash(resource.attributes)
    )
    |> Utils.put_if_present("relationships", relationships)
    |> Utils.put_if_present("links", links)
    |> Utils.put_if_present(
      "meta",
      meta
    )
  end
end
