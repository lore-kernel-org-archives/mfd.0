Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118117;
	b=SR90UsOB1qctN2JzteSJDI+zx6+YciZwDouWVwZXhW1uqvHQSaLA1yVBpq36z7T6KijE
	 ZXkeBHzyG6opmU2dRhpIIUdxUOBlaCdsOOz4Z+M36XBwsW7RBQo5yALFLAR3/TifxCG3/
	 wHG56RrlB+Wnyiz6GdPppR1PUMyU/o1F6iBmcDiR5jvtgCs43BspvZg0eiCsbiPlRXKc4
	 IRGxf6CXoIDwUc6cOF/6rktoIzqWTqs4M9KAE4RMXYnCEGnyScL72+NTd0GxgBi1LzQsQ
	 dfmpCaWDaGHxDu5xLNVyhZZZ45FUeDAQVJVf7oL6pCeLzBSmu5KqEluFqIT7qD/k40Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WGMFH53fvXz3fTXe4+RA6dwEuGNwjFllOJfSunpTT8w=;
	b=Rm6JVSBruVUlwXMJnUCQjSroH8dk4Bsw7/ZPSIpGOC03IpPBWdtbuBVlQw8ixLbkonRg
	 cqaZlTfoMBbwu1nkF+287AIJpuL2hxFb0oS5bYkGHLiwML9jrteBvW+eAu786ARy9A3As
	 JPre2ezKcOEI+Hm2l3IKAGimT3BjM1MdQ5LvnEuokvbJErwzyv20N/PoBryBise+ZXkAg
	 JdZEgtOZu8CDmcRrm+2TmR1rUZBa9fQKnXaKhxfV+WWPJ+20gLhkOcbK4LWyzz7K6cqnc
	 UKTHPTLQgYo7nTHOlVUqI4hyQaTWG74Etg1vHoYUruLWtHuCVDUt+U2y4p1ws7C8/vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKGIH43q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD9E606A31D
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 16:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD9E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKGIH43q
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ab432273c5so36786117b3.3
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 09:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118116; cv=none;
        d=google.com; s=arc-20260327;
        b=AXsLcTKvRyAIDGlr2l9jCOhMTToXWyoaxVLLVfGav+UUmR0mpeIueMlTVfaU11PTjc
         mys/rZFEotZG4PpGW03GrvJhLtaFRytLi3xW30E9YPAxZV9H9SEXzx/Xx5Bwl7K70kYv
         ezeFFIRffVb+Ws9tXotsjE4h6zLLYO7eZ0w3VHcAufF4l6kwMd4R9vURGgUb6GQ4ZJgQ
         w6RWT78tC1/No0tzGLN/CZnIt2CMhopE3Hqah9oDFqunZe1cvIYIzfM6kHs4Pl1CrxSu
         neQcAuTb2d7p0GwBkcQOo1SP3reE6Wo9QFcZT1UlcBNH0TjCzGVS8QmS/FXx6oFXSaCX
         oaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WGMFH53fvXz3fTXe4+RA6dwEuGNwjFllOJfSunpTT8w=;
        fh=wzTF5wNK1BR04P4R+INQnhyABnC41805VqmLvhyeF6s=;
        b=s48dyhNKu2dnQsWnur2FL5qsxSIOqQbT+LPWXPbhkCav8Z0ridVDqpnqe9OoTrn0tq
         mVGGVh7btD0yFjVs+WsDQwbNRfenn3pFw26fFGG4jRKkLA4ExHkqvJEbNvdQRwMsbpHc
         8/QN0yfHYEkgvMUA9wdXRomAoHIYeHRMTT1tmju2W4ul9UQD1bLssLSOApdU6Gx+uDj0
         swOlQAPe7OTLWuPa00kPUuAifnVM7gsCKTJOaYqGKspp0wOJU8P6EVm4SgkbuVcUdsAp
         Kf1Ve2DGZVGCXWB1NfRlIziMsXR3lF70T/asyll+kA8mVCBZC1nkMwQGAmUH0/oyW0vS
         R5Zg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118116; x=1793722916; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WGMFH53fvXz3fTXe4+RA6dwEuGNwjFllOJfSunpTT8w=;
        b=JKGIH43qu87mbrriCWX/cSXfuUw8Hup5la3mxBy4NM8YbMXmreOK2gMZjtg/nmhjwl
         xj14c2inwVTupUkCJBhCkcjGlrAaOkvAfcsWWDn4yvZ0uanELCcMUyoA4YFYndTL+BI8
         nCN4YJXX9CA6tru/L/DWWzblTQcTf2GarsAXoAiEyYm1+1hbHGiC9U02WrDUoJi1meUC
         sBoO6etHrb5cclWQ0j11xpu5wdcP/2+5cQ6Rf3XOy5FRLyFW35O9EV4/G+M+Z1K6lpxb
         QcEhItE6gV0rdQjWa5F6JCnbdo3EIcEra0F99CmW1bUpxdXorU7MRpYDrjJ7zop0N814
         VhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118116; x=1793722916;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WGMFH53fvXz3fTXe4+RA6dwEuGNwjFllOJfSunpTT8w=;
        b=C27CmBZGUV2iPMWLGbMMC0Mi6Tgp5fkZ19EjQ+MSM5iXIQfuD2TWvuWaHKvSZHJHNe
         CvX4GfayBtiUlsvW77BeUfepbvTcpAXJborCSR9nWDVpylf3mSH52t2IkUXKaEtoY13U
         ltnM/rm/tXfOkeusqqGiu18GusTf/++RegYH7GPb3Eb0cF+CnQuVly1ysdT7w1wvQ9aL
         bwnu2ns0vQCPIa9w/MYQMxK6pOTm4winXHW0TZe1EDh51QOSYGundHut+X3P6JJ0fLQ6
         1TYO+RjPUXtRRFIU2awVRZ+idsvnMg0z75KMkNSkrlnkYAfmI7aClu9D20PpyJnlyVnT
         wNFA==
X-Forwarded-Encrypted: i=1; AKwUvBzpj3bYEPBLGNES3vuoRChiE64jfl47Sh0wRY9ZbcPPL65RXDUWsdus2xmyYLDDDvKyOxw=@lists.linux.dev
X-Gm-Message-State: AFq9FYIc/1h7X6Oe8+TXlvN4B6OiiqeqNZnLUx9/8ramoGnLFzO1m66N
	BODuDDoJya9NHYyTTT9TJ0U6pycnfHKgYiXdRV8I2qLXPIlGalCS8eh+ohexB+eWzqFdGhf9wud
	a1R+w0l9WynPsx3Xdb6QUYq3K/ju2+gA=
X-Gm-Gg: AYBFou2kmG4OGVPYB6PwaRmjsphEEmqGnX3ghrMSasoq9/ujwEJ6/OJxkl/QhFij5uv
	jNMimed0DVW9NdThwL+teCEpCFMg8zf7/TQohKNvsVSQJwPGtYZUrRlApyegBWqXiiVaJs6qFvC
	NnKEppTxTmwoB5m1bIfj168NSFGm9+L5iob/x1xMQzv8EeXphep8UHoqUDMG6OZQ26i3nIPwhqK
	Lkj9/iOylFziUnhui7CDLdKGn4f9/KALuPuk+ZaJmLDYEqKA7ITH++nnrJNZgQF/gq9izTdRfdo
	dfQiKPvwPHgJy3jjsYG0c+DX8TUlH/5VpiLL2Mhclc+x2xDLU5K0329FW6poGR6RQppSE4yr4ai
	ITpFx9fGrC5bhZLX6Kw2pCDwfmyrA/utWAQ8c2w==
X-Received: by 2002:a05:690c:c117:b0:8b1:2b32:de70 with SMTP id
 00721157ae682-8b166c533d8mr81246197b3.35.1793118114590; Tue, 27 Oct 2026
 09:21:54 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027030803.118131-1-lgs201920130244@gmail.com> <9ef05c62-1067-459f-8dab-2b0fbe70178d@kernel.org>
In-Reply-To: <9ef05c62-1067-459f-8dab-2b0fbe70178d@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:21:43 +0800
X-Gm-Features: AclHuK-kZHn8BsJVCqzCiIghWeJdjN-Oh5rQ_CDaqaySgmTmND5PB2X4wIrP1mU
Message-ID: <CANUHTR82mj-Pj0QzKbrn+nkFWRGQVxBxoinmN6fZETRAPOHPqQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: da9150: fix IRQ action memory leak on removal
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Support Opensource <support.opensource@diasemi.com>, Lee Jones <lee@kernel.org>, 
	Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 27 Oct 2026 at 23:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/10/2026 04:08, Guangshuo Li wrote:
> > da9150_remove() currently removes the regmap IRQ chip before removing
> > the MFD child devices. regmap_del_irq_chip() disposes the child IRQ
> > mappings and removes their IRQ descriptors.
> >
> > The GPADC child registers an interrupt handler using
> > devm_request_threaded_irq(). When the child device is subsequently
> > removed, its device-managed cleanup calls free_irq(), which can no
> > longer find the corresponding IRQ descriptor. As a result, the
> > allocated struct irqaction is not freed, causing a memory leak.
> > The associated IRQ thread also cannot be stopped normally.
> >
> > Remove the MFD child devices first so their interrupt handlers are
> > released while the IRQ mappings are still valid. Then remove the
> > regmap IRQ chip and its IRQ domain.
> >
> > This issue was found by our static analysis tool under development.
>
> So you just keep ignoring and ignoring our feedback. It's just bot, so
> little point to discuss with bot.
>
> Best regards,
> Krzysztof

Thank you for your feedback, and I apologize if our recent submissions
gave the impression that we were ignoring your previous comments.

We did take your earlier suggestions into account and subsequently
submitted a patch series accordingly.

For the more recent patches, however, since they address issues in
different drivers, we thought it would be more appropriate to submit
them separately rather than group them into a single series.

We certainly did not intend to disregard your feedback. We appreciate
your time and guidance, and we will be more careful with our future
submissions.

Thank you for your understanding.

Best regards,
Guangshuo Li
