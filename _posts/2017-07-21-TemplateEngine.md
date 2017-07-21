---
layout: page
title: UNICORN独自テンプレートエンジン
group: documents
number: 12
---
{% include JB/setup %}

#### UNICORNの特徴の一つである`独自テンプレートエンジン`について説明します。

UNICORNのテンプレートエンジンは、標準では独自のものになっています。  
[Simple HTML DOM Parser](http://sourceforge.net/projects/simplehtmldom/) を利用して、PHP内部でHTML文書をDOMパースし  
`CSSセレクタライク`に文書を操作して書き換えが行える作りになっています。

## 基本的な利用方法

```
// div#system-msgと言うセレクタに一致するノードのテキストを変更する
$param = array('div#system-msg' => 'テンプレートエンジンのテストです。');

// URLから該当のテンプレートファイルが自動走査される
$HtmlView = Core::loadView();

// DOM操作のパラメータを渡してHTMLを再整形して画面出力
echo $HtmlView->execute($param);
```

[詳細なドキュメントはこちら](https://cdn.rawgit.com/UNICORN-Project/UNICORN/master/docs/server/html/class_html_view_assignor.html)


## 属性値の置換

HtmlViewAssignor::buildSetAttributeメソッドを使う

```
// div#googleLinkと言うセレクタに一致するノードのhrefを変更する
echo $HtmlView->execute(
     array('div#googleLink' => HtmlViewAssignor::buildSetAttribute('href', 'http://google.com'));
);
```


## 属性値の部分置換

HtmlViewAssignor::buildReplaceAttributeメソッドを使う

```
// div#googleLinkと言うセレクタに一致するノードのclass属性のshowをhideに変更する
echo $HtmlView->execute(
     array('div#googleLink' => HtmlViewAssignor::buildReplaceAttribute('class', 'show', 'hide'));
);
```


## ノードの削除

HtmlViewAssignor::buildRemoveNodeメソッドを使う

```
// div#googleLinkと言うセレクタに一致するノードをhtmlから削除する
echo $HtmlView->execute(
     array('div#googleLink' => HtmlViewAssignor::buildRemoveNode());
);
```


## ノードを繰り返し処理して複製する

HtmlViewAssignor::buildLoopNodeメソッドを使う

```
// #os optionと言うセレクタに一致するノードを配列分処理して複製する
$options = array();
$optionMst = array('Mac', 'Win', 'Linux');
foreach($optionMst as $val){
    $builds = array();
    // valueの置換の設定
    $builds[] = array('option.os' => HtmlViewAssignor::buildSetAttribute('value', $val));
    // 表示テキストの置換の設定
    $builds[] = array('option.os' => $val);
    $options[] = $builds;
} 
echo $HtmlView->execute(
     array('select#os option.os' => HtmlViewAssignor::buildLoopNode($options));
);
```
