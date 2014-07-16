#encoding: utf-8
class Letter < ActiveRecord::Base
  LetterTypes = {sent:"ارسالی", recieved:"دریافتی"}
end
