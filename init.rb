Redmine::Plugin.register :feedbacks do
  name 'Feedbacks'
  author 'Iceskysl'
  description 'This is a feedbacks plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/IceskYsl/feedbacks'
  author_url 'http://my.eoe.cn/iceskysl'
  
 
  
  menu :top_menu, :feedbacks, { :controller => 'feedbacks', :action => 'index' }, :caption => :label_feedbacks #, :if => User.current.allowed_to?({:controller => "worklogs", :action => "index"},nil,{:global => true})

 
  # settings :default => {'empty' => true}, :partial => 'settings/worklogs_settings'
end
