<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- header-->
<%@include file="/header.jsp"%>
<!-- main -->
<div style="width: 100%">
	<div style="float: left; width: 15%;">
		<jsp:include page="../nav/admin_nav.jsp" flush="true"></jsp:include>
	</div>
	<div style="float: right; width: 85%;">
		<div class="text-center top">
			<div class="general_content" style="margin-left: 65px;">
                    <div class="sidebar">
                        <div class="block_calendar">
                                                  
                            <div class="calendar" id="calendar_sidebar">
                            <div class="datepicker" id="datepicker_708" style="display: none; position: relative; width: 300px; height: 176px;">
                                <div class="datepickerBorderT"></div>
                                <div class="datepickerBorderB"></div>
                                <div class="datepickerBorderL"></div>
                                <div class="datepickerBorderR"></div>
                                <div class="datepickerBorderTL"></div>
                                <div class="datepickerBorderTR"></div>
                                <div class="datepickerBorderBL"></div>
                                <div class="datepickerBorderBR"></div>
                                <div class="datepickerContainer" style="width: 300px; height: 176px;">
                                    <table cellspacing="0" cellpadding="0">
                                        <tbody><tr><td><table cellspacing="0" cellpadding="0" class="datepickerViewDays"><thead><tr><th class="datepickerGoPrev"><a href="#"><span>◀</span></a></th><th colspan="5" class="datepickerMonth"><a href="#"><span>July 2014</span></a></th><th class="datepickerGoNext"><a href="#"><span>▶</span></a></th></tr><tr class="datepickerDoW"><th><span>M</span></th><th><span>T</span></th><th><span>W</span></th><th><span>T</span></th><th><span>F</span></th><th><span>S</span></th><th class="last"><span>S</span></th></tr></thead><tbody class="datepickerMonths"><tr><td colspan="2"><a href="#"><span>Jan</span></a></td><td colspan="2"><a href="#"><span>Feb</span></a></td><td colspan="2"><a href="#"><span>Mar</span></a></td><td colspan="2"><a href="#"><span>Apr</span></a></td></tr><tr><td colspan="2"><a href="#"><span>May</span></a></td><td colspan="2"><a href="#"><span>Jun</span></a></td><td colspan="2"><a href="#"><span>Jul</span></a></td><td colspan="2"><a href="#"><span>Aug</span></a></td></tr><tr><td colspan="2"><a href="#"><span>Sep</span></a></td><td colspan="2"><a href="#"><span>Oct</span></a></td><td colspan="2"><a href="#"><span>Nov</span></a></td><td colspan="2"><a href="#"><span>Dec</span></a></td></tr></tbody><tbody class="datepickerDays"><tr><td class="datepickerNotInMonth"><a href="#"><span>30</span></a></td><td class="datepickerSelected"><a href="#"><span>1</span></a></td><td class=""><a href="#"><span>2</span></a></td><td class=""><a href="#"><span>3</span></a></td><td class=""><a href="#"><span>4</span></a></td><td class="datepickerSaturday"><a href="#"><span>5</span></a></td><td class="datepickerSunday last"><a href="#"><span>6</span></a></td></tr><tr><td class=""><a href="#"><span>7</span></a></td><td class=""><a href="#"><span>8</span></a></td><td class=""><a href="#"><span>9</span></a></td><td class=""><a href="#"><span>10</span></a></td><td class=""><a href="#"><span>11</span></a></td><td class="datepickerSaturday"><a href="#"><span>12</span></a></td><td class="datepickerSunday last"><a href="#"><span>13</span></a></td></tr><tr><td class=""><a href="#"><span>14</span></a></td><td class=""><a href="#"><span>15</span></a></td><td class=""><a href="#"><span>16</span></a></td><td class=""><a href="#"><span>17</span></a></td><td class=""><a href="#"><span>18</span></a></td><td class="datepickerSaturday"><a href="#"><span>19</span></a></td><td class="datepickerSunday last"><a href="#"><span>20</span></a></td></tr><tr><td class=""><a href="#"><span>21</span></a></td><td class=""><a href="#"><span>22</span></a></td><td class=""><a href="#"><span>23</span></a></td><td class=""><a href="#"><span>24</span></a></td><td class=""><a href="#"><span>25</span></a></td><td class="datepickerSaturday"><a href="#"><span>26</span></a></td><td class="datepickerSunday last"><a href="#"><span>27</span></a></td></tr><tr><td class=""><a href="#"><span>28</span></a></td><td class=""><a href="#"><span>29</span></a></td><td class=""><a href="#"><span>30</span></a></td><td class=""><a href="#"><span>31</span></a></td><td class="datepickerNotInMonth"><a href="#"><span>1</span></a></td><td class="datepickerNotInMonth datepickerSaturday"><a href="#"><span>2</span></a></td><td class="datepickerNotInMonth datepickerSunday last"><a href="#"><span>3</span></a></td></tr><tr><td class="datepickerNotInMonth"><a href="#"><span>4</span></a></td><td class="datepickerNotInMonth"><a href="#"><span>5</span></a></td><td class="datepickerNotInMonth"><a href="#"><span>6</span></a></td><td class="datepickerNotInMonth"><a href="#"><span>7</span></a></td><td class="datepickerNotInMonth"><a href="#"><span>8</span></a></td><td class="datepickerNotInMonth datepickerSaturday"><a href="#"><span>9</span></a></td><td class="datepickerNotInMonth datepickerSunday last"><a href="#"><span>10</span></a></td></tr></tbody><tbody class="datepickerYears"><tr><td colspan="2"><a href="#"><span>2008</span></a></td><td colspan="2"><a href="#"><span>2009</span></a></td><td colspan="2"><a href="#"><span>2010</span></a></td><td colspan="2"><a href="#"><span>2011</span></a></td></tr><tr><td colspan="2"><a href="#"><span>2012</span></a></td><td colspan="2"><a href="#"><span>2013</span></a></td><td colspan="2"><a href="#"><span>2014</span></a></td><td colspan="2"><a href="#"><span>2015</span></a></td></tr><tr><td colspan="2"><a href="#"><span>2016</span></a></td><td colspan="2"><a href="#"><span>2017</span></a></td><td colspan="2"><a href="#"><span>2018</span></a></td><td colspan="2"><a href="#"><span>2019</span></a></td></tr></tbody></table></td></tr></tbody></table></div></div></div>
                            
                            <script type="text/javascript">
                                var today = new Date();
                                var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
                                $('#calendar_sidebar').DatePicker({
                                    flat : true,
                                    date : date,
                                    calendars : 1,
                                    starts : 1,
                                    locale : {
                                        days : ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                                        daysShort : ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                                        daysMin : ['S', 'M', 'T', 'W', 'T', 'F', 'S', 'S'],
                                        months : ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                                        monthsShort : ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                                        weekMin : 'wk'
                                    }
                                });
                            </script>  
                        </div>
                        
                    </div>
                </div>
		</div>
	</div>
</div>
<!-- footer -->
<%@include file="/footer.jsp"%>