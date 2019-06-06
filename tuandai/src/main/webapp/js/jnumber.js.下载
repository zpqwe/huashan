/**
 * JNumber Object
 *
 * by liuzifeng
 */
; (function (window) {

	'use strict';

	function jnumber(value) {
		this.value = value ? Number(value) : 0;
	}

	var p = jnumber.prototype;

	p.add = function(val) {
		var v = val instanceof JNumber ? val.val() : (val || 0);
		return new JNumber(add(this.value, v));
	};

	p.sub = function(val) {
		var v = val instanceof JNumber ? val.val() : (val || 0);
		return new JNumber(sub(this.value, v));
	};

	p.mul = function(val) {
		var v = val instanceof JNumber ? val.val() : (val || 0);
		return new JNumber(mul(this.value, v));
	};

	p.div = function(val) {
		var v = val instanceof JNumber ? val.val() : (val || 0);
		if(v == 0) {
			return 'zero error';
		}
		return new JNumber(div(this.value, v));
	};

	p.calc = function(op, val) {
		return op == '+' ? this.add(val) : op == '-' ? this.sub(val) : op == '*' ? this.mul(val) : this.div(val);
	};

	p.val = function() {
		return this.value;
	};

	p.copy = function() {
		return new JNumber(this.val());
	};

	// private methods

	var f = function(v) {
		var vals = v.toString().split('.');
		return vals.length > 1 ? vals[1].length : 0;
	};

	function add(a, b) {
		var x = f(a), y = f(b), z = Math.pow(10, Math.max(x, y));
		return (mul(a, z) + mul(b, z)) / z;
	}

	function sub(a, b) {
		var x = f(a), y = f(b), z = Math.pow(10, Math.max(x, y));
		return (mul(a, z) - mul(b, z)) / z;
	}

	function mul(a, b) {
		var x = f(a), y = f(b), z = Math.pow(10, x + y);
		return Number(a.toString().replace('.', '')) * Number(b.toString().replace('.', '')) / z;
	}

	function div(a, b) {
		var x = f(a), y = f(b), z = Math.pow(10, y - x);
		var i = Number(a.toString().replace('.', '')), j = Number(b.toString().replace('.', ''));
		return mul(i / j, z);
	}

	// public Object
	window.JNumber = jnumber;

})(window);