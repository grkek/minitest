class String
  def valid?(type)
    case type
    when :name
      self.chars.each do |char|
        if !char.alphanumeric?
          raise Exception.new("The name contains non-alphanumeric characters.")
        end
      end

      return self
    when :email
      if !self.includes?("@")
        raise Exception.new("The E-Mail must contain `@` in the field.")
      end

      return self
    when :password
      if self.size < 8
        raise Exception.new("The password must not be less than 8 characters.")
      end

      return self
    else
      return self
    end
  end
end