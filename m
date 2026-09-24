Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A1D42E407
	for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235008; cv=none; b=cdv3cyIRwf7VS6KmGXtI0onex+SZ7ilt1iAtT6Vt/D9u1mKLX5FEZTu/oTI4UKwnUTdvRziNKGJ2OqO48piswsqAE+DoRzirRypFga5pdXDyFbvw+l4PtuS4dxqg3ardHb8B6UPSItPJwkdzb4KjS3yHierd6Kr3F4ibhXto6qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235008; c=relaxed/simple;
	bh=uLnagpfUFVqNy8Hx6YY4OSsrTwJNd/dKrsdS6zcaC5A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PcET60rYbAmzh93CW1+G5Ff4vF7dzBUu77HyC3CclBHU3dBYfA4TQ7GnebdQ9YX4Sn35eiICHCRuCOyP4ZZEQnr5JEBv1rYncBMLWHLneuhnCkvD80sa0U2YowzQ7N4fdo2gmc/L7Y/LAvZX3k6glNLFs0HDnGwovDXL4wkN2K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SRg6J+36; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SRg6J+36"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so9627595e9.0
        for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 00:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790235003; x=1790839803; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mdc4xxWsL55mn3imyt0LizMFSY4UfYvhYLzlk2F0w9U=;
        b=SRg6J+36/nRM4m0GR5qI35hkD0hxn2MklI+pkebxguqw/RcJkUTcc0RDEyc13EZ9t2
         snRv2XYGrAEVFN/0C0fwcYCkcu+PFx8rRytUaxIWtvNyDJVAb8uwDpNzJwI6gTVFjZfo
         WCHpk/effHDE4QyrRF6DqBHTSBO1UM4d07ak9/lwQrHhdUp6RysYIS+FgjbNtNmzvbNc
         De5GczhoY8ULPMYT4/dhZM+kkkzgqx2cxdgOUei8lOltAjfCgZRMEDm6Lwu74lYGH3eF
         O6QIQ/Upn3PN8cfl1+rVHBqZOjrtTbwRUYAjCNpP+dzadl5LzGZbPVmyAq1G0mYpqB+z
         4j3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235003; x=1790839803;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mdc4xxWsL55mn3imyt0LizMFSY4UfYvhYLzlk2F0w9U=;
        b=xoq0NxQa/yGXHyoznWSyVQkQQq1rlVaRfPyN8BoLnSjTPPQJ1TOD2aZ1FLmwOLyui1
         i/uiK8w92BFVTp2SeqlapgLQav/bFFac11V9paiQQS6Pj7g8pOH/5hgesDSHZ90SDZQK
         ziADfhyiCNB/327p1mE6ucj86kIAXKbTzrSY4H2tbFZs/F6vKCqwBdGRkI9CDD1HOVfM
         Qb241KodJpGvXgP/jL9+aK5kvGtKE+MXkj3j0Z7Xmp7KKhTWbko9hPFyZr4ZjBWyIM5w
         fUKeoXW9qyFqSJVR61B3jUJkCViKjli4ELya7NO2epM289kgUs128F0fYHFJoL5dtKOe
         dsJw==
X-Forwarded-Encrypted: i=1; AKwUvBzmDMj0c5gZTaVAUzcC1gDFm6c8Qb0yqy2LXH4smaqTG80W/mgLH8ltWZfX3h/PWYSyxdY=@lists.linux.dev
X-Gm-Message-State: AFuF++no0/tS2IZi+Kvqnx5IUnxbh7K3GOR1izSFyaLrvdZMnq+tf58A
	7BmAs0fceXOvImqd3o1nE0pkXjcA0XilOyGsvt+ENp0KkRgAX2rLQcwIk1G2Kd9+GzU=
