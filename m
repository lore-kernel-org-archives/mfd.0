Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40A7384CD4;
	Thu, 15 Oct 2026 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055835; cv=none; b=LyPYglKpKh1WRlXp3b64D9e5l+Ljjarcj7tFRDCi/1zZjBeWgfyRAOU7KETz2KjytSAU5iKZ78RkD6LMG5SBS5CSQ4BX4cKhnDUTRosCtxSBxy9CsZc65eSyDJGDIKPh+RTG8hvtmGOFhQz3Yf9J2v4GYQcearkHwvwIJXJ5OUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055835; c=relaxed/simple;
	bh=iZ+Lx3i5PAVCM1dNvS1yqg3RFmgEc7xD54VxgUbo6LY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=L+eGXSc/Ix2azCQ/EkAR8Tumb6NX3N6FHAi8WOS5AytzY/3pGGPd/Q2QSHZs/RUz/J1KmeIHCdsudpfV2rZl+KVimiJH9kc5pdQR745IVwh+vkW9PtQOu+X5TEltOcxaPtGCCKzY3rVuan/EShB5tejmwfZzGc5A2MBr5rCvRsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRE+uNg6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRE+uNg6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E941F000C4;
	Thu, 15 Oct 2026 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792055834;
	bh=bsgyq6SJmuWHW13x2MS16fRrAjvt0BKEE9uYIGkU3ic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YRE+uNg6iUTRt9iHFhOG8cuKGXW0XCiJfa2dl6ubu0jLUqvC1eYVtHTf6IX98dFrj
	 5SFkwaOAbnAJjFi5I8LOHCa7iE61xI0jZqmhpylp9Q3KqmY6A+QD+oWl6uBFNXTJXT
	 Ko7nVAMs8m26Ryr/w1hEUn91KxVcTYi1HWd5Z4XMKatKwhHwY5df/hLm5gf6+N3uLs
	 Hqu5JlA4ET9bHj3HLTfbD5dP0fhXIEAaulW6Jf6db3T7OwCIFvrQkUVmYI1jJe9Z/C
	 fhrzTgA50qeaU6lfyZCeOqG5SpUbxMcUiYQ6MjJRY7m2RJMouAl0JIB8F5B+C8S5Bc
	 ibIWb522zpu0w==
Message-ID: <sashiko-outbox-172555@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/9] backlight: qcom-wled: fix string detection
 brightness on WLED5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261015-sm8150-display-card-v1-2-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-2-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:17:13 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] qcom-wled: missing brightness sync toggle for WLED4
--

commit 80c30ca9ff45480f825b4f3ca26c694d9fa71acf
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

backlight: qcom-wled: fix string detection brightness on WLED5

This patch updates the auto string detection logic to properly latch new
brightness values for WLED5. It introduces a helper function to set the
brightness and apply the version-specific sync toggle.

> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backligh=
t/qcom-wled.c
> index f2e0430cccbca..6fbac6a4c29b8 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -577,6 +577,17 @@ static irqreturn_t wled_short_irq_handler(int irq, v=
oid *_wled)
> =20
>  #define AUTO_DETECT_BRIGHTNESS		200
> =20
> +static int wled_auto_detect_set_brightness(struct wled *wled, u16 bright=
ness)
> +{
> +	int rc;
> +
> +	rc =3D wled->wled_set_brightness(wled, brightness);
> +	if (rc < 0 || wled->version < 5)
> +		return rc;

[Severity: Medium]
Does this code introduce a regression for WLED4 devices by missing the
brightness sync toggle?

During WLED4 auto string detection, the code updates the brightness to a low
test value, but it appears to return without latching it. Looking at the
standard brightness update path in wled_update_status(), WLED4 hardware
requires a sync toggle to apply brightness changes:

drivers/video/backlight/qcom-wled.c:wled_update_status() {
	...
	if (wled->version < 5) {
		rc =3D wled->wled_sync_toggle(wled);
	...
}

Without syncing the auto-detect test brightness, WLED4 might run the
detection with stale, potentially high brightness. Could this trigger false
over-voltage (OVP) faults and incorrectly mark valid LED strings as
disconnected?

> +
> +	return wled5_mod_sync_toggle(wled);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-sm8150-dis=
play-card-v1-0-5c14928cef29@oss.qualcomm.com?part=3D2
