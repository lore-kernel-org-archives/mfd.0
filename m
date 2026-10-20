Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792481250;
	b=riREHvR3kGFyEQDD3NfsLTONwbdpntUvNHAtjYpWbi1yy69gnMR9BXLOPglu1zUy6o7L
	 ad66QVQm+zDkxYarkBpScJQrATjHRdnX/nce/vb6iOl/KRubgy07Knex0WWkSFlFfE/yy
	 X750EOMLuDTn7hnHzKalSiCLkHnKumdhXLSmgOoOk9S8mIjP/2L4nbRXWIRp0LGCUIAm8
	 qBu4rUIV6ee7Q17FFHDEellH0NujjKP2AhKYSWgHTBPpWMexTKn0li22WLzNsrdgxBo9f
	 lxcsuUWyAM07yVnpwGSLq+7eW0WLoWUls4JWgvraGxNVlfOE3JrDFdJrPYP8jc9Bofw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
	b=KsO/z+eY134gglrlLm0LcCArzDG2spAu4wc+Qq1CXawGnTNlP6+np5mKoDlFgJaRKHzd
	 KflyhJmxn7d41RwPkPyXxChrSPv5QmwI0JEOEnbtz/4XWhpIuhuDgSNTuie5xHjZ1CW9X
	 3lyZk1TsiBtg+E6Vdb67UejuRxe9xzlp1fkqQldlM7J2QWyj/J16RR7Csw7hD08j2QMdh
	 tITixforgt4z+ZExoPjZxHrah0b6E1jCtxyaEbGTSxq8ZnDxXtJesiTYd6hxAQTK4otPv
	 iYdIRh4aXfnml9RzlvCh8tQG5uTa0dJWxx4pYJybIc1nyivERjzRRMo6Pq1CciWDs1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="C/lRtkB7";
	arc=fail smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF829606A31B
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 07:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF829606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C/lRtkB7
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso5572029eec.0
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 00:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792481249; cv=none;
        d=google.com; s=arc-20260327;
        b=SBnqyeC3BiR6Mn4pKXZdbEFBAuMdb79EnlwipH9ti3sd/t7PJS3m5zLC+N4yg3+Mxy
         GfRV8ZJ4yKJrrgfN/IMcrPRPqSvk9RR6mFKtgmZT157vsRxUmCMjNS8L2tCehahUZHdR
         Ik09JmLTATnP6St3Sx+Cndjw0fgRVHVSVK1zGRMBTusE7unj95WK+v6KbzH9tcfgZlsu
         JU0aj1cmifFOkcgcsk2VPthlbliAnIcEp7iHsrYxg9uoxu3qBPR12B5Kg6HYJNBngkRP
         xKqidJIZDe3nULzH1yB8UsjYchKHblemeyfE/3y+nZH0u2Mj9mCN/ofgAldOFvCAI9i7
         Ziuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
        fh=LGwheJPS2U0AkxtkzbqWtLO3Z4IFt8i0RxnN0VnSjqU=;
        b=iUJAW62/18WPCt9TjRpenu08YMlSbjmZFlLLQx43EZ9rmomHKyUCvQ0r1/yZwdZVi1
         LcU+74pQiUzg3lLX/7HNU4zCcOQll9qZlwT2ZBRUNxXi8Ntp9AJAkPRAWAqOLJbExPQM
         4JqqvIuAgNNZx2/nTnM+jNCNYomtg6JT9zIhe+jEayfOolixB+pF47q0xF6oQ3cp62ny
         fDpEatJSgQk+ZcT3tDWPrA8bdmIof1j3xuJ75YfCsab38yYDIWPxM0K/ad0UqWTTg0jp
         RpvLrauR+UGKnPiFl1PF3Ou3nLm//lm+rePTj/sh0+yTzfWUVCSo/13KXKQSTywcF/iU
         WWfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792481249; x=1793086049; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
        b=C/lRtkB76C+GkDjqf4ea8H0bF42+qzhIWS/onMEiqQ4FzFmjIJI6Z1itbJxrLLyEw+
         TvbvnPDO2590kjf0vpTmQ7ix9wLpY+MlBES1B29knxJ4nYI+Zs4cS8lmuqKOSzdeqeOU
         oyNL9yChmUJ9Sme7fr5K0fV4nw87DtUSZAuaSw8r4fENHpZMks+1W4+rr6G2wOYDWOye
         fkeHhYUCa53Su5eFdgv+1PBxiE/9pRcOJ5+D3GIsi1iZOIxofWVm3dNuOFCS5lcZ+1+E
         gqWEoL9uLKOE9NAXTlXOzQppbtwYiMdslKVlBcuvnpro3qiPSYgJOcciq75a/ZZRDhu7
         eNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481249; x=1793086049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oreBUFr7UOwcag4Lyp3MhlrEMw46izSqLjbflLZfF9M=;
        b=CREnxF4QoFQhMeJbzcHtFnyZbJHCsRTNUGKl2BjMOyfILnNDu3NxsnD4YE9CddeOPF
         3GUVRddmlkqaDzqHOwTFdoJMJr1wLagCu1Wrqr8jRWkztLnVIYo5PvIY2rt0Nscchz/V
         iwXiFm4ETs3LaOpiJ68p/85RaC+rPEMlmIYqCqFBrg/XVv4s5dpZHac6qBBvypUUzxmo
         xlm0F04m1AHlTUEbLvMiwNRwOMLX9hLstAd+uwqTvEnGGluk7VQz7SsKd06SOZSiI8Oh
         4rgO/Yuc4Alm4GDVWgYwCvgnoRv8EzJkHOAMT4gvcy8UkHha4QE6OycenXGlNa36bzTy
         jwLg==