X-Gm-Gg: AYBFou0YvKHzcjyY/P5I22uf5rseKZrOrhWb+HAcTiz2XHkAde08cudvQ9uKizoXqBl
	8+TzdKFDvspRxo1L6khcuJwcEWQB9Jnn2WdeEnhaT/vy9Ra6HXB3xcWHb472hDEQJshWBsfj4W6
	3T01bPB0cjsdbLb8fkmE+Oh5cFRg4oE+69okRdb/FRZtabjB0rqK4Dod11e5VeA2ucyiGR4w3BU
	Zcm/7KR5quMP4lhra5kRAPyLTstc3+PV/1tR/tO0tUzj31Vh8UABBXJAVRAC2xNvonigNkZMwqe
	Nm6BkAmi4ZjzS6SKA7EHgusTNUPfJxD8D9ywjHp3pcXSu7q5v4E0FX54hwAexFOT/CgiWBUex9L
	1j1KwBdjWP6d3urRzIlTEeH38YGujj6Y/1ab0l6XK+9fusmiHB/TLCNxJEuiqW4YcDROSDx2alK
	BR8YWr1Lxj4Gpd6XI0CUAdBawvSulRlkPcf1Hfloi7AtOElQ5cNIcIzWQ9yC2ZbbrUleCF5wrj9
	gGkXjbtan/lcxRz3w==
X-Received: by 2002:a05:600c:a47:b0:49e:823a:9dec with SMTP id 5b1f17b1804b1-49fe66c892cmr22336635e9.3.1790235002814;
        Thu, 24 Sep 2026 00:30:02 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bae43dsm45721935e9.5.2026.09.24.00.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:30:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alex Elder <elder@riscstar.com>, Brian Masney <bmasney@redhat.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and
 reset driver
In-Reply-To: <7147ce22-fc6d-4cff-9470-98e341da0a87@riscstar.com>
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-4-elder@riscstar.com> <arG238GS8bMB6DkW@redhat.com>
 <0785235b-de06-44d4-9068-ec706eeba848@riscstar.com>
 <1jcxu3adn6.fsf@starbuckisacylon.baylibre.com>
 <7147ce22-fc6d-4cff-9470-98e341da0a87@riscstar.com>
Date: Thu, 24 Sep 2026 09:29:56 +0200
Message-ID: <1ja4p79kej.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 23 sept. 2026 at 16:33, Alex Elder <elder@riscstar.com> wrote:

> On 9/23/26 3:58 PM, Jerome Brunet wrote:
>>>>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>>>>> index f9592fd9ec2bb..50efa10d48450 100644
>>>>> --- a/drivers/clk/Kconfig
>>>>> +++ b/drivers/clk/Kconfig
>>>>> @@ -292,6 +292,17 @@ config COMMON_CLK_S2MPS11
>>>>>    	  clock. These multi-function devices have two (S2MPS14) or three
>>>>>    	  (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz each.
>>>>>    
>>>>> +config COMMON_CLK_TC9564
>>>>> +	tristate "Toshiba TC9564 clock support"
>>>>> +	depends on TC9564_PCI
>>>> select RESET_CONTROLLER
>>> Thank you.  The reset and clock drivers were previously separate
>>> and the reset only became available if RESET_CONTROLLER was enabled.
>>> Combining them means I need this.  I will add it.
>> Why did you combine them ?
>> 
>> it would be a lot better if the reset were handled in
>> drivers/reset rather than in clock. There has already been some work to
>> move reset from clock back to reset. This often involve auxiliary drivers.
> To be honest, I got a suggestion from someone to combine them, but
> I said "no, I got feedback last year that separating them was
> better."  But then a second person told me that these are often
> combined, so I took that as "two against one" and decided to
> merge them.
>
> The other reason is that four registers are used:
>    #define CLK_CTRL0_OFFSET	0x1004
>    #define RST_CTRL0_OFFSET	0x1008
>    #define CLK_CTRL1_OFFSET	0x100c
>    define RST_CTRL1_OFFSET	0x1010
>
> They alternate between clock and reset.  The previous separated
> drivers specified the two offsets for each driver in the reg
> property.  But somehow these interleaved registers seemed a
> little off, so I thought the combined driver cleaned that up
> a little.
>
> I don't have any strong preference one way or another.  If you
> think they're better separate, I don't mind separating them
> again.  The two drivers are extremely simple.

Yes, SoC manufacturer tend to mix the 2, it is fairly usual and we used
to have many drivers in clock providing reset too. We have been slowly
cleaning that up over the past few years.

To be clear it is not strictly forbbiden to mix ressources but putting
things where they belong help review and maintainance.

There are several examples you can look at with auxiliary device
support, ./tenstorrent/atlantis-prcm.c is a good example.

>
> 					-Alex

-- 
Jerome
