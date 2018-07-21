def add_style(file,style)
  content = open(file,'r:UTF-8').read
  open(file,'w:UTF-8'){|w|
    w.print content.sub('</head>',"<style>#{style}</style>\n</head>")
  }
end

def replace_content(file,from,to)
  content = open(file,'r:UTF-8').read
  open(file,'w:UTF-8'){|w|
    w.print content.sub(from,to)
  }
end

add_style('site/index.html',%`p {
    margin: 0 0 20px;
}`)

Dir.glob("site/**/index.html"){|f|
  replace_content(f,'footer class="col-md-12','footer class="container-fluid')
  replace_content(f,'</head>',%{<link rel="shortcut icon" href="../../myimg/logo.png">\n</head>})
  replace_content(f,%{<link rel="shortcut icon" href="./img/favicon.ico">},"")
  replace_content(f, 'Sushi Browser Tips<br>', '')
  replace_content(f, '<div class="wm-top-tool wm-vcenter pull-right wm-small-left">',
                  %{<div class="wm-top-tool wm-vcenter pull-right wm-small-left">
<a class="menu-top" href="/ja/tips/">目次</a>
<a class="menu-top" href="/ja/">Home</a>
<a class="menu-top" href="/ja/download.html">Download</a>
<a class="menu-top" href="https://github.com/kura52/sushi-browser/tree/master/ja">GitHub</a>})
}

