Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795099902;
	b=tmTgt0B60Nlw/iLuWC2N+HV8ADIbIWvPVQaOdIJ6lei2WQPQZbeBTp1QLcYE4/gYA4rU
	 3++bH5WkPA/Jxgd0XeZzHd7FLqLaYq/R/L4LqMsQSLhsBOtkt/3SA4/Iwl0vnEXtP+ntT
	 A0C3HtzqB8GemXRXaJGgBA2vDYI/aLSyq2vvJoPr/prhp3FVnLXGFuCJtdRZTYzGPhA5m
	 efEQ6lVeoDvIL6lKsmRD/o14QAX7hoEiE36+gBqoAQKzH/7QB6RIrazXWNleARiToqXct
	 bwkdzXqLejM+9KnGBkVe7fx31xqhZqQondploE2XivucIfquOGWuVlo6FEBtiqBJChg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rVz62QW1HjQ4+uCtzasNNB/vluTYkgnjHw0Yp9wwc8Q=;
	b=IXY5vaxI6t1gC2JJZHfq9rfADMgneES0AJgXZYPqJjg6426fHnFcYXk7DBqLAE3IlPtl
	 pThY3CwkZV88J8TxvTW8BApfUR1DFGE1mXyc4BXKNYqhsmgJZhUQgMVk1YtfLA9ujvlje
	 mlIer3vSVI2A5p3oRIW4/SFGmok5lgicTHW2dU+boM0YH9Exj+eSOD4YnbGQksL0U0W5T
	 S8/EGyj3Ymk3YegitGry3ZxTKp27Gq5W+ItixW8DDnbjn/3j7dwQouVYB16NW7t9m7abO
	 n2eBMsSVCjOCSxX92azGSIA1etULHcOHtJQ4KHfq709fzktijUUkGTVQqifwZ/eXimA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROQYqJO8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855CD606A339
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 14:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855CD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROQYqJO8
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38318d69173so3273767eec.0
        for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 06:51:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795099902; cv=none;
        d=google.com; s=arc-20260327;
        b=st3DwT29RLnP7GqTPC9sCu243/xbEPbmyD2zSTyuwJCLbtEVaxvPdbnypKf55NB7+K
         80QK/reg+jWtTL2ToDXfO7eqSkrvSC5cwY5JRrXMBfDhVYi6W4rABHrnv/x3kG7TXa/C
         jRZNnnRJb6ikVTAwt3yexesHBfxXV7qFCAKFXgkOG7A4V9xL98aaO4dCiTPwDsxa2hqY
         4bT8QSu+y7gTZdgUo5rZdL7mBmc79A8RanECQZqB9CRCMug8lUDFOSI87gdwRDGc41CQ
         Xlhjg3a0nuMZO2p3H/SGEI9NXzG169puk9MTRCcKG/E2WtizXgG3dVLm4aXEWVcdvqQ9
         2HuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rVz62QW1HjQ4+uCtzasNNB/vluTYkgnjHw0Yp9wwc8Q=;
        fh=8aGCc91rnHatSuVi4uhixxP+DEHYvUnV4Pw6cwaA0HI=;
        b=NnTFB3nbqn5vxNMHZ5ppVYhLcbMC1cahuy/PC98bH4b4kz+r6xwp/27+bmuJRadAUx
         9fKmn0uWi8sksj1YFQ8l1iYMIw/IFlbg6Dj5eg6w+QN6et0d1cK4TpvRXoLiCvYei2SW
         jhVNgFKx+J5YbK07JupSIkAvGGK/Mg3AlZ2pqvGhUZTQQ+qRlFMF7SJmQ6r6i4tX7oa8
         nGU/ze8OT0+mo4bfduYcKDOLzO5LV87ae2930ZJwRvS4g6g5uaT58nXebMp/QwWSQOdz
         amWzppCEhBj8TcMoTdrWlgAy3BRasLxa3XSNIZw5X+w9PtQZ0xCIEAJ9xvo46f7hTUmp
         pHcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099902; x=1795704702; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVz62QW1HjQ4+uCtzasNNB/vluTYkgnjHw0Yp9wwc8Q=;
        b=ROQYqJO8eGI2yEDP5sk1SjpZVxc6ZYmAP1vWA08ImoQU/uVjZXFqT7x+qBdrx3xPIK
         OtXYXSW5rAvjsqajHHrQN8rYuj4K/aMrlnzYZauNrSggP/kHEMad+3RvljKhsoyA6194
         6LAI00GhF0+IaVb0eKJIOZkMBtnEQEA3EX5xP7XebZtB9v2oYNEO4WGcvDbkwoytwQGG
         rSReTSuRXIYBjSps2e+bIQ8o9ZMuOlRSjIRxPylnzM7UoXUwRlOtixTIpLYhsLuuWcY3
         3lYn3wBiyjlQAEa9namP9Ze/Ac9++VU46ENMgAwPvUsiOgSidQtkrCtcbukiue137/tM
         rsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099902; x=1795704702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVz62QW1HjQ4+uCtzasNNB/vluTYkgnjHw0Yp9wwc8Q=;
        b=bQnAgUunmEKi/isKzEqj5D6ug9kxmFGBYT97slSPQo1nqR0qhWkrN1ifbNvUPxTqKk
         g0LDqSi9IHFAf1xtPmObBDegQpCy5/GdHj02HbBw0YfcbddX7sSrTOglanYLyKnJ9tEk
         uyn7h7VA/ml6ruorGygHwG1yodkTIpbbrh8xlVuCMNtAXwEusZDU4TFZqeePV6/A8N5p
         QwZCr+LQACP1vJBDAYsKtJjc+n66MwNkrK3smqkWV0EUTYCOAr7Vt1C9fh6L//KNarMo
         rXeeIr3mZr/gjfrvM1rNCJdHnT1h14yhtPGNlxQnvZBwNVhKU3BEzTBIm4XpQZ2HmAC3
         lqlg==
