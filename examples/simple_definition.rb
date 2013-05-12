Yapura.service do

  namespace "blog" do 

    namespace "something" do

      structure "user" do
        (required :string) [1, 'name'];
        (repeated :int32) [3, "list_of_stringy_things"]
        (optional :int32)  [2, "age"]
      end

      structure "custom_mapper" do
        (required :string) [1, 'key'];
        (required :string) [2, 'value'];
      end

      structure "custom_map" do
        (required :custom_mapper) [1, "themap"]
      end

    end

    structure "post" do
        (required :string) [1, 'title'];
        (required :string) [2, 'body'];
        (required :int64)  [3, 'created_at'];
        (required :int64)  [4, 'updated_at'];
    end

  end

  structure "house" do
    (required :string) [1, 'build'];
    (required :string) [2, 'room'];
    (required :bool)   [3, 'finished'];
    (required :double) [4, 'cost'];
    (required :bytes)  [5, 'arbitrary'];
  end

  enum "state" do
    ACTIVE   0
    AUDIT    1
    INACTIVE 2
  end

end
