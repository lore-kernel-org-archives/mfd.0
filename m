Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BC240A940
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779318; cv=none; b=iLTxsmJSCw42zLxjhAY64QY8w9+vzsYwF5zHoSdD7MsWE8Kev7zlmDFfsILgCVKi1OMidE8AbUyeCoCanRUZqH2q2v/li24H/3ViC1DcE0J3WvSgrBdiNq+u3cnoahwUIScoepk1DYrr2W+ZREsZfcxhswK6WnyOOzE1Ed7Gph0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779318; c=relaxed/simple;
	bh=qz7YCBMeFmwfqIQRWfN+FmRZ72NOsmo/ZZAIld/ipvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HBxrfIh+8goSYcJ1oh3Zdfh34wrCyjVmy9A3/slVo4kNXhtcseQjnMJMe/RvmMJqTt4W9PxCwK6VxqRnoJhRNSuQsHYhkvEtols6HHihaAFEurHd2yIxXuXRXY9Vj/WqgatGvwyXvJ7f0D5EzCHSzxlD1fEQkgFGhD0mBUZOk04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UubzTdZB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UubzTdZB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso20210905e9.3
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785779315; x=1786384115; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnDKjAsExIlIO6cGLAGlNzQp1IiRGZFjDF5mAKUFBPE=;
        b=UubzTdZBwfbbJpeWd+vhACYFp7zXm0+Ab+MkyJnWDIC0vzUG5vTFrJA1nzCXXued42
         4H+JDI+uxXbZSdZx8VIBbJ7CwBYUD9Qk4D4CujULp+sNOmkVU/yetYT1ypzQh6Cxmi2A
         y1I8MGP2YKm49RXUdrmtaso/NMpo+t+f+RzS2xWepvKTMa8poFq7006NdTHiKubniXtg
         BG8SK7N/aHVhQfkiTz7Rb12ys7B+0c1QYnP2/XpnpvvzsUDzEkXrqQuYXVr8aJOxZWqV
         D0V9j6fha29UJlpdnIPYUgj6V3I1E25uM5zVGlxizwB++zJJ0zDUMMeJxkKXRIeVcz90
         EtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785779315; x=1786384115;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnDKjAsExIlIO6cGLAGlNzQp1IiRGZFjDF5mAKUFBPE=;
        b=VHvlFtyc3u+SwHWUKr6m9/OQdiJ0RO7fjXWOWqmsD9MFjiECGDrbY1+9gjlWHBba8w
         2fOfuQSW2LwzncgoXwS8TZ9xzEcG2QAieoGNmUU0lfdpZJfLjJedCTRw7FVz5T6ifHvX
         TmaFYxbMm22zmmEIjOi3LCKZk51s9on1x2tLJdwBQXYwYReEJTGLhZd9KpcswxnV4Tol
         Jj3oLGLOhVbE7JJNs6naSEHuw+mpT3YXkXq/pJ8RGIFgUUoJNPUrGgi/rSjA5cHVgFbm
         tCiFXdyc1LKk5SftvRJcKjiXO2X6Yta2duvg0P+w4QIK8wof7oTKOMCmw5CPpoxbyet4
         zddg==
X-Forwarded-Encrypted: i=1; AHgh+RoOZxY8YJxWzr+D8T+fNJbDv16oNiHWU7M+hFn1DEov6TcYMEhNzrp4aS90lTvFjg4sxkM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk03ef2s1fn63itT7F4LO04sEdQkF1FDIl6d7kZ0OG3ZfOb0dU
	1IrZRE9ho4tPzsTGGSgaCv28N8l3NBb577zZbYD0aBErvTPM1QiIhOjT
X-Gm-Gg: AR+sD11D10Z1cMrByeAAdH1UanOhqgpTQ6iKcoCBvoR/VBu2TjRC8/z955+0HyHG0fW
	AOwupQrg78fNIcN7f2M3gTOQP+Yt9WkixwDBo+ReGnOOYSjsNLCSYv1frMGZKhmgmnu0ZdeshCm
	Ev8wzhbZJJKfrzT2uc1++HdaEF1Khg9q7f65jJl6qG9HyapqirnVJX88VM0gCx6IBG4POoIHr0C
	UcXPqv75M8K2/tMNntOk+NDoodwepv270tREq7YYL7bzOKVzn97RyZwZ8N1J+dyYj0ucgZ8+IFE
	61EHR54TLqXXCiGXCb88Vs2LM855YMrpl7DJXPoEJuH6njpd+Ud3eL32SOcDzFE2YuFw24Rd8LD
	tA71e0zzMt5Bv4gPlI81wJa7AbEkp2JAqavTBOGjAdMX8IfBNR4ir6AhtqeIWWZQZiCxSUbVP+B
	2b0NytK+GTxH2QSqzHjUL+kUKQEisvo3FETcJ7uQaa64zLsSgVhAmgY6e6UXTF0hf0LSjqeYKI9
	w==
