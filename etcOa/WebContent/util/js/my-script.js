(function(){
        /*$(document).ready(function(){*/
            $(".child-ul:not(:first)").hide();
            $(".child-ul:not(:last)").hide();
            $(".title a").click(function(){
                $(".child-ul:visible").slideUp("slow");
                $(this).parent().next().slideDown("slow");
               // return false;
            });
            //导航栏动态效果

            $('#myModal').modal('hide');//模式框增加

            $('#meeting_start, #meeting_end').datetimepicker({
                format: 'YYYY-MM-DD HH:mm:ss',
                pick12HourFormat: false
            });//时间插件的响应

        /*});*/
})();