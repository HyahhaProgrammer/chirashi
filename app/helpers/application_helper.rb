# -*- coding: utf-8 -*-
module ApplicationHelper

  def truncate(str, n)
    str.slice(/^.{0,#{n}}/u) + (str.split(//u).size > n ? "..." : "")
  end

end
