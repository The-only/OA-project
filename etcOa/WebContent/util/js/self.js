$('.carousel').carousel({
	interval: 3000
});
$(function() {
	// 自适应高宽
	(function() {
		var fn = function() {
			var realh = $(window).height() - 550;
			var conth = $(".content").height();
			if (realh > conth) {
				$(".content").css('height', realh);
			}
		};
		fn();
		var re;
		$(window).on('resize', function() {
			clearTimeout(re);
			re = setTimeout(fn, 200);
		});
	})();

	// 添加时间
	(function() {
		$('#meeting_start, #meeting_end, #appoint_start, #appoint_end').datetimepicker({
			format: 'YYYY-MM-DD HH:mm:ss',
			pick12HourFormat: false
		});
	})();

	// 添加会议人员
	$(document).on({
				keydown: function(event) {
					if(event.keyCode === 32) {
		                return false;
	                }
					if (event.keyCode === 8) {
						var a = $(this).val();
						var str = a.split(";");
						var pos = a.lastIndexOf(";", a.length - 2);
						if (str.length >= 2) {
							$(this).val(a.slice(0, pos + 1));
							return false;
						}
					}
				},
				blur: function(event) {
					var c = $(this).val().match(/^[^;].+;$/g);
					if ($.trim($(this).val())!=='' && c === null) {
						$(this).val($(this).val()+';');
					}
				}
	},'#handinput');
	$(document).on({
				click: function(event) {
					   var a = $('#apartperson').val();
					if (parseInt(a) !== 0) {
						var node = $('#handinput');
						node.val(node.val() + a +';');
					}
					return false;
				}
	},'#person_add');
	
// 职员管理分页 ----xh
	$(document).on({
		change: function(event) {
		     document.fenyeStaff.submit();
		}
   },'.fenyeEvent');
	
// 分页提交---lxh
	$(document).on({
		change: function(){
			$(".fenyeEvent").submit();
		}
	}, "#mycur");

});
