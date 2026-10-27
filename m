Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793115034;
	b=VThPEDHdWhO4Ohm2RRlGn0B5Sqj6KNCvWTXp2mOqp4f5SOuGGVytXKUA9mwAlVUcw+om
	 g1Frzla/EHdyQZnSk41YyhdIReTlAtGn52IOY/pe+vgAmgSft7QdfAYElV/YoJsteH8e7
	 c8BHJ7SVHSBupjjzHrbx2av4Gz6n+mcJwH1sGnkojaH/rXhsB6MA6r9vcxL47WT1En30c
	 J7F2GDWX9Nqul6HW7cB0idtigbf5hrqtAzkKQrBtXSveb7+awCKh1kDllOJiUQLHcvDLI
	 RFHlXhOL+ahY8VeGX5CnDn4H+efgUAbz3givVkhKTFYGRLcO8RuP3Jr8uP9gvTx3OSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eoQNto8aMlxcB3SSXSPPkAQPmnjM1b+yzf4VeGep8zg=;
	b=ltM549UYOBaREpJXUsqrFCuSO9yuCrTfUJOOb6zQrlNd61bPMA32h+mnmGd0j271I0GG
	 jR3mqbJ0czk+G6RVr8GMlN3wAEBzj+5H9uhj7BTxcW9nYZ6eLzHCaA4qhDTQSMp3CZVSi
	 ubBakpzCejVjmbzr56LGh9nuYk3X9CmOnIki/mGPEiB2DYLvkonE/N8db2CLgybIk3AU1
	 m8y6DjUs0HyerIw8QEUAEDov1qf5589lEyjKxN5Qjv8BlCguXK8LARhVoW1LE9jGD7ZZN
	 wcCnvcFCULceLnL2nxtdNo8kPFR6U3ZT/BX4fvb/CIpjVTlf+oRJjScnrQr2ScH5OkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MidyLfN/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E1E606A31F
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 15:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07E1E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MidyLfN/
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a1947498bso826557eec.1
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 08:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793115033; cv=none;
        d=google.com; s=arc-20260327;
        b=q+MFw3rh8fuq48lgx3qONWnoM2wwFEzL084dQRTUIU55YBumB4jD8OdreOzkb5jkrF
         FLJEU5amEKfmXmAYGKvGA4WaZw46h+X8NH2ulgYHb8h18Ck9akwEzji1WaMdGqKdodO/
         b9jLn+PHzm/6xY0UgxmIAB9khmc87mvfEuHLTFiQ1KUBJtTQTbcPeqfldFdXWJ/OYsFm
         kzehK0KE+GFeSCfmg5RGPvwgg368j0iI/enEVzujP7JFyjxrPHLGarF5nm4bDeVXV7Nq
         vBh/J2i2jkZ1cuX0m0URHQcvKrV2XrUOY6Vc5ZQtGCbwsJyaFEBrIFyVdjXbsYG5tQKL
         5lKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eoQNto8aMlxcB3SSXSPPkAQPmnjM1b+yzf4VeGep8zg=;
        fh=08qfii4mSTuR/umLc8vV8bx0lxbV/25KeP/5YBM11KE=;
        b=rzqfQOeXhSw+Ot7gWi8VAtRscsH/ODrAgs1et2My6ZLEeeOWvmx4VrncZJMvrTCQ4s
         VDh/EyuIwf8K3oULTfvlL3Df/WnzPh0XGI8iueomy31zTozLcE88ZDM960PpzXzyNpLv
         TzhoG8BTFJ+u+FaEBV7DyPZsTzmKbyTcWFnnwZ0Q4Nqf5HHLVrJKasPnxqSmNVO+vRT/
         uKU3UXQnBMUFLIbbntuOz924sazUvXc/feawJsklVNurLuOW1vH2UD84FcnxvlpABTBq
         WheyEU1TL9oLPZzaGC0XuEaGzHV5pYxXBc0txaR2iOAZN432Vxg6uRH/U6FtQ5L9Au7p
         35VQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793115033; x=1793719833; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eoQNto8aMlxcB3SSXSPPkAQPmnjM1b+yzf4VeGep8zg=;
        b=MidyLfN/jnrR0Uj79vZun4cw0BK1OI7TIu5KP+f5rBPYI/8yl0dNolroYjfILGyBD6
         I8v53Iw5vYYAtQH4YkOHsxpVqA+p1oRrqGegmAbMOSu7Y1vAUia8/l/ixNPMP5JQP5uD
         podkdhPFpHkXq87BOSpu4BKRK84Zzi1KtuKV8Bj4NxBeOaKE5cQXAcHDMXvC3CEM3fAs
         2TLsyU/gg4m/OsL2mR3MA1FIaF6w/XiOzv2ghJHOu0JBN0pxlYBNfMrXAD29uQV0G0M6
         /yJAMi7iI+TNqRvP1nd8am5+fxFacrB28KLgNDYfWXz52cRBJQiEQwSQKhx5zprOJzm5
         ufIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115033; x=1793719833;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoQNto8aMlxcB3SSXSPPkAQPmnjM1b+yzf4VeGep8zg=;
        b=Ci/gYJHwFMK+Ffnt4tWyFKPX5k08MXwCCAwFlCCIwNTUFzdmM8pdFjtlow0Vrqgyj9
         hma7mi7bkrJm7zSepL8rbuOVw54d1OkwZ7kuynQHxPe4cix8f1QYuXWhI/UznMEAYeEk
         o2TKBh8JzR9Hc3KvlvQ33+qpGFSFLJIwx5U2QOVb/AcXWln2gc81KduJc1ngTqEOLBtj
         aRbo54qPyRt5YoIB7KvUg5m4xbYKx64K6u1AfvONmHO+Wz3CnKiMrpKnXH+orkIjKVjM
         pGzVUIEnv+tDQX6MRTtGGpVfvxC+d8CUY3lkJW4U+Md1ICo/QbAGCE3iXPaL6vdm5QRA
         QgfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxf6e5q/V2zI413dbEOQKGhZqciTdKo3vNxZxFSKHqt5jOVT5m7Y+yLTxbIjBYdyLZ+0ic=@lists.linux.dev
