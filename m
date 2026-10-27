Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793120195;
	b=q3KGq+vGbNEQgewPooE0hQVxARlOsrxxvH/QesL10Jd7QT9W3o6PN0REk0Q1DRZ7Vm8a
	 SsYop63khfcl1X1AvfuR+KT/YgJVHtBj3c1hrSOxhxqdVqKKtygkFFSEYgv65rqFuJtv7
	 3L5T79yXAR6kJijYgm4vVHwN8MviWK+nhkdwXxeWzqoKPJrQ2aN3c57Ikn+nTspFsjOZQ
	 YJbAmmYz8bzTNk9XMHQIvsjORbr1F6LqxppNTo9Cs0mth2DlA4McFBJ+lE8AyV9mgCsNh
	 XI5Koi+D57T767qywq2FCHeJe2FxNWPNsfixOQ56xd7oXW+xGlvu2NciOyA67D5O03w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uB/WSwKdSMSQP83dSeSWNnrK5HqaR1ZK69IbSUsYxlo=;
	b=Oq4HqvG3j08vHQjpEclqTvY0KZwfqmJJu9vzG9mRcFCx+UczO8bfsXSqib+ygqLasvWZ
	 bJwf9Xk1PG5PQX2Ad3dhndM7hwa8gnMHz6ddne1frwJtWqhhBK4nv1NeEUR49hRj13uM1
	 QzIr6HQWSCqDZKblym15QMV7Xm1Wnd2h5M0ZAOp9npp4nXWjSwQF+OItdj+GZU04Hz0xu
	 v0FC0/Ifnfkh+fup1YOsZNGaURwkmNDw3lueWKz7NTbrps8KU5XL8/oTsg6QE1DUbHCu3
	 QpQaitYRhi2m1SqDd01omA5N1Jr7T9ITSHvAL8N4EvzYWNYjOnWDXllEjv4x/PYFf6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vPHuim7X;
	arc=fail smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AD8606A321
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 16:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0AD8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vPHuim7X
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-679a2b5fe87so61761d50.3
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 09:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793120194; cv=none;
        d=google.com; s=arc-20260327;
        b=XGpxZtA6rBjspXBJG0mAP3MbIAyF7YVN2KBMkge4eZ6DQC403X6DtelQDu6TyZ6JQk
         cfUTYA0VEWBitaSCk0bYHpZeWPyVzoeDw8COlExrwgqV78pjKPD0PKGb25AJUoXTAcLr
         vcG6v2BhTtQvfaaMQUMEiLQaGYK1PXEhA+cBKpQQ8ghjuQxSXo94CcqU/17GHeiKK3Pj
         BvhbpW0J/1fTVFrM+FW2CCSGpZ4VVSkiG3qdRT2ffxsMIrZkcIe8DOwziQHz2UjGonHI
         IaIO5Z7n2CvUvp68hSZCJXiZkXGLyUrXAfk18dN/oMHRYTIUQSBjR5rEjBv9jltBXJqx
         DOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uB/WSwKdSMSQP83dSeSWNnrK5HqaR1ZK69IbSUsYxlo=;
        fh=SG5y0/omCINF/kf1wto/xS7ZhyBy2I7HseSXVkJwE5I=;
        b=TCpR2WRMdMRgwm7II6KqrXztjmc7s22lIUbtABLks5hiA+RU3cNaX3zDmeifrOeyf0
         lYxbhvj+VLiGGwKWy9FRnYnyZkSY2hFBR8J4hnauF9xHZMsPdb/yyNhmzvN6mB4Hz0Zd
         3E99GhhBOgpqGUI/x12VcIAZaOs3wVI2Eb60k0EQLt1uugj92wc3uY+3f02mGCPFBh4M
         NhbtChQB1/LboFniT6saHWI4vP5MaV0EPPn81hu0yrG0YI9iY5+f000qf8k4ENZaWG31
         kE4go8Q5Z7WvEou+w90hfiQfcxq7dY/erHiXh1DqRQzGntZx0lTi1dFd46NEudK4Qrka
         9zag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793120194; x=1793724994; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uB/WSwKdSMSQP83dSeSWNnrK5HqaR1ZK69IbSUsYxlo=;
        b=vPHuim7XQhub0+PfryKsSdVSJNn1LR6HXqRFCS6+oBuMAndPHPwagnwWTBN9egL4BQ
         oBvKNQZxwRfQ5npuf7XLp3ZZ9+XYvpPgpiZEMCr2vUU70x8FhgH0l08+8LYbJyPBGpUT
         YFaVw3x/RjROnOGEhzulMK+d7yHLpmxhU5vJwHCvYWMy43kn7npRTO82Cov3l5mnS9MB
         dck3x/VIknD4MsRNdvHjOvrtU6YAFsNXEGoy4nQsXSJRZjx7tPSwBLso1DlcPNmV/kWC
         Zf4wm+pd6bPnPazTRY0EbPLHj8GioTf27bFU8wenpr0ReC7oqLeveuoVXHDBl8hJdeAr
         ra1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793120194; x=1793724994;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uB/WSwKdSMSQP83dSeSWNnrK5HqaR1ZK69IbSUsYxlo=;
        b=ZH3OqpjT5gLSrlZx4a5JC+v22wDpdHf39BKdiW6PpAw6qxv5x8ziiblW6jIfIQMrg/
         FJhoPbAaYCe6Worj4bHy6P2gPIg9CAxm/MNXoKfHJdJtNSIQzuAowxVVqgfhzA4GJipI
         d62jUtHtDwPovwEIMHOvIkB80YPEClZ3c8SFqT8YCeT5FbBrWrAzJzOAwg1jAaE29uDE
         BY01V+OnjVBzoAPtQR+ZEZM7bV8pj7JbMcF2rd+VMInalaxPyNUyJIZJoHH/cEYw5Jkz
         t3k9cxCzm5JB6gzhPik0RGbFJCdkfrd8nLuU81WSqatB8MtQz/aCSluwN+UaoYz4yAFe
         5BFg==
X-Forwarded-Encrypted: i=1; AKwUvBzyUDg7YjouViqxZaTw+2Q1q/aojOvfV09GZXawRrJIk+fn+zqIez+XY7TAyjgpugcADjs=@lists.linux.dev
X-Gm-Message-State: AFq9FYLhW9NZNL4CshpPkqNt93xbP//7QUaGqNDF5z67WzQ6hCpcXFnL
	Edl87yPOCepXkcgw/tydiS83f/OTA+WDW8Q1MFQWXGUduereFggkMqyGJ16ssu3tcDRJG01oH7o
	rFjLZ1JqoCJnPUw/gRReiiA8LQHx3oas=
X-Gm-Gg: AYBFou3e/qax9lc+MkKF2QaqGtHiaLv6vMm8EEykrv++GqXHP+h6I2kQf5WcQR0r+ya
	bkj88bk+cPHE8JRHDuTszIbi36cjlHDMswT3hnCEcKuOANe8w+CqusqFFUpXztKYbBgnzP1uNfc
	K8Bh4fCi9MSD/XLL3QO4urYlnyI3NNsZ08vB10DBKJy4wZ9tqLbDnPBRByvJbhiLA0805eSd6bl
	E+rXlQb+7Tfo4u+tCLagYqKVyOamopRYCohkFNCE66p3FDZAyKCGdAjhgF0kKwHdYDXCBtUV8Ml
	gwFs5BAdlYUTyZcanGkLEVQ6TH6e/Nn3Xa1VXV6HtcxeqQqP8sWd7wvYBGZljFr91Jof5vy2lfb
	tfNg5GQB2yJswsAiss8WbaexSQ1X1YxsOpnMxXA==
X-Received: by 2002:a53:c092:0:b0:676:9578:672f with SMTP id
 956f58d0204a3-67a7bd3d839mr38638d50.135.1793120193486; Tue, 27 Oct 2026
 09:56:33 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027032609.119226-1-lgs201920130244@gmail.com>
 <f342a5e4-82b3-4044-85a3-10cad08595e4@kernel.org> <CANUHTR-SJTiQvo__wbqosSQV958fkHGY33YTRFor2=EwDTdXPg@mail.gmail.com>
 <585b45bb-a9b8-424b-abd4-66d53076b501@kernel.org>
In-Reply-To: <585b45bb-a9b8-424b-abd4-66d53076b501@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:56:23 +0800
X-Gm-Features: AclHuK-GfmT7NjkDsFJqpYDLgkQ0C0xdaJPsVN0W4Sw0aag8wcbtxfBX0j2KDkk
Message-ID: <CANUHTR9u0CMsRWj12EN-b47BazJ8Gjk0yvRHfe_G-BEbrJgGNA@mail.gmail.com>
Subject: Re: [PATCH] mfd: twl6040: fix IRQ action memory leaks during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-omap@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Wed, 28 Oct 2026 at 00:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/10/2026 17:22, Guangshuo Li wrote:
> > Hi Krzysztof,
> >
> > On Tue, 27 Oct 2026 at 23:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 27/10/2026 04:26, Guangshuo Li wrote:
> >>> twl6040_remove() currently removes the regmap IRQ chip before
> >>> removing the MFD child devices. This destroys the IRQ mappings
> >>> before the child drivers can release their interrupt handlers.
> >>>
> >>> The parent driver also registers READY and thermal interrupt
> >>> handlers using devm_request_threaded_irq(). These handlers are
> >>> normally released by device-managed cleanup after remove returns,
> >>> when the corresponding IRQ descriptors have already been removed.
> >>>
> >>> Consequently, free_irq() cannot find the IRQ descriptors and the
> >>> allocated struct irqaction objects are not freed. The associated
> >>> IRQ threads also cannot be stopped through the normal cleanup path.
> >>>
> >>> The probe error paths have a similar issue, as they destroy the IRQ
> >>> chip before the device-managed IRQ handlers are released.
> >>>
> >>> Remove the MFD child devices first, then explicitly free the
> >>> parent's READY and thermal IRQ handlers using devm_free_irq()
> >>> before removing the regmap IRQ chip.
> >>>
> >>> Also update the probe error paths to release successfully requested
> >>> IRQs before destroying their mappings.
> >>>
> >>
> >> More of postings by bot ignoring any feedback.
> >>
> >> Best regards,
> >> Krzysztof
> >
> > Thank you for your feedback, and I apologize if our recent submissions
> > gave the impression that we were ignoring your previous comments.
> >
> > We did take your earlier suggestions into account and subsequently
> > submitted a patch series accordingly.
> >
> > For the more recent patches, however, since they address issues in
> > different drivers, we thought it would be more appropriate to submit
> > them separately rather than group them into a single series.
>
> How this that differ from last time, explain me please.
>
> Last time you sent x separate patches for subsystem foo. I asked to send
> them as patchset.
>
> Now you sent y separate patches for subsystem bar. You keep repeating
> the same.
>
> Best regards,
> Krzysztof

We did follow your earlier advice and submitted a patch series, which
also received feedback from the maintainer:

Series:
https://lkml.iu.edu/2607.2/05103.html

Maintainer replies:
https://lists.openwall.net/linux-kernel/2026/09/28/2917
https://lists.openwall.net/linux-kernel/2026/09/28/2932

However, you're right about this batch. When manually sorting the
patches, we failed to group the related fixes into a series. This was
our oversight, and I sincerely apologize.

We'll be more careful and submit the related MFD fixes as a series in v2.

Best regards,
Guangshuo Li
