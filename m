Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF3A347533
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 05:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757375; cv=none; b=hTBKU8w2RTRMRlrcHWz9feD9rTjkAhsqQoXK0skLNWrIPLKG84hNVQr2R1H+9uPBd+HskTWlp0L52kedd650YADNocmpdxGG3+IA1WAMI9n0WVcD7/VTCjRoAkrpjRNoxv+LfstJP7nKyd3TleTrYgFZBpX2zHjs/dPKtTEhIfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757375; c=relaxed/simple;
	bh=OiFGlswaVY8Ue7sSMl+kvBbOlIEoMbSiPfW3hD8sEsI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GfqFXHpKIIWh6UB2cAtRqFYs89qj2VM6hiXSSpyYknj3xOn6plHqk2SdhSU1bHP07T2+E53CA21p3baqsToxXCBL8k1U0Ck5Ot7uXEQId1SfTVxgru2d0HAFM1CP2FR1en1GUmk1a9XzGmTVlvugW1Qxt/SlrHlN8WecpMF7Qdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTZZKygy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTZZKygy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B651F00A3A;
	Mon,  7 Sep 2026 05:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788757374;
	bh=tm12X39vbOhBtA697uriuRThlJfibtODrq6tAmjho9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bTZZKygyeDxkOS6Vne7zoBdDniDbYBphQAk/m5tVjhKmLjN3TBffcdq2QSHWWiMsJ
	 9d7Ao1/7sLcbaPTTcigl4dK/h3rtQ+AVmQxLK29wC2Js0sWkxMp77t9tsfFTp3ZJ8q
	 643n+ia4apT3/1jgDvZsHhC6YR4gmuYCBzTet1JCDRd024GtnJ8RzeJNoXJy8/OIi+
	 rD12TrOUqzGNPMPRvxam8BiCjTDT4HrpLVbtm5kraD/83Ml5xHL+2IsPi8tL5sn5bD
	 F+/1Au3JAOsc7obFUEUWWU7IEtxAez7wdiERh2E5XghSaP/UkmeOPHgIB7GH3X4wX9
	 Bmlt1dFlgPTdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] mfd: wm831x: Fix typo "convertor" in comment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260907045331.16932-4-hemanth.selam@gmail.com>
References: <20260907045331.16932-1-hemanth.selam@gmail.com>
 <20260907045331.16932-4-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 05:02:53 +0000
Message-Id: <20260907050254.43B651F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Negative shift count in `wm831x_auxadc_irq` due to missing validat=
ion of source field.
- [High] State leak on error path in `wm831x_auxadc_read_irq` causing perma=
nent ADC deadlock.
--

commit 50c01f2e8806d70971e1f256c73c3a0a948552c6
Author: Hemanth Selam <hemanth.selam@gmail.com>

mfd: wm831x: Fix typo "convertor" in comment

This commit fixes a spelling error in a comment within wm831x_auxadc_irq(),
changing "convertor" to "converter". No code changes are introduced.

> diff --git a/drivers/mfd/wm831x-auxadc.c b/drivers/mfd/wm831x-auxadc.c
> index 744e1d161c5a7..6280d4f389815 100644
> --- a/drivers/mfd/wm831x-auxadc.c
> +++ b/drivers/mfd/wm831x-auxadc.c
> @@ -132,7 +132,7 @@ static irqreturn_t wm831x_auxadc_irq(int irq, void *i=
rq_data)
>  			1 << input, 0);
>  	wm831x->auxadc_active &=3D ~(1 << input);

[Severity: High]
This is a pre-existing issue, but I have a question about the shift operati=
on
here.

If the hardware returns 0 in the source mask field of WM831X_AUXADC_DATA (e=
.g.
due to hardware malfunction or I2C bus corruption), the input calculation:

	input =3D ((ret & WM831X_AUX_DATA_SRC_MASK)
		 >> WM831X_AUX_DATA_SRC_SHIFT) - 1;

evaluates to -1.

This would result in attempting to bitwise shift 1 << -1, which is C undefi=
ned
behavior and could lead to memory corruption, kernel panics, or unexpected
register modifications depending on the architecture.

Could this negative shift count occur due to missing validation of the sour=
ce
field?

> -	/* Turn off the entire convertor if idle */
> +	/* Turn off the entire converter if idle */
>  	if (!wm831x->auxadc_active)
>  		wm831x_reg_write(wm831x, WM831X_AUXADC_CONTROL, 0);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but looking at the error path
in wm831x_auxadc_read_irq():

drivers/mfd/wm831x-auxadc.c:wm831x_auxadc_read_irq() {
	...
	if (!(wm831x->auxadc_active & (1 << input))) {
		...
		wm831x->auxadc_active |=3D 1 << input;
	}

	/* We convert at the fastest rate possible */
	if (ena) {
		ret =3D wm831x_set_bits(wm831x, WM831X_AUXADC_CONTROL, ...);
		if (ret !=3D 0) {
			dev_err(wm831x->dev, "Failed to start AUXADC: %d\n",
				ret);
			goto out;
		}
	}
	...
out:
	list_del(&req->list);
	mutex_unlock(&wm831x->auxadc_lock);

	kfree(req);

	return ret;
}

If wm831x_set_bits() fails to start the AUXADC (e.g. due to an I2C error),
the function returns via the out label.

However, the active tracking bit wm831x->auxadc_active |=3D 1 << input; was
already set and is never reverted on this error path.

On any subsequent read for this input, the code sees the active bit set,
skips enabling the hardware ADC, and hits the wait_for_completion_timeout
forever.

The interrupt never fires because the hardware wasn't started, causing a
permanent functional failure of the ADC channel, coupled with a 500ms thread
stall on every subsequent read attempt.

Does this error path leak the active state and cause a permanent ADC deadlo=
ck?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907045331.1693=
2-1-hemanth.selam@gmail.com?part=3D3
