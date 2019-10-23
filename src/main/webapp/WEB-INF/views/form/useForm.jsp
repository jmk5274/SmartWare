<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	$(function(){
		var date = moment(new Date()).format('YYYYMMDD');
		
		$.ajax({
			url : "${cp}/getAllPopupList",
			dataType : "json",
			method : "post",
			success : function(data){
				var popupList = data.popupList;
				var popupNolookList = data.popupNolookList;
				
				popupList.forEach(function(popup){
					var stDate = moment(new Date(popup.pop_st_dt)).format('YYYYMMDD');
					var endDate = moment(new Date(popup.pop_end_dt)).format('YYYYMMDD')
					
					popupNolookList.forEach(function(nolook){
						if(popup.msg_id===nolook.msg_id){
							stDate = moment(new Date(nolook.nl_dt));
						}
					});
					
					if(stDate <= date && date <= endDate){
						var popupX = (popup.pop_left);
						var popupY= (popup.pop_top);
						
						window.open('${cp }/popupView?pop_id='+popup.pop_id, '팝업창', 'width=500px, height=650px, left='+ popupX + ', top='+ popupY);
					}
				});
			}
		});
	});
</script>

<h2>${P_OPEN }</h2><br>
<div class="col-12">
	<div class="card">
	
		<div class="card-body">
			<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
				Asperiores repellendus molestiae exercitationem voluptatem tempora
				quo dolore nostrum dolor consequuntur itaque, alias fugit.
				Architecto rerum animi velit, beatae corrupti quos nam saepe
				asperiores aliquid quae culpa ea reiciendis ipsam numquam laborum
				aperiam. Id tempore consequuntur velit vitae corporis, aspernatur
				praesentium ratione!</p>
		</div>
	</div>
</div>

<div class="row">
	<div class="col">
		<div class="card">
			<div class="card-body">
				<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
					Asperiores repellendus molestiae exercitationem voluptatem tempora
					quo dolore nostrum dolor consequuntur itaque, alias fugit.
					Architecto rerum animi velit, beatae corrupti quos nam saepe
					asperiores aliquid quae culpa ea reiciendis ipsam numquam laborum
					aperiam. Id tempore consequuntur velit vitae corporis, aspernatur
					praesentium ratione!</p>
			</div>
		</div>
	</div>
	<div class="col">
		<div class="card">
			<div class="card-body">
				<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
					Asperiores repellendus molestiae exercitationem voluptatem tempora
					quo dolore nostrum dolor consequuntur itaque, alias fugit.
					Architecto rerum animi velit, beatae corrupti quos nam saepe
					asperiores aliquid quae culpa ea reiciendis ipsam numquam laborum
					aperiam. Id tempore consequuntur velit vitae corporis, aspernatur
					praesentium ratione!</p>
			</div>
		</div>
	</div>
</div>

<!-- button 태그 -->
<h2>Button</h2>
<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
           <!-- 이 버튼 사용할 거예요!! 등록 : Info / 수정 : Success / 삭제 : Danger / 검색 : Warning -->
            <h4 class="card-title">Outline Buttons</h4>
            <div class="outline-button">
                <button type="button" class="btn mb-1 btn-outline-primary">Light</button>
                <button type="button" class="btn mb-1 btn-outline-success">Light</button>
                <button type="button" class="btn mb-1 btn-outline-dark">Dark</button>
            </div>
        </div>
    </div>
</div>
        <!-- input 태그 -->
<h2>Input</h2>
<div class="col-lg-12">
	<div class="card">
		<div class="card-body">
		    <h4 class="card-title">Input Style</h4>
		    <p class="text-muted m-b-15 f-s-12">Use the input classes on an <code>.input-default, input-flat, .input-rounded</code> for Default input.</p>
		    <div class="basic-form">
		        <form>
		            <div class="form-group">
		                <input type="text" class="form-control input-default" placeholder="Input Default">
		            </div>
		        </form>
		    </div>
		</div>
	</div>
</div>

<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Input Group Size</h4>
            <div class="basic-form">
                <form action="#">
                    <div class="input-group input-group-sm mb-3">
                        <div class="input-group-prepend"><span class="input-group-text">Small</span>
                        </div>
                        <input type="text" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"><span class="input-group-text">Default</span>
                        </div>
                        <input type="text" class="form-control">
                    </div>
                    <div class="input-group input-group-lg">
                        <div class="input-group-prepend"><span class="input-group-text">Large</span>
                        </div>
                        <input type="text" class="form-control">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<h2>File Input</h2>
<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Custom file input</h4>
            <div class="basic-form">
                <form action="#">
                    <div class="input-group mb-3">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input">
                            <label class="custom-file-label">Choose file</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<h2>TextArea</h2>
<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Textarea</h4>
            <div class="basic-form">
                <form>
                    <div class="form-group">
                        <label>Comment:</label>
                        <textarea class="form-control h-150px" rows="6" id="comment"></textarea>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<h2>CheckBox</h2>
<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Checkboxes</h4>
            <div class="basic-form">
                <form>
                    <div class="form-group">
                        <div class="form-check mb-3">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" value="">Option 1</label>
                        </div>
                        <div class="form-check mb-3">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" value="">Option 2</label>
                        </div>
                        <div class="form-check disabled">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" value="" disabled="disabled">Disabled</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Checkboxes</h4>
            <div class="basic-form">
                <form>
                    <div class="form-group">
                        <div class="form-check mb-3">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" value="">Option 1</label>
                        </div>
                        <div class="form-check mb-3">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" value="">Option 2</label>
                        </div>
                        <div class="form-check disabled">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" value="" disabled="disabled">Disabled</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<h2>Radio Button</h2>
<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Radio Inline</h4>
            <div class="basic-form">
                <form>
                    <div class="form-group">
                        <label class="radio-inline mr-3">
                            <input type="radio" name="optradio"> Option 1</label>
                        <label class="radio-inline mr-3">
                            <input type="radio" name="optradio"> Option 2</label>
                        <label class="radio-inline">
                            <input type="radio" name="optradio"> Option 3</label>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Radio Buttons</h4>
            <div class="basic-form">
                <form>
                    <div class="form-group">
                        <div class="radio mb-3">
                            <label>
                                <input type="radio" name="optradio">Option 1</label>
                        </div>
                        <div class="radio mb-3">
                            <label>
                                <input type="radio" name="optradio">Option 2</label>
                        </div>
                        <div class="radio disabled">
                            <label>
                                <input type="radio" name="optradio" disabled="disabled">Option 3</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<h2>SelectBox</h2>
<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Custom Select</h4>
            <div class="basic-form">
                <form>
                    <div class="form-row align-items-center">
                        <div class="col-auto my-1">
                            <label class="mr-sm-2">Preference</label>
                            <select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                <option selected="selected">Choose...</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<h2>Form Margin/Padding</h2>
<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Readonly</h4>
            <p class="text-muted">use the <code>.form-control-plaintext</code> class to remove the default form field styling and preserve the correct margin and padding.</p>
            <div class="basic-form">
                <form>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Email</label>
                        <div class="col-sm-9">
                            <input type="text" readonly="readonly" class="form-control-plaintext" value="email@example.com">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Password</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" placeholder="Password">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Form Label Size</h4>
            <p class="text-muted">Be sure to use <code>.col-form-label-sm .col-form-label-lg</code> correctly follow the size of <code>.form-control-lg and .form-control-sm.</code>
            </p>
            <div class="basic-form">
                <form>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label col-form-label-sm">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control form-control-sm" placeholder="col-form-label-sm">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" placeholder="col-form-label">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label col-form-label-lg">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control form-control-lg" placeholder="col-form-label-lg">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<h2>Table</h2>
<div class="col-lg-6">
    <div class="card">
        <div class="card-body">
            <div class="card-title">
                <h4>Table Hover</h4>
            </div>
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Status</th>
                            <th>Date</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>1</th>
                            <td>Kolor Tea Shirt For Man</td>
                            <td><span class="badge badge-primary px-2">Sale</span>
                            </td>
                            <td>January 22</td>
                            <td class="color-primary">$21.56</td>
                        </tr>
                        <tr>
                            <th>2</th>
                            <td>Kolor Tea Shirt For Women</td>
                            <td><span class="badge badge-danger px-2">Tax</span>
                            </td>
                            <td>January 30</td>
                            <td class="color-success">$55.32</td>
                        </tr>
                        <tr>
                            <th>3</th>
                            <td>Blue Backpack For Baby</td>
                            <td><span class="badge badge-success px-2">Extended</span>
                            </td>
                            <td>January 25</td>
                            <td class="color-danger">$14.85</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- /# card -->
</div>