X-Forwarded-Encrypted: i=1; AKwUvBxCQSDsQzWoqpSdbLiMc0mVgeMJ5M6NK6af4tkHYMUHwsIu95/q2w34m86AT/b910x1gYQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYLovrQkgv6FdnB/aI4HsWjL3RZMcjOBN6tyz8W3S8XtDZxI1vae
	di4P5LtgJ/vEDpKkLvt5uS2BDfHmIoAYJq6L1JgWH9eS/VJqMT3SWv10ipg+Nuni7JlkJQeEvP9
	u20H1IbvHr8xCb+5yggxmsL0u1wl8vTQ=
X-Gm-Gg: AYBFou2uv6G5DTntkUgvYIJX0CfW/f5/XAn5va/HH9hmCdgEVi9sSz8SOgVVzDWpUgT
	wpYCQY8XF2yTZLav5EyYp9AOCGM2UYUgfNcDSS3HtFqKCjctl1U5c+rhJJjAtaLBQx4Xm+sPMxW
	aV5KUVFP9ghk8Mp5ycT2b5QlRR6tAkR7y+Fyem/skjafrRJ1sNz+R5sRdlI0RuuBlRqheu7wFAg
	qTnzEJjZmOwVbzjU5Qjiq6c2CJ5OxGAzI6nY7UQXiZ576pGwLnw9aLv+z26kDKBlHBHrIt7SRO1
	ET6jKdqvvNBFX6yg9IkYO6fZqbXj5EJu8XLNTpkHUtVuxYyofoVE32ich+1SP6uUR1jGheP5ro+
	Zi09pDqG3wFP/
X-Received: by 2002:a05:7301:140c:b0:34e:67d0:bbb4 with SMTP id
 5a478bee46e88-361a0e85fdcmr14132186eec.10.1792481248787; Tue, 20 Oct 2026
 00:27:28 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <70f4c4d7f6263385d29ed8baa2106769@fkr.dev>
In-Reply-To: <70f4c4d7f6263385d29ed8baa2106769@fkr.dev>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 20 Oct 2026 10:27:16 +0300
X-Gm-Features: AclHuK9h-tQcbXrVM0viwwPsC9zuaQ4jRTMIV3P7VlE38_D0lFsuAg_ZHkgq7SA
Message-ID: <CAPVz0n0Oiok9vx1xmTPPpv8+iHCfL4XTE+D3jBMc1rUUHAftMg@mail.gmail.com>
Subject: Re: [PATCH v12 0/7] mfd: Add support for Asus Transformer embedded controller
To: Florian Krischer <florian.krischer@fkr.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 20 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:5=
7 Florian Krischer <florian.krischer@fkr.dev> =D0=BF=D0=B8=D1=88=D0=B5:
>
> I tested the v12 series on an ASUS Eee Pad Slider SL101 running Debian 13
> with the 7.0.1 postmarketOS Grate kernel.
>
> The system booted successfully. The EC identified as ASUS-EP102-DOCK,
> firmware SL101-0202. I verified keyboard key events from the EC keyboard
> and touchscreen contact and coordinate events from the tablet's maXTouch
> device.
>
> Tested-by: Florian Krischer <florian.krischer@fkr.dev>

Thank you, Florian! Your feedback is quite valuable.
