class DemoController < ApplicationController
  layout false
  def index
    render('index')
  end

  def hello
    @array = [1,2,3,4,5,6,7,8,9]
    render('hello')
  end

  def hello1
    redirect_to(:controller => 'demo',:action => 'index')
  end

  def youtube
    redirect_to('https://youtube.com', allow_other_host: true)
  end
end
