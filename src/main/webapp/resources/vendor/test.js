console.log("cart ajax......");
var cartService = (function() {
	function add(cart, callback, error){
		$.ajax({
			url : "/cart/add",
			type : "post",
			data : JSON.stringify(cart),
			dataType : "json",
			contentType: 'application/json; charset=utf-8',
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	return {
		add: add
	};
})();