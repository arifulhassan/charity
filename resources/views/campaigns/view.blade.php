<?php 

	$settings = App\Models\AdminSettings::first();
	
	$percentage = round($response->donations()->sum('donation') / $response->goal * 100);
	
	if( $percentage > 100 ) {
		$percentage = 100;
	} else {
		$percentage = $percentage;
	}
	
	// All Donations
	$donations = $response->donations()->orderBy('id','desc')->paginate(2);
	
	// Updates
	$updates = $response->updates()->orderBy('id','desc')->paginate(1);
	
	if( str_slug( $response->title ) == '' ) {
		$slug_url  = '';
	} else {
		$slug_url  = '/'.str_slug( $response->title );
	}

 ?>
 
 @extends('app')

@section('title'){{ $response->title.' - ' }}@endsection

@section('content')

<div class="jumbotron md index-header jumbotron_set jumbotron-cover">
      <div class="container wrap-jumbotron position-relative">
      </div>
    </div>
    
<div class="container margin-bottom-40 padding-top-40">
	
	@if (session()->has('donation_cancel'))
	<div class="alert alert-danger text-center btn-block margin-bottom-20  custom-rounded" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true">×</span>
								</button>
			<i class="fa fa-remove myicon-right"></i> {{ trans('misc.donation_cancel') }}
		</div>
		
		@endif
						
			@if (session('donation_success'))
	<div class="alert alert-success text-center btn-block margin-bottom-20  custom-rounded" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true">×</span>
								</button>
			<i class="fa fa-check myicon-right"></i> {{ trans('misc.donation_success') }}
		</div>
		
		@endif

	
<!-- Col MD -->
<div class="col-md-8 margin-bottom-20"> 
	
	<div class="text-center margin-bottom-20">
		<img class="img-responsive img-rounded" style="display: inline-block;" src="{{url('public/campaigns/large',$response->large_image)}}" />
</div>

<h1 class="font-default title-image none-overflow margin-bottom-20">
	 		{{ $response->title }}
		</h1>
		
		<hr />
		
		<div class="row margin-bottom-30">
			<div class="col-md-4">
				<a class="btn btn-block btn-facebook" href="https://www.facebook.com/sharer/sharer.php?u={{ url('campaign',$response->id) }}" target="_blank"><i class="fa fa-facebook myicon-right"></i> {{trans('misc.share_on')}} Facebook</a>
			</div>
			
			<div class="col-md-4">
				<a class="btn btn-twitter btn-block" href="https://twitter.com/intent/tweet?url={{ url('campaign',$response->id) }}&text={{ e( $response->title ) }}" data-url="{{ url('campaign',$response->id) }}" target="_blank"><i class="fa fa-twitter myicon-right"></i> {{trans('misc.tweet')}}</a>
			</div>

		<div class="col-md-4">
				<a class="btn btn-google-plus btn-block" href="https://plus.google.com/share?url={{ url('campaign',$response->id) }}" target="_blank"><i class="fa fa-google-plus myicon-right"></i> {{trans('misc.share_on')}} Google+</a>
			</div>
		</div>

<ul class="nav nav-tabs nav-justified margin-bottom-20">
  <li class="active"><a href="#desc" aria-controls="home" role="tab" data-toggle="tab" class="font-default"><strong>{{ trans('misc.story') }}</strong></a></li>
	 		<li><a href="#updates" aria-controls="home" role="tab" data-toggle="tab" class="font-default"><strong>{{ trans('misc.updates') }}</strong> <span class="badge update-ico">{{number_format($updates->total())}}</span></a></li>
</ul>

<div class="tab-content">		
		@if( $response->description != '' )
		<p role="tabpanel" class="tab-pane fade in active description"id="desc">
		{!!App\Helper::checkText($response->description)!!}
		</p>
		@endif
		
		<p role="tabpanel" class="tab-pane fade description margin-top-30" id="updates">
		
		@if( $updates->total() == 0 )	
			<span class="btn-block text-center">
	    			<i class="icon-history ico-no-result"></i>
	    		</span>
			<span class="text-center btn-block">{{ trans('misc.no_results_found') }}</span>
			
			@else
			
			@foreach( $updates as $update )
				@include('includes.ajax-updates-campaign')
				@endforeach
				
				 {{ $updates->links('vendor.pagination.loadmore') }}
				
			@endif
			
		</p>
</div>
       
 </div><!-- /COL MD -->
 
 <div class="col-md-4">

