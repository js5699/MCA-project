// 주문 내역 - 주문 상품 내역
var orderDetailService = (function() {

	function getList(param, callback, error) {
		var orderid = param.orderid;
		var page = param.page || 1;
		
		$.getJSON("/adminOrder/orderItems/" + orderid + "/" + page + ".json",
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

// 개인 - 주문 내역
var adminUserService = (function() {
	
	function getOrderList(param, callback, error) {
		
		var userid = param.userid;
		var page = param.page || 1;
		
		$.getJSON("/adminUser/orderList/" + userid + "/" + page + ".json",
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
	
	function addRole(auth, callback, error){
		console.log("add auth...");
		$.ajax({
			type: 'post',
			url: '/adminUser/add-role',
			data: JSON.stringify(auth),
			contentType: 'application/json; charset=UTF-8',
			success: function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	function removeRole(auth, callback, error) {
		console.log("remove auth...");
		$.ajax({
			type: 'delete',
			url: '/adminUser/remove-role',
			data: JSON.stringify(auth),
			contentType: 'application/json; charset=uf-8',
			success: function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error: function(xhr, status, er) {
				if(error) {
					error(er);
				}
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
		getOrderList: getOrderList,
		addRole: addRole,
		removeRole: removeRole,
		displayTime: displayTime
	};
	
})();