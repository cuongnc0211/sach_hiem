module StringHandler
  def remove_accent_marks(string)
    UnicodeUtils.nfkd(string).gsub(/[\u0300-\u036f]/, '').gsub('đ', 'd').gsub('Đ', 'D')
  end
end