@if( Auth::check() && Auth::user()->id == $response->user()->id && $response->finalized == 0 ) 	
 	<div class="row margin-bottom-20">
 		
			<div class="col-md-12">
				<a class="btn btn-success btn-block margin-bottom-5" href="{{ url('edit/campaign',$response->id) }}">{{trans('misc.edit_campaign')}}</a>
			</div>
			
			<div class="col-md-12">
				<a class="btn btn-info btn-block margin-bottom-5" href="{{ url('update/campaign',$response->id) }}">{{trans('misc.post_an_update')}}</a>
			</div>
		
			<div class="col-md-12">
				<a href="#" class="btn btn-danger btn-block" id="deleteCampaign" data-url="{{ url('delete/campaign',$response->id) }}">{{trans('misc.delete_campaign')}}</a>
			</div>
		</div>
		@endif

<!-- Start Panel -->
 	<div class="panel panel-default panel-transparent">
	  <div class="panel-body">
	    <div class="media none-overflow">
			  <div class="media-center margin-bottom-5">
			      <img class="img-circle center-block" src="{{url('public/avatar',$response->user()->avatar)}}" width="60" height="60" >
			  </div>
			  <div class="media-body text-center">
			  	
			    	<h4 class="media-heading">
			    		{{$response->user()->name}}
			    	
			    	@if( Auth::guest() )				    		
			    		<a href="#" title="{{trans('misc.contact_organizer')}}" data-toggle="modal" data-target="#sendEmail">
			    				<i class="fa fa-envelope myicon-right"></i>
			    		</a>
			    		@endif
			    		</h4>
			    		
			    <small class="media-heading text-muted btn-block margin-zero">{{trans('misc.created')}} {{ date('M d, Y', strtotime($response->date) ) }}</small>
			    @if( $response->location != '' )
			    <small class="media-heading text-muted btn-block"><i class="fa fa-map-marker myicon-right"></i> {{$response->location}}</small>
			    @endif
			  </div>
			</div>
	  </div>
	</div><!-- End Panel -->
	
@if( $response->finalized == 0 )
 	<div class="btn-group btn-block margin-bottom-20 @if( Auth::check() && Auth::user()->id == $response->user()->id ) display-none @endif">
		<a href="{{url('donate/'.$response->id.$slug_url)}}" class="btn btn-main btn-lg btn-block custom-rounded">
			{{trans('misc.donate')}}
			</a>
		</div>
		
		@else
		
		<div class="alert boxSuccess text-center btn-block margin-bottom-20  custom-rounded" role="alert">
			<i class="fa fa-check myicon-right"></i> {{trans('misc.campaign_ended')}}
		</div>
		
		@endif
		
	<!-- Start Panel -->
	<div class="panel panel-default">
		<div class="panel-body">
			<h3 class="btn-block margin-zero" style="line-height: inherit;">
				<strong class="font-default">{{$settings->currency_symbol.number_format($response->donations()->sum('donation'))}}</strong> 
				<small>{{trans('misc.of')}} {{$settings->currency_symbol.number_format($response->goal)}} {{strtolower(trans('misc.goal'))}}</small>
				</h3>
				
				<span class="progress margin-top-10 margin-bottom-10">
					<span class="percentage" style="width: {{$percentage }}%" aria-valuemin="0" aria-valuemax="100" role="progressbar"></span>
				</span>
				
				<small class="btn-block margin-bottom-10 text-muted">
					{{$percentage }}% {{trans('misc.raised')}} {{trans('misc.by')}} {{number_format($response->donations()->count())}} {{trans_choice('misc.donation_plural',$response->donations()->count())}}
				</small>						
		</div>
	</div><!-- End Panel -->
		
<ul class="list-group" id="listDonations">
       <li class="list-group-item"><i class="fa fa-clock-o myicon-right"></i> <strong>{{trans('misc.recent_donations')}}</strong> ({{number_format($response->donations()->count())}})</li>
       
    @foreach( $donations as $donation )
    
    <?php 
    $letter = str_slug(mb_substr( $donation->fullname, 0, 1,'UTF8')); 
    
	if( $letter == '' ) {
		$letter = 'N/A';
	} 
	
	if( $donation->anonymous == 1 ) {
		$letter = 'N/A';
		$donation->fullname = trans('misc.anonymous');
	}
    ?>
    
     @include('includes.listing-donations')
     
       	 @endforeach
       	 
       	 @if( $response->donations()->count() == 0 )
       	 <li class="list-group-item">{{trans('misc.no_donations')}}</li>
       	 @endif
       	 
       	 {{ $donations->links('vendor.pagination.loadmore') }}
       	        	 
	</ul>

