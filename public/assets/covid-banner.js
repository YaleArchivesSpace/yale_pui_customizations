async function load() {
	let container = document.getElementById("emergency-top-banner");
	let bannerMarkup = "";
	fetch( "https://banner.library.yale.edu/test/banner.json" )
		.then(response => response.json())
		.then(data => {
			let allBanners = data.banners;
			if ("global" in allBanners) {
				let banners = allBanners.global;
				if (banners.length > 0) {
					let banner = banners[0];

						// Code to apply CSS class based on banner's level
						let bannerClass = '';
						switch (banner.level) {
							case "warning":
								bannerClass = 'banner-warning';
								break;
							case "severe":
								bannerClass = 'banner-severe';
								break;
							default:
								bannerClass = 'banner-default';
						}
						container.className += " " + bannerClass;

						/**
						// Code to apply text and background color directly
						container.style.backgroundColor = banner.backgroundColor;
						container.style.color = banner.textColor;
						**/
						if ( banner.header === "") {
							bannerMarkup = "<h2><i class='fa fa-bell' aria-hidden='true'></i> Notices</h2>";
						} else {
							bannerMarkup = "<h2><i class='fa fa-bell' aria-hidden='true'></i> " + banner.header + "</h2>";
						}
						bannerMarkup += "<p>" + banner.message.replace( '?_ga=2.17040304.884377947.1606697973-1161703526.1604969905', '') + "</p>";
				 }
			} else {
				bannerMarkup = "<h2><i class='fa fa-bell' aria-hidden='true'></i> Notices</h2><p>There are no notices at this time.</p>";
			}
		container.innerHTML += bannerMarkup;
	})
	.catch(error => {
			console.error('Error:', error);
		}
	);
}

load();
