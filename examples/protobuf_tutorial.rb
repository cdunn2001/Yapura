Yapura.service do
  namespace "tutorial" do
    namespace "Person" do
      structure(:PhoneNumber) {
        (required :string) [1, 'number'];
        (optional :PhoneType) [2, 'type'] = {:default => :HOME};
      }
    end
    structure(:Person) {
      (required :string) [1, 'name'];
      (required :int32) [2, 'id'];
      (optional :string) [3, 'email'];
  #    enum :PhoneType, {
  #      :MOBILE => 0,
  #      :HOME => 1,
  #      :WORK => 2
  #    }
      (repeated :PhoneNumber) [4, 'phone'];
    }
    structure "user" do
        (required :string) [1, 'uname'];
    end
    structure "account" do
        (required :user) [1, 'primary_user'];
        (optional :user) [1, 'secondary_user'];
    end
  end
end
