<script type="text/javascript" src="/js/jquery.fancybox.pack.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css" href="/js/jquery.fancybox.css?v=2.1.5" media="screen" />

<script type="text/javascript">

	$(document).ready(function() {
		$('body').on('click', '.helpers' , function(e) {
			var left, top, win, ind, html, width = 380, height = 230;
			var sub_html = {
				1: '<div class="text-center">For use by one company. See our <a href="/Website/pagesExtra/z2t_eula.asp">End User License Agreement for terms.</a></div>',
				2: '<div class="text-center">For use by one company. See our <a href="/Website/pagesExtra/z2t_eula.asp">End User License Agreement for terms.</a></div>',
				3: '<div class="text-center">We have a specialty table for clothing in New York state. If you need something specific, e-mail <a href="mailto:info@zip2tax.com">info@zip2tax.com</a> and we will look into the possibility of providing it for you.</div>',
				4: '<div class="text-center">For some example code and more information, please see <a href="/developers-interface">Developers info</a>.</div>',
				5: '<div class="text-center">To view tables currently available, please see <a href="/sample-tables">Sample Tables</a>.</div>',
				6: '<div class="text-center">Many systems integrate seamlessly and do not require programming. See <a href="/sample-tables">Sample Tables</a> for available formats.</div>',
				7: '<div class="text-center">1, 3, 6 or 12 month(s). Learn more about our <a href="/free-sales-tax-calculator#PageSection1">subscriptions</a>.</div>',
				8: '<div class="text-center">Initial purchase &amp; optional 6 or 12 month updates. Learn more about our <a href="/free-sales-tax-calculator#PageSection3">subscriptions</a>.</div>'
			}
			ind = $(this).attr('index');
      if ($(window).width() < 400) width = $(window).width() * 0.8;
			left = ($(window).width() - width) / 2;
			top = ($(window).height() - height) / 2;
			html = '<div class="fancybox-overlay fancybox-overlay-fixed" style="width: auto; height: auto; display: none;"> \
				<div class="fancybox-wrap fancybox-desktop fancybox-type-ajax fancybox-opened" tabindex="-1" style="width: ' + width + 'px; height: auto; position: absolute; top: ' + top + 'px; left: ' + left + 'px; opacity: 1; overflow: visible;"> \
					<div class="fancybox-skin" id="fancybox-skin-unique" style="padding: 15px; width: auto; height: auto;"> \
						<div class="fancybox-outer"> \
							<div class="fancybox-inner" style="overflow: auto; width: ' + (width-30) + 'px; cursor: pointer;"> \
										' + sub_html[ind] + ' \
							</div> \
						</div> \
					</div> \
					<a title="Close" class="fancybox-item fancybox-close" href="javascript:;"></a> \
				</div>';
			$('body').append(html);
			$('body').find('.fancybox-overlay').show('fast');
			e.preventDefault();
		})
		$('body').on('click', '.fancybox-close' , function(e) {
			$('.fancybox-overlay').remove();
		});
		$('body').on('click', '.fancybox-overlay' , function(e) {
			if (!$(e.target).hasClass('fancybox-skin'))
				$('.fancybox-overlay').remove();
		});
	});
	
</script>