X-Received: by 2002:a05:600c:314f:b0:495:4572:21af with SMTP id 5b1f17b1804b1-4980c673252mr206970055e9.9.1785779314611;
        Mon, 03 Aug 2026 10:48:34 -0700 (PDT)
Received: from strix.localnet ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5b4a2sm295532795e9.1.2026.08.03.10.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:48:33 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Date: Mon, 03 Aug 2026 20:48:18 +0300
Message-ID: <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
In-Reply-To: <anC72Cf1zKcLYWlC@redhat.com>
References:
 <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com> <anC72Cf1zKcLYWlC@redhat.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartnWZPMUIwR7W-Gw2dYxPvgg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartnWZPMUIwR7W-Gw2dYxPvgg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Date: Mon, 03 Aug 2026 20:48:18 +0300
Message-ID: <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
In-Reply-To: <anC72Cf1zKcLYWlC@redhat.com>
MIME-Version: 1.0

Hi Brian,

Thanks again for the review!

Am Montag, 3. August 2026, 19:03:36 Ostafrikanische Zeit schrieb Brian Masney:
> > +	/*
> > +	 * Sanity check: Make sure all parents are there and write a clear
> > message rather than +	 * leave potential orphans.
> > +	 */
> 
> It's not common for clk drivers to have a validate function like this.
> That said, I know you are reverse engineering what's in the downstream
> BSP without documentation, and there is value in having this. I think
> it'd be useful to clarify that in the comments because code usually gets
> copied and pasted between drivers over time.
>
> That said, once it's verified that the clock tree is correct, can these
> checks be eventually dropped so that this validation logic isn't ran on
> every boot?

Yes, I plan to remove it eventually when support for the SoC is more mature. 
It has saved me some head-scratching as I have been working and re-working the 
clock tree. I'll clarify its driver specific role in the next submission.

Another option I contemplated is wrapping it in #ifdef DEBUG. What do you 
think about that?

> > +struct zx_clk_export {
> > +	unsigned int priv;
> > +	unsigned int binding;
> > +};
> 
> Sashiko flagged this as unused.

Indeed, that is a leftover from earlier - before I realized a simple unsigned 
int[] does the job fine.

---

I have a long-standing question about tristate/module support for drivers like 
this: I don't think the driver can realistically be unloaded. I have been 
testing driver unloading by removing the UART clocks from the DT (otherwise 
the clock driver is busy) and marking all clocks critical (otherwise 
unloading/unbinding will shut down the UART (and more) and lock me out of the 
system).

I have made it tristate because from early research into clock driver state of 
the art I gathered it was desired, even for drivers necessary for fundamental 
operation [0]. Did I understand this correctly? It also uncovered some linking 
errors that weren't obvious when compiling the driver into the kernel.

That said, I'd prefer to mark my init tables discardable with __initdata and 
think the module load support is going to go untested and bitrot over time.

Cheers,
Stefan

0: Chen-Yu Tsai's tak here mostly: https://www.youtube.com/watch?v=d1VIAnVb3hI

--nextPartnWZPMUIwR7W-Gw2dYxPvgg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpw1GIbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi7TkP/05WuGUn0opY7QQ8sZB6
OuKTG5SinWEzjuroAKgG/nD8WOveL+GRtp0cJ8+CUdvw0WpzZQeuRnSX/zDbSvXa
2G3pIBOvMcd0MOBBaEHUAtOHArZybsIuoFTVTzsaAYyHf2B7cc7KVbJZWRztmYSH
Z/OUYaxPHYoD6cHC4FlSNHyJplDqLj0LpgZOwY4zP0jaWLbEJpkCTK9Izl+ZIB4N
Q15I4WFfnyUi+J+3/mM3Rl4UYrS0U55ydarl5Io0PUsY/ORocxQY7jhXTvFyVmGV
xEythQnLVsvYici8F6d1tA/VcdG5jbo/JxRgrG53yGGuZX7x31CampUCrUOJRJ7t
bMsQwZz/VwpxL11Pg92G9bI3mzCHb+CZDRLT5zh+DN8cOkF5u4GBnI0CPKaqFAdw
deFt0WVnrrosFn0Vf0p17OrTiycj+f72S3L97DLCiH+0A02LR5XC6rxe5ia0xsFj
zXVl/z67OSLLN+g00eH/Gm7t6wSmRHdNY8QYBxaoIfY7NSPC4sfAm0BPcRfOtHEe
aN2QkZlUqy6LOPzLMKJXsVo1oXp94QXx5YgJpObLC1OH2GasPwX+teqCVXGyJZpt
we0fT64SnRaq5A4TfIcEcb2QJZUmH6znzcgROxCXZIJ1Dla1nW0ASQlNw2z5btj/
bbygfsidb6/n+WxVmEd5JJI+
=Lf/s
-----END PGP SIGNATURE-----

--nextPartnWZPMUIwR7W-Gw2dYxPvgg--



