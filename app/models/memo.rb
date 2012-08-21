# -*- coding: utf-8 -*-
class Memo < ActiveRecord::Base
  attr_accessible :content, :subject, :username

  validates :username, :length => { :maximum => 255, :too_long => "ユーザー名は%{count}文字以内で入力してください。" }

  validates :subject, :length => { :maximum => 255, :too_long => "タイトルは%{count}文字以内で入力してください。" }

  validates :content, :length => { :maximum => 100000, :too_long => "本文は%{count}文字以内で入力してください。" }

end
