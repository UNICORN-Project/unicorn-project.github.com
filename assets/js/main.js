console.log('This would be the main JS file.');
$(document).ready(function(){
	if (0 < $("#markdown_content").size()){
		var target = $("#markdown_content");
		$.ajax({
			url: target[0].attributes["src"].value,
		}).success(function(data){
			target.append(marked(data)).ready(function(){
				$("div#markdown_content h1#unicorn").remove();
				$("div#markdown_content p").each(function(){
					var text = $(this).html();
					var subhead = false;
					var subsubhead = false;
					var link = false;
					if (-1 < text.indexOf("##") && -1 == text.indexOf("###")){
						subhead = true;
					}
					else if (-1 < text.indexOf("##") && -1 < text.indexOf("###")){
						subsubhead = true;
					}
					text = text.replace(/^#+/,"");
					if (subhead){
						text = "<h3>" + text + "</h3>"
					}
					if (subsubhead){
						text = "<h4>" + text + "</h4>"
					}
					//if (subhead || subsubhead || link){
						$(this).html(text);
					//}
					//else {
					//	$(this).text(text);
					//}
				});
			});
		}).error(function(data){
			target.append("This content failed to load.");
		});
	}
});