<div class="modal fade" id="sendEmail" tabindex="-1" role="dialog" aria-hidden="true">
     		<div class="modal-dialog">
     			<div class="modal-content"> 
     				<div class="modal-header headerModal">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        
				        <h4 class="modal-title text-center" id="myModalLabel">
				        	{{ trans('misc.contact_organizer') }}
				        	</h4>
				     </div><!-- Modal header -->
				     
				      <div class="modal-body listWrap text-center center-block modalForm">
				    
				    <!-- form start -->
			    <form method="POST" class="margin-bottom-15" action="{{ url('contact/organizer') }}" enctype="multipart/form-data" id="formContactOrganizer">
			    	<input type="hidden" name="_token" value="{{ csrf_token() }}">
			    	<input type="hidden" name="id" value="{{ $response->user()->id }}">  	
				    
				    <!-- Start Form Group -->
                    <div class="form-group">
                    	<input type="text" required="" name="name" class="form-control" placeholder="{{ trans('users.name') }}">
                    </div><!-- /.form-group-->
                    
                    <!-- Start Form Group -->
                    <div class="form-group">
                    	<input type="text" required="" name="email" class="form-control" placeholder="{{ trans('auth.email') }}">
                    </div><!-- /.form-group-->
                    
                    <!-- Start Form Group -->
                    <div class="form-group">
                    	<textarea name="message" rows="4" class="form-control" placeholder="{{ trans('misc.message') }}"></textarea>
                    </div><!-- /.form-group-->
                   						
                    <!-- Alert -->
                    <div class="alert alert-danger display-none" id="dangerAlert">
							<ul class="list-unstyled text-left" id="showErrors"></ul>
						</div><!-- Alert -->

                  
                   <button type="submit" class="btn btn-lg btn-main custom-rounded" id="buttonFormSubmit">{{ trans('misc.send_message') }}</button>
                   
                    </form>
                    
                                        <!-- Alert -->
                    <div class="alert alert-success display-none" id="successAlert">
							<ul class="list-unstyled" id="showSuccess"></ul>
						</div><!-- Alert -->


				      </div><!-- Modal body -->
     				</div><!-- Modal content -->
     			</div><!-- Modal dialog -->
     		</div><!-- Modal -->
     			
 </div><!-- /COL MD -->
 
 </div><!-- container wrap-ui -->
@endsection

@section('javascript')
<script type="text/javascript">

$(document).on('click','#updates .loadPaginator', function(r){
	r.preventDefault();
	 $(this).remove();
			$('<a class="list-group-item text-center loadMoreSpin"><i class="fa fa-circle-o-notch fa-spin fa-1x fa-fw"></i></a>').appendTo( "#updates" );
			
			var page = $(this).attr('href').split('page=')[1];
			$.ajax({
				url: '{{ url("ajax/campaign/updates") }}?id={{$response->id}}&page=' + page
			}).done(function(data){
				if( data ) {
					$('.loadMoreSpin').remove();
					
					$( data ).appendTo( "#updates" );
					jQuery(".timeAgo").timeago();
					Holder.run({images:".holderImage"})
				} else {
					bootbox.alert( "{{trans('misc.error')}}" );
				}
				//<**** - Tooltip
			});
	});

$(document).on('click','#listDonations .loadPaginator', function(e){
			e.preventDefault();
			$(this).remove();
			//$('<li class="list-group-item position-relative spinner spinnerList loadMoreSpin"></li>').appendTo( "#listDonations" )
			$('<a class="list-group-item text-center loadMoreSpin"><i class="fa fa-circle-o-notch fa-spin fa-1x fa-fw"></i></a>').appendTo( "#listDonations" );
			
			var page = $(this).attr('href').split('page=')[1];
			$.ajax({
				url: '{{ url("ajax/donations") }}?id={{$response->id}}&page=' + page
			}).done(function(data){
				if( data ) {
					$('.loadMoreSpin').remove();
					
					$( data ).appendTo( "#listDonations" );
					jQuery(".timeAgo").timeago();
					Holder.run({images:".holderImage"})
				} else {
					bootbox.alert( "{{trans('misc.error')}}" );
				}
				//<**** - Tooltip
			});
		});
		
		@if( Auth::check() ) 
		
$("#deleteCampaign").click(function(e) {
   	e.preventDefault();
   	   	
   	var element = $(this);
	var url     = element.attr('data-url');
	
	element.blur();
	
	swal(
		{   title: "{{trans('misc.delete_confirm')}}",  
		 text: "{{trans('misc.confirm_delete_campaign')}}",  
		  type: "warning",   
		  showLoaderOnConfirm: true,
		  showCancelButton: true,   
		  confirmButtonColor: "#DD6B55",  
		   confirmButtonText: "{{trans('misc.yes_confirm')}}",   
		   cancelButtonText: "{{trans('misc.cancel_confirm')}}",  
		    closeOnConfirm: false,  
		    }, 
		    function(isConfirm){  
		    	 if (isConfirm) {     
		    	 	window.location.href = url;
		    	 	}
		    	 });
		    	 
		    	 
		 });
		
		@endif
		 
</script>

@endsection
@php session()->forget('donation_cancel') @endphp
@php session()->forget('donation_success') @endphp