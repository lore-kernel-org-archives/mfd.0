Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399438;
	b=EKUKAyPwj12zEae8TwQrB+FwhavCETQtr/eCtdzV4bb7I9IXxSn9v5V29Cpe4KphK/0I
	 jp3WxIsUtimXcR928gjVZeI6sIwmFI8mlP4x5g6yXJjXHk91Tc3us+sYeru7pi6xoGNcZ
	 atcSMLcEKdnZAI1F6KQkLiJXDNdv9Ej29YZW/+sLjqjkS+u2/PvQO84xFJuAh9+o5w19T
	 jtZx/r8tiCZGvclUyKIZznaxvINojer9CVU+tnOLZ6fZFDnSbwFoy7uziYMs9HqicPX6q
	 VSt9rHnXd0d4zxd9dN8dSS0GIz05XuurJ8sCvg/55/T0OvmYtV/irA3v73kGmdDEibA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399438;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CTUBFEWTXGEDt9YsUxbPwEKx5YXMyD0xNCCiSbprPFs=;
	b=WdNAICtk3GM4qvEffzGQWzjeIQcyuRpEQH6qhJrzPngPyz3Hb0okYljGp+OHj1PPhThP
	 TR7fnZ61XoyS9QRSQRou0tm1hxn3xBHlHmHmDA1DM1X2kokazt2KIquxVSDNRbjOoMFDy
	 A/SFK9g07DcayIGo2/+DPBa+upn30LL8/IfF3d48pL4EEv2feCp0LtsBX9VCXAxP50d1l
	 JfojRO0Ova7LIsx6jgdS9r4ax8rpKpLsNVLY7x6kOX3CQ3a59tvQZp2dH+kHUsRre9LrI
	 5XOElf5HmcWFHIWmSpdMyHJeGAPMATFLgw4vll7vQXZxlEtJvBjTSqcY2R+5OvAkL6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6c13CSN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54DA606A31A;
	Mon, 23 Nov 2026 02:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6c13CSN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166191F000C4;
	Mon, 23 Nov 2026 02:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795399437;
	bh=CTUBFEWTXGEDt9YsUxbPwEKx5YXMyD0xNCCiSbprPFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S6c13CSNaROyEINCgbyAQDUlrUNdXuWDkCAQ2X2Cnhc5K+M/GHKhw5Og6VfROjUa0
	 ED2QPaITiDuFZpOQ8Hb2vMMAiflVtwAGJgWuL9saAutX1YMRr96B7Tuv9fH2apkgtX
	 aFcXMjjPAdUs6QjgF3P7DdlS4Mw7j5daJla9boBTZYENjTTrvigXm4wW4C8NMA3LIS
	 lZrO/0JfTq29uNJa5UEmB7Wdjb3UNNbZ7MwWPWt6FL2zjTMTpRq7n5eTTX4AyEWvSD
	 NVnBWKpb7ScRNbE/3FMIY53hC6wPPaFzlcI+Xo/oCxQxr5AOcvivTKxrX1GgcfHcCN
	 ozkAoigHhRQtg==
Date: Mon, 23 Nov 2026 02:03:54 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: bleung@chromium.org, lee@kernel.org, groeck@chromium.org,
	jthies@google.com, chrome-platform@lists.linux.dev,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: cros_ec: Drop OF node reference in
 ec_device_probe()
Message-ID: <awOfCgL-eriqrws7@google.com>
References: <20261118062949.1250-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118062949.1250-1-laixiangwu@cmss.chinamobile.com>

On Wed, Nov 18, 2026 at 02:29:48PM +0800, Xiangwu Lai wrote:
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 529a23b80..b8d363b7a 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -271,14 +271,20 @@ static int ec_device_probe(struct platform_device *pdev)
>  	 */
>  	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
>  	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
> -	    !acpi_dev_found("GOOG0021") &&
> -	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
> -		retval = mfd_add_hotplug_devices(ec->dev,
> -						 cros_ec_ucsi_cells,
> -						 ARRAY_SIZE(cros_ec_ucsi_cells));
> +	    !acpi_dev_found("GOOG0021")) {
> +		struct device_node *np __free(device_node) =
> +			of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi");

__free() is defined in <linux/cleanup.h>.  Please include it in the file.

Alternatively, simply calling `of_node_put()` after using `np` also works.

>  
> -		if (retval)
> -			dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d\n", retval);
> +		if (!np) {
> +			retval = mfd_add_hotplug_devices(ec->dev,
> +							  cros_ec_ucsi_cells,
> +							  ARRAY_SIZE(cros_ec_ucsi_cells));

./scripts/checkpatch.pl --strict:

CHECK: Alignment should match open parenthesis
#61: FILE: drivers/mfd/cros_ec_dev.c:280:
+                       retval = mfd_add_hotplug_devices(ec->dev,
+                                                         cros_ec_ucsi_cells,
