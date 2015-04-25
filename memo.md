### 画像のサイズを取得

```
for name in `find ./ -type f | grep jpg`; do echo  `identify -format "%w %h\n" $name` $name; done
```

### 画像のサイズを横基準で変更

```
mogrify -resize 620x -unsharp 2x1.4+0.5+0 -quality 100 .//2281/4_front.JPG
```

### 画像のサイズを比率を調べる

```
gem install image_size
```

```
irb
require 'rubygems'
require 'image_size'
puts Find.find('./')
  .select{|path|  path.match(/JPG$/i)}
  .map do |p| 
    img = ImageSize.new(open(p))
    gcd = img.height.gcd(img.width)
    "#{img.width/gcd}, #{img.height/gcd} #{p}"
  end
```

### vim 一個以上の繰り返し

```
%s/[^/]\+$//
```

### screen_shot

```
page.save_screenshot 'screenshot.png'
```
