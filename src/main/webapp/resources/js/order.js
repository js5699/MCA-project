console.log("order List Module....");

var orderDetailService = (function() {
	
	
	function getList(param, callback, error) {
		var orderid = param.orderid;
		var page = param.page || 1;
		
		$.getJSON("/userOrders/orderDetail/" + orderid + "/" + page + ".json",
			function(data) {
				if(callback) {
					callback(data.itemsCnt, data.list);
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
			}
		);
	}
	
	return {
		getList: getList
	};
})();

var orderListService = (function() {
	
	function getList(param, callback, error) {
		
		var userid = param.userid;
		var page = param.page || 1;
		
		$.getJSON("/userOrders/orderList/" + userid + "/" + page + ".json",
			function(data) {
				if(callback) {
					callback(data.orderCnt, data.list);
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
			});
	}
	
	function displayTime(timeValue) {
		
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		
		var str = "";
		
		if ( gap < (1000 * 60 * 60 * 24) ) {
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', 
					 (mi > 9 ? '' : '0') + mi, ':', 
					 (ss > 9 ? '' : '0') + ss ].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth(); + 1 // getMonth is zero-based
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + 
					 mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
		}
	};
	
	return {
		getList: getList,
		displayTime: displayTime
	};
	
})();