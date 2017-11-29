function initNav(obj,tabObj, url, rootId) {
	obj.accordion().layout();
	var ids = {};
	$.getJSON(url + rootId, function(data) {
		$(data).each(
				function(index, v) {
					ids[index] = v.id;
					obj.accordion('add', {
						title : v.name,
						selected : false,
						content : '<div style="padding:10px"><ul name="' + v.id
								+ '"></ul></div>'
					});

				});
	});
	obj.accordion({
		onSelect : function(title, index) {
			var obj = $("ul[name='" + ids[index] + "']");
			obj.tree({
				url : url + ids[index],
				onBeforeExpand : function(node, param) {
					obj.tree('options').url = url + node.id;
				},
				loadFilter : function(data) {
					if (data.msg) {
						return data.msg;
					} else {
						for(var i=0;i<data.length;i++){
							data[i].text=data[i].name
							if(data[i].leaf=='N'){
								data[i].state='closed';
							}
							var attributes={};
							attributes.url=data[i].value
							data[i].attributes=attributes;
						}
						return data;
					}
				},
				lines : true,
				onClick : function(node) {
					if (node.attributes.url) {
						openTab(tabObj,node.id,node.text, node.attributes.url);
					}
				}
			});
		}
	});
}
function openTab(tabObj,tabId,title,url) {
	if(tabObj.tabs('existsById',tabId)){
		tabObj.tabs('selectById',tabId);
    } else {
      var content = "<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="
          + url + "></iframe>";
      tabObj.tabs('add', {
    	id:tabId,
        title : title,
        closable : true,
        content : content
      });
    }
  }
function reloadSelectedNav(){
	var nav = $('#nav',parent.document);
	var panelObj = nav.accordion('getSelected');
	panelObj.panel('collapse');
	panelObj.panel('expand');
}
$.extend($.fn.tabs.methods, {
    getTabById: function(jq,id) {
        var tabs = $.data(jq[0], 'tabs').tabs;
        for(var i=0; i<tabs.length; i++){
            var tab = tabs[i];
            if (tab.panel('options').id == id){
                return tab;
            }
        }
        return null;
    },
    selectById:function(jq,id) {
        return jq.each(function() {
            var state = $.data(this, 'tabs');
            var opts = state.options;
            var tabs = state.tabs;
            var selectHis = state.selectHis;
            if (tabs.length == 0) {return;}
            var panel = $(this).tabs('getTabById',id); // get the panel to be activated 
            if (!panel){return}
            var selected = $(this).tabs('getSelected');
            if (selected){
                if (panel[0] == selected[0]){return}
                $(this).tabs('unselect',$(this).tabs('getTabIndex',selected));
                if (!selected.panel('options').closed){return}
            }
            panel.panel('open');
            var title = panel.panel('options').title;        // the panel title 
            selectHis.push(title);        // push select history 
            var tab = panel.panel('options').tab;        // get the tab object 
            tab.addClass('tabs-selected');
            // scroll the tab to center position if required. 
            var wrap = $(this).find('>div.tabs-header>div.tabs-wrap');
            var left = tab.position().left;
            var right = left + tab.outerWidth();
            if (left < 0 || right > wrap.width()){
                var deltaX = left - (wrap.width()-tab.width()) / 2;
                $(this).tabs('scrollBy', deltaX);
            } else {
                $(this).tabs('scrollBy', 0);
            }
            $(this).tabs('resize');
            opts.onSelect.call(this, title, $(this).tabs('getTabIndex',panel));
        });
    },
    existsById:function(jq,id){
        return $(jq[0]).tabs('getTabById',id) != null;
    }
});