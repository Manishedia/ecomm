<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <title>Payment</title>
    <jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script type="text/javascript">
$(function() {
	  $('form.require-validation').bind('submit', function(e) {
	    var $form         = $(e.target).closest('form'),
	        inputSelector = ['input[type=email]', 'input[type=password]',
	                         'input[type=text]', 'input[type=file]',
	                         'textarea'].join(', '),
	        $inputs       = $form.find('.required').find(inputSelector),
	        $errorMessage = $form.find('div.error'),
	        valid         = true;

	    $errorMessage.addClass('hide');
	    $('.has-error').removeClass('has-error');
	    $inputs.each(function(i, el) {
	      var $input = $(el);
	      if ($input.val() === '') {
	        $input.parent().addClass('has-error');
	        $errorMessage.removeClass('hide');
	        e.preventDefault(); // cancel on first error
	      }
	    });
	  });
	});

	$(function() {
	  var $form = $("#payment-form");

	  $form.on('submit', function(e) {
	    if (!$form.data('cc-on-file')) {
	      e.preventDefault();
	      Stripe.setPublishableKey($form.data('stripe-publishable-key'));
	      Stripe.createToken({
	        number: $('.card-number').val(),
	        cvc: $('.card-cvc').val(),
	        exp_month: $('.card-expiry-month').val(),
	        exp_year: $('.card-expiry-year').val()
	      }, stripeResponseHandler);
	    }
	  });

	  function stripeResponseHandler(status, response) {
	    if (response.error) {
	      $('.error')
	        .removeClass('hide')
	        .find('.alert')
	        .text(response.error.message);
	    } else {
	      // token contains id, last4, and card type
	      var token = response['id'];
	      // insert the token into the form so it gets submitted to the server
	      $form.find('input[type=text]').empty();
	      $form.append("<input type='hidden' name='reservation[stripe_token]' value='" + token + "'/>");
	      $form.get(0).submit();
	    }
	  }
	})
</script>
</head>
<title>Payment Gateway</title>
<body>
<div class="container" align="center">
 <div class="row">
<img style="max-width:30%; margin-top:10 px;" src="resources/imageProject/citrusLogo.jpg">
</div>


<div class="container">
    <div class='row'>
        <div class='col-md-4'></div>
        <div class='col-md-4'>
          <script src='https://js.stripe.com/v2/' type='text/javascript'></script>
          <form accept-charset="UTF-8" action="ackment" class="require-validation" data-cc-on-file="false" data-stripe-publishable-key="pk_bQQaTxnaZlzv4FnnuZ28LFHccVSaj" id="payment-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="?" /><input name="_method" type="hidden" value="PUT" /><input name="authenticity_token" type="hidden" value="qLZ9cScer7ZxqulsUWazw4x3cSEzv899SP/7ThPCOV8=" /></div>
            
<div class='form-row'>
              <div class='col-xs-12 form-group required'>
                <label class='control-label'>Name on Card</label>
                <input class='form-control' size='4' type='text'>
              </div>
            </div>
            <div class='form-row'>
              <div class='col-xs-12 form-group card required'>
                <label class='control-label'>Card Number</label>
                <input autocomplete='off' class='form-control card-number' size='20' type='text'>
              </div>
            </div>
                  <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'>Month</label>
                <input class='form-control card-expiry-month' placeholder='MM' size='2' type='text'>
              </div>
              <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'>Year</label>
                <input class='form-control card-expiry-year' placeholder='YYYY' size='4' type='text'>
              </div>
            <div class='form-row'>
              <div class='col-xs-4 form-group cvc required'>
                <label class='control-label'>CVV</label>
                <input autocomplete='off' class='form-control card-cvc' placeholder='ex. 311' size='3' type='password'>
              </div>
            </div>
            <div class='form-row'>
              <div class='col-md-12 form-group'>
                <div class='form-control total btn btn-info' disabled="true">
                <p align="left" font-size='15'>Final Payment Amount &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&#8377;${order.grandTotal}</p>
                  </div>
              </div>
            </div>
            <div class='form-row'>
              <div class='col-md-12 form-group'>
                <button class='form-control btn btn-primary submit-button' type='submit'>Pay Now</button>
              </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <label><input type="checkbox"/>Remember Card for Future</label>
               </div>
            </div>
            <div class='form-row'>
              <div class='col-md-12 error form-group hide'>
                <div class='alert-danger alert'>
                  Please correct the errors and try again.
                </div>
              </div>
            </div>
          </form>
        </div>
        <div class='col-md-4'></div>
    </div>
</div>
</div>
</body>
</html>