Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B14A4E9C00;
	Mon, 19 Oct 2026 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409554; cv=none; b=Z9rDN5irV/eIi8Nr1lUDlab8Z7fABH7y3ZoTpHxPmopl/9p5sJap68RmoURWoUzMs2N3PnoL61EoFDAnHJ0/EGcuUh5aOpvtEj78/X+bDbrFenwInxqlzE6IeQGqEcy6nRzdK6cemSLfj6v7zsEz1DiIeUkwP6UaLVEr6sYGPAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409554; c=relaxed/simple;
	bh=azD4X1epDcpZomhVfWc3wxQJYLltdILqhSRdTDWLv5Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=i78+Z+BjBW3EeBatrIO+gZJqIiROkAQYj5ZJl8eUwvGYOhpYdUO2pOV6UVbS9qZacKPy1bS5eUGx+cCB/7Cq3khuxn+1pdSNe8m8oGCSLqSopHXXtMRMLxgRCA725GiZ5ORRE+y0CXcW0VQ1AnlSYvguTDQRFOSFbrjlKZ6YGcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/nyLOLm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/nyLOLm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D221F000C4;
	Mon, 19 Oct 2026 11:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792409552;
	bh=RdNTRVP119Rn16CgrvVjkoLdMJRal1PTTVJMjCnh0PI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L/nyLOLmax3KrtMGcbsxmduMXGmbF0voPk3EFWlv3ZTZWJyZc7Sxv55sAXZidR/nR
	 g0+TF0KWlvJOyDCdi4oPx16sGxpBIShwTSpeh0iTCbIWd9Rk+cbKLiiW2JFoeGhUwM
	 YXlwvEzhahu1Ma7VPWOuBqnGhrGsqIe0M/6zU2HTsLRcM7KroodL3mzt+P1MTCxrD4
	 4rcHtXXYIxMO5Tb2NQ4Ev3EmpS2fhdOLLwuflwcyE+kHJh2YxlAPON0dVS7zEfWbjU
	 zA/gdhwfhmt7Uk7bmtjV6FrN0w7Eq3TnbmN1xesYH2LOtL9LRKFw4a5bHUEWLrBBIu
	 HT//bRK0BKSnw==
Message-ID: <sashiko-outbox-177041@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/8] backlight: qcom-wled: fix string detection
 brightness on WLED5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261019-sm8150-display-card-v2-1-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-1-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:32:31 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] backlight: qcom-wled: wled5_set_brightness() clamps 0 to low_lim=
it on restore
--

commit 1866e6688066844d34f7f3f1d2a0c521bb917107
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

backlight: qcom-wled: fix string detection brightness on WLED5

This commit updates wled_auto_string_detection() to use the per-version
wled_set_brightness() callback instead of hardcoding wled4_set_brightness(),
and moves the WLED5 module sync toggle into wled5_set_brightness().

> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backligh=
t/qcom-wled.c
> index ca350f320e177..c5243a6d547e5 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c

[ ... ]

> @@ -791,7 +783,7 @@ static void wled_auto_string_detection(struct wled *w=
led)
>  	}
> =20
>  	/* Restore brightness */
> -	rc =3D wled4_set_brightness(wled, wled->brightness);
> +	rc =3D wled->wled_set_brightness(wled, wled->brightness);
>  	if (rc < 0) {
>  		dev_err(wled->dev, "Failed to set brightness after auto detection rc=
=3D%d\n",
>  			rc);

[Severity: Medium]
When wled_auto_string_detection() runs during probe via
wled_probe() -> wled5_setup() -> wled_auto_detection_at_init(),
wled_read_brightness() has not run yet, so wled->brightness is still 0.

Previously, wled4_set_brightness() only clamped non-zero brightness values:

	/* WLED4's lower limit of operation is 0.4% */
	if (brightness > 0 && brightness < low_limit)
		brightness =3D low_limit;

However, wled5_set_brightness() unconditionally clamps brightness =3D=3D 0 =
up to
low_limit (0.1% of max_brightness):

	/* WLED5's lower limit is 0.1% */
	if (brightness < low_limit)
		brightness =3D low_limit;

With this change, restoring wled->brightness (0) at the end of
wled_auto_string_detection() on WLED5 writes and latches low_limit into the
modulator brightness register before enabling WLED3_CTRL_REG_MOD_EN.

When wled_probe() subsequently calls wled_read_brightness():

	rc =3D wled_read_brightness(wled);
	if (rc < 0)
		return rc;

	wled->brightness =3D rc;
	...
	props.brightness =3D wled->brightness ?: val;

will it read back low_limit instead of 0, leaving ovp_irq enabled in
wled_configure_ovp_irq() and initializing props.brightness to low_limit
instead of default-brightness?

Should wled5_set_brightness() check brightness > 0 && brightness < low_limit
like wled4_set_brightness() does?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-sm8150-dis=
play-card-v2-0-86c05068efc5@oss.qualcomm.com?part=3D1