X-Forwarded-Encrypted: i=1; AL+hErFS8mN+CwdeCwMTcYEHZyB1Tk6C1Qoj4QAnHpki1UTb5bOSOvejVPq5d9kHHIiMUQubVbg=@lists.linux.dev
X-Gm-Message-State: APuU4Z+VPux3WazEzczlgM1skRyJPJKjEP94OPRIt5joU6mTkyPpVx5P
	Kx6KTQpwyxQxaqjl8D1cpTkMHq2ShN55dLUrebhtQHiRRHpYchhG5Ecv1Q+F1iSocpq9vFcK0/8
	7nwrOPIEDTxsF9iPaRuaiPtgI42FQp8g=
X-Gm-Gg: AZFdTZcRf8pnLcI/xbnD4lbYKa6t6o1BeefqKB79iuGeAkDEJJlaZUw/EJGnZuaagTS
	CnMTi2O8Rc56b+ze4cRUss0pEzOes7jYbx7/0X26FiaQlvVSj5RNDjiN3myXD3PWhqLaFz4iTr2
	O3Q2+yA4btScmPbdWrcQ1m9XFHq/l1n3ZPFgKm96zdICc6wQN2qGJgJ+uVnuJnkz+E+1rQ/Wj7F
	PhCqnks1IzE9HWgBclaUW1mcFns+ICumGwCdIhYVmKaDYDBnEwYmIHABVDhKUehRGBLtbZIDH0n
	uSl8eAaLY0nn0weAsPjwoPr8KaOaTU8b5ccWZgwvjXOrGhq0T3by/5SImDV1ar78lYuzVFEzFUG
	l47t+epCGgvuGP+7SwgbY0hIVo1SnkambaioonUxYG9XTH8j1yAJTp1kB2kHJw/6KZIhAtlt7sp
	LNlyBqXVGMZsNdLzcbZTJ1994Lli/x4Q==
X-Received: by 2002:a05:693c:8803:20b0:384:b001:4350 with SMTP id
 5a478bee46e88-384b00145cdmr1285277eec.24.1795099901356; Thu, 19 Nov 2026
 06:51:41 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1795095742.git.geert+renesas@glider.be>
In-Reply-To: <cover.1795095742.git.geert+renesas@glider.be>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 19 Nov 2026 16:51:30 +0200
X-Gm-Features: Aa3M54oSpPPjIjBXKWbeu_LdZEGptwUS0dUMO0QTPqvZvvRh2xuuU1prMieCCXc
Message-ID: <CAPVz0n1+qXrO5P+rOBKOSOE86+WcmjNF0taWDZoWqerKrjVgJQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Improve MFD_ASUS_TRANSFORMER_EC dependencies
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Lee Jones <lee@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 19 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:5=
2 Geert Uytterhoeven <geert+renesas@glider.be> =D0=BF=D0=B8=D1=88=D0=B5:
>
>         Hi all,
>
> This patch series improves dependencies for the MFD_ASUS_TRANSFORMER_EC
> MFD driver and its various subdrivers:
>   - The first patch adds a missing dependency for the MFD driver,
>   - The other patches enable compile-testing for the input, serio, and
>     battery subdrivers.
>
> Note that compile-testing cannot be enabled for the LED and charger
> subdrivers, as they have a hard dependency on the MFD driver.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (4):
>   mfd: MFD_ASUS_TRANSFORMER_EC should depend on ARCH_TEGRA

Though this EC is designed for Tegra based devices, it does not have
any Tegra specific parts. It can be used by any other SoC.

>   input: keyboard: Enable compile-testing for
>     KEYBOARD_ASUS_TRANSFORMER_EC
>   input: serio: Enable compile-testing for SERIO_ASUS_TRANSFORMER_EC
>   power: supply: Enable compile-testing for BATTERY_ASUS_TRANSFORMER_EC
>
>  drivers/input/keyboard/Kconfig | 2 +-
>  drivers/input/serio/Kconfig    | 2 +-
>  drivers/mfd/Kconfig            | 1 +
>  drivers/power/supply/Kconfig   | 2 +-
>  4 files changed, 4 insertions(+), 3 deletions(-)
>
> --
> 2.43.0
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                                             -- Linus Torv=
alds
