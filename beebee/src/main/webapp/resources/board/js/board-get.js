// JavaScript 즉시 실행 함수 모듈 패턴
// 메서드를 가지는 객체를 구성함
var replyService = (function(){
    
    function add(reply,callback,error){
        console.log("reply.......");

        $.ajax({
            type : 'post',
            url : '/replies/new',
            data : JSON.stringify(reply),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr){
                if(callback){
                    callback(result);
                }
            },
            error : function(xhr, status, er){
                if(error){
                    error(er);
                }
            }
        })
    }
    
    function getList(param, callback, error){
    	
    	let bno = param.bno;
    	
    	let page = param.page || 1;
    	
    	$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
    		function(data){
    			if(callback){
    				//callback(data); // 댓글 목록만 가져오는 경우
					callback(data.replyCnt, data.list); // 댓글 숫자와 목록을 가져오는 경우
    			}
    	}).fail(function(xhr, status, err){
    		if(error){
    			error();
    		}
    	});
    }
    
    function remove(rno, callback, error){
    	$.ajax({
    		type : 'delete',
    		url : '/replies/' + rno,
    		success : function(deleteResult, status, xhr){
    			if(callback){
    				callback(deleteResult);
    			}
    		},
    		error : function(xhr, status, er){
    			if(error){
    				error(er);
    			}
    		}
    	});
    }
    
    function update(reply, callback, error){
    	console.log("rno : " + reply.rno)
    	
    	$.ajax({
    		type : 'put',
    		url : '/replies/' + reply.rno,
    		data : JSON.stringify(reply),
    		contentType : "application/json; charset=utf-8",
    		success : function(result, status, xhr){
    			if(callback){
    				callback(result);
    			}
    		},
    		error : function(xhr, status, er){
    			if(error){
    				error(er);
    			}
    		}
    	})
    }
    
    function get(rno, callback, error){
    	$.get("/replies/" + rno + ".json", function(result){
    		
    		if(callback){
    			callback(result);
    		}
    		
    	}).fail(function(xhr, status, err){
    		if(error){
    			error();
    		}
    	});
    }
	// 시간 계산하는 함수
	function displayTime(timeValue){
		// 오늘 날짜 Date로 생성
		let today = new Date();
		// 오늘 날짜에서 받은 값을 뺌
		let gap = today.getTime() -	timeValue;
		
		// 데이터 작성 날짜
		let dateObj = new Date(timeValue);
		let str = "";

		// displayTime()은 Ajax에서 데이터를 가져와서 HTML을 만들어 주는 부분
		if(gap < (1000 * 60 * 60 * 24)){ // 1일 이내 이면
			let hh = dateObj.getHours();
			let mi = dateObj.getMinutes();
			let ss = dateObj.getSeconds();
			
			// 9시 넘으면 두자리니깐 그냥 보이게 아니면 09로 나오게
			return [ (hh > 9 ? '' : '0' ) + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss].join(''); // join 합쳐서 보내줌
		} else { // 1일전 이상
			let yy = dateObj.getFullYear();
			let mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			let dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd].join('');
		}
	}

    return {
    	add:add,
    	getList : getList,
    	remove : remove,
    	update : update,
    	get : get,
		displayTime : displayTime
    }; // 앞에는 속성 뒤에는 add 함수 그 자체
})();

$(document).ready(function() {
    // 이동
    let operForm = $("#operForm");

    $("button[data-oper='modify']").on("click", function(e) {

        operForm.attr("action", "/board/board-modify").submit();

    });

    $("button[data-oper='list']").on("click", function(e) {

        operForm.find("#bno").remove();
        operForm.attr("action","/board/board-list");
        operForm.submit();
    });
});