Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E4623D7DC
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 06:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847228; cv=none; b=rDEQtyqau9ocyUMbZlJsGx+rKwthc63ORVMYsXriAdFDf/DZb8xwzBp25CjcFb8+oFc8lrH+sBuR7jZg25pC4s3PRnaUpbUGpzeEBvaiVBd1R+V2jGlxVf+2hl+0ys0qB5hv7qUvnOc2j0nUZQtUNxrEji4ydq/LI9pTiXhHg8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847228; c=relaxed/simple;
	bh=T+RwHxGnN0nt6HDL43qZVESdJ6RXIKEXVivBz2V7HgE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pIc5IUWqAnox1ykIn1JScIQjHOwSKkd87ubJupy7UnOS9Kop99FiL4eUATfkW7oBcB1QO4TQ5Z6icPJ7tqLvIGkd3JlHfUd3Knq+86Q8sIki9pY1uaWcu8IEFZy1067tSmH8Jgn+9q1nLzh7sLcYd/fvUf75u9TRFx+RjnI8SHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdLE8tzA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdLE8tzA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A741F00A3A;
	Tue,  8 Sep 2026 06:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788847227;
	bh=ZbsTzRf5fsM4AJb3os1iW8ybgL0YtJ0jt5NAlWV44S0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NdLE8tzABEYruQZP8a1mIALHdK/adhDLKqfHnHXrZx5ZOjLPkDPg4J2ajudVV0Iv0
	 Xb3PIovYV91OR3vcAaP+WaIRvj4MmlwZESJ4uUbUO5E2S4GCQAS8BEgFa9OYwWwp+c
	 AogfdAMDVRjJDlf9rR2wLdSjdGF17qJb+hbnQgWG/zImiDFHiVIz5nVWPUB4rPS69b
	 zCM1ryqOhTRZUuFOFsaIjY8LVpiLn0pPCGHyzOHE+uZ7WGRohIlTwh+AKCOBffypuT
	 A1T0LsFTKAIhWt8q514HgiIO5o/fWA6dnLB1e9k+LKsuiPjAuhbzDXXoJE3qcQyw1+
	 a/6nbd3co/I4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mfd: wm831x: Fix typo "convertor" in comment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260908055340.22241-1-hemanth.selam@gmail.com>
References: <20260908055340.22241-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 06:00:26 +0000
Message-Id: <20260908060026.B6A741F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but memory corruptio=
n can occur due to freeing a list element without removing it from the list=
 in wm831x_auxadc_read_irq.
- [High] This problem wasn't introduced by this patch, but a broken polling=
 loop in wm831x_auxadc_read_polled causes premature timeout.
--

commit c4685699a90d5d341f26100b93279945ad18d7cc
Author: Hemanth Selam <hemanth.selam@gmail.com>

mfd: wm831x: Fix typo "convertor" in comment

Correct "convertor" to "converter", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt. Only touches a
comment, no code changes.

> diff --git a/drivers/mfd/wm831x-auxadc.c b/drivers/mfd/wm831x-auxadc.c
> index 6ee3018d8653f..94b8d24611e43 100644
> --- a/drivers/mfd/wm831x-auxadc.c
> +++ b/drivers/mfd/wm831x-auxadc.c
> @@ -138,7 +138,7 @@ static irqreturn_t wm831x_auxadc_irq(int irq, void *i=
rq_data)
>  			1 << input, 0);
>  	wm831x->auxadc_active &=3D ~(1 << input);
> =20
> -	/* Turn off the entire convertor if idle */
> +	/* Turn off the entire converter if idle */
>  	if (!wm831x->auxadc_active)
>  		wm831x_reg_write(wm831x, WM831X_AUXADC_CONTROL, 0);

While reviewing this file, I noticed a couple of pre-existing issues in
the surrounding code.

In drivers/mfd/wm831x-auxadc.c:wm831x_auxadc_read_irq():

> 	/* Enqueue the request */
> 	list_add(&req->list, &wm831x->auxadc_pending);
>=20
> 	ena =3D !wm831x->auxadc_active;
>=20
> 	if (ena) {
> 		ret =3D wm831x_set_bits(wm831x, WM831X_AUXADC_CONTROL,
> 				      WM831X_AUX_ENA, WM831X_AUX_ENA);
> 		if (ret !=3D 0) {
> 			dev_err(wm831x->dev, "Failed to enable AUXADC: %d\n",
> 				ret);
> 			goto out;
> 		}
> 	}
> [ ... ]
> 	list_del(&req->list);
> 	ret =3D req->val;
>=20
> out:
> 	mutex_unlock(&wm831x->auxadc_lock);
>=20
> 	kfree(req);
>=20
> 	return ret;

[Severity: High]
This isn't a bug introduced by this patch, but memory corruption can occur =
due
to freeing a list element without removing it from the list in
wm831x_auxadc_read_irq.

If wm831x_set_bits() fails and jumps to the out label, the dynamically
allocated req structure is freed via kfree(req) while it is still linked in
the wm831x->auxadc_pending list.

Could this leave a dangling pointer in the pending list that might be
dereferenced during subsequent calls to the interrupt handler
wm831x_auxadc_irq() or other wm831x_auxadc_read_irq() calls?

Also in drivers/mfd/wm831x-auxadc.c:wm831x_auxadc_read_polled():

> 	/* If we're not using interrupts then poll the
> 	 * interrupt status register */
> 	timeout =3D 5;
> 	while (timeout) {
> 		msleep(1);
>=20
> 		ret =3D wm831x_reg_read(wm831x,
> 				      WM831X_INTERRUPT_STATUS_1);
> 		if (ret < 0) {
> 			dev_err(wm831x->dev,
> 				"ISR 1 read failed: %d\n", ret);
> 			goto disable;
> 		}
>=20
> 		/* Did it complete? */
> 		if (ret & WM831X_AUXADC_DATA_EINT) {
> 			wm831x_reg_write(wm831x,
> 					 WM831X_INTERRUPT_STATUS_1,
> 					 WM831X_AUXADC_DATA_EINT);
> 			break;
> 		} else {
> 			dev_err(wm831x->dev,
> 				"AUXADC conversion timeout\n");
> 			ret =3D -EBUSY;
> 			goto disable;
> 		}
> 	}

[Severity: High]
This isn't a bug introduced by this patch, but a broken polling loop in
wm831x_auxadc_read_polled causes premature timeout.

When the driver falls back to polled mode, the else block unconditionally
aborts the polling loop on the first failure after a 1ms delay. The timeout
variable is also never decremented.

Does this structural issue prevent the while (timeout) loop from actually
functioning as a polling loop, unconditionally returning -EBUSY if the ADC
takes slightly longer than 1ms to finish?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908055340.2224=
1-1-hemanth.selam@gmail.com?part=3D1
