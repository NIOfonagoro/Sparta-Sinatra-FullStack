class Member

  attr_accessor :id, :first_name, :last_name, :gender, :origin

  def self.open_connection
    conn = PG.connect( dbname: "members" )
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM member_data ORDER BY id"
    results = conn.exec(sql)

    members = results.map do |tuple|
      self.hydrate tuple
    end
  end

  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM member_data WHERE id=#{id} LIMIT 1"
    members = conn.exec(sql)
    member = self.hydrate members[0]
    member
  end


  def save
    conn = MEMBER.open_connection

    if (!self.id)
      sql = "INSERT INTO member_data (id, first_name, last_name, gender, origin) VALUES ('#{self.first_name}', '#{self.last_name}', '#{self.gender}', '#{self.origin}')"
    else
      sql = "UPDATE member_data SET first_name='#{self.first_name}', last_name= '#{self.last_name}', gender='#{self.gender}', origin='#{self.origin}' WHERE id ='#{self.id}'"
    end
    conn.exec(sql)
  end

  def self.destroy id
    conn = self.open_connection
    sql = "DELETE FROM member_data WHERE id=#{id}"
    conn.exec(sql)
  end


  def self.hydrate member_data
    member = Member.new

    member.id = member_data['id']
    member.first_name = member_data['first_name']
    member.last_name = member_data['last_name']
    member.gender = member_data['gender']
    member.origin = member_data['origin']

    member
  end

end