X-Gm-Message-State: AFq9FYJZVBBntpncGD6aGe581xdaH5CGiM0i3wcw4AyF6L+b9uDLjeW7
	TsH8463KpZ80dRU97WJ/aBxAKgBXP3Q6+PgmziHDRSGcH2fOZvmqFulUl6zNA7jFMBsFzHNnfxA
	q3GHG5x5KDpQgT3Yt1Nq4tUL3bROvNK8=
X-Gm-Gg: AYBFou37rxAHade8k+VIcaBcduRPr12cXyLIYV4/VSoumpxJ2LEv1xcIo3KI+N3y2wN
	L0a5LqtSoQGx76FVoobGbV42hjTcDK8AgKOJ+kSyQ3dbZEMMZrHnQHCQq9d3orXuCIQKkVxeaQp
	wAjyHbQYaKCnNLL1TUec+PheWkIVK5EYTU5tICllPqQUlJABp7FED5YMORgqJOk+ggXG+nkMkB4
	Yshd+uFoyGMWsI9Ki6TJK7v+jFYNAuotc4++5iT1i9iGj5wHi47BT5vyIgScJ70PMboiDSrzW9/
	mQJzjXGlOfkL0CznAKiStartCtyreY1HBopACDJLt0x9Jd+J27xhCSP59KTrCQaK/ocGXYO/dJk
	Blhh75KdGrj6oW9JRszYMpHr6j6xyPy8zEyQQYVg4gaEvFeFrpd0BM653rd3c0AaUhkxoFQ==
X-Received: by 2002:a05:7301:78c:b0:36a:16f:c550 with SMTP id
 5a478bee46e88-36a016fc6b5mr8139945eec.15.1793115033016; Tue, 27 Oct 2026
 08:30:33 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261015102320.23760-1-clamor95@gmail.com> <20261015102320.23760-3-clamor95@gmail.com>
 <179206474862.1869456.3359147212046371469@kernel.org>
In-Reply-To: <179206474862.1869456.3359147212046371469@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 17:30:21 +0200
X-Gm-Features: AclHuK8Zlu34WY5VMtUQgRpQc9IteaYIlIoPPVl1LsqWovajge3AsVoa0lEfyQI
Message-ID: <CAPVz0n3uWJQ6oMTq_0y8djfO4v=D_EDYbWfXqWhXxZJbJydTog@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mfd: tps65910: Add restart handler
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Dmitry Osipenko <digetx@gmail.com>, linux-omap@vger.kernel.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:3=
1 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> --- checkpatch.pl: clean (0 issues) ---
>
> On Thu, 15 Oct 2026, Svyatoslav Ryhel wrote:
>
> > From: Dmitry Osipenko <digetx@gmail.com>
> >
> > Add restart handler to reset hardware properly on system reboot.
> >
> > Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201
> > Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # ASUS TF700T
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/tps65910.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >

Thank you! Your suggestions are valid and were applied in v2 here:
https://lore.kernel.org/lkml/20261027152423.194794-1-clamor95@gmail.com/T/#=
t
