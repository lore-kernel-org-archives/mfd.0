Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE90047D920
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509674; cv=pass; b=YdHQLPwBJR4ScqKfe+PUAi9p5ELqXUGza3XdrbyAfJbe9X/HYEEf70h7LLA1IZoXrp6bo6fTECs3a28rXuuh5gLnigWHPw1jn+q71hUx+6j1hZd9aWq+4ZlTFxU37mJ0BVMoGzzvzlPxhve51mgMYZkumbBfNYDXY1CywUfrF6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509674; c=relaxed/simple;
	bh=sxTm1fV0wN8yufOFAAA23WvJefkJ/ggYcteJQQdtpw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqOnUba0U3D54HsJKRufW+EEpDaDrivVLud7QqGyWCZYql1Di880uivnmcIPXvVTZ4HG1iidH9kK24GAyWzhkWF8lIr/8W3SFTJ/ejUPPjCUXaK4hOwoM8IAhp5Ss8S5ZGaUXNxS1nGbwjmide9B5CxwKaT51tmrqdKonL4Gfz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jzem5mnx; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jzem5mnx"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c12614b81c9so102295666b.3
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783509671; cv=none;
        d=google.com; s=arc-20260327;
        b=OBgxBgFTbp96LpcFdCuYVUFO9yOXOa60X0ce3+aJWuziC2RMIJkcoR9WFqSD/g2A7k
         MZ3yiAiIchuRjlU2p6HIyP1QbbA/Vn8KVD//kxQRG0/M7YS0qDQ16r/T6R06hijnk6ZS
         JaJbBk6kFe02ZWrL+83+MveQ4R3QD0dWBgvifNwRuNuXTu3DnSMaLyVd3cyexYqg6NQ0
         PigSjh9TdJtqxsOgb7ZC/9H4ieyVbQN0DifolwTtm7BzU4By4peApkPj2KrUXWu1YbTz
         RoGigoSqwgC6dHb0zV+/EGwnWWFlTCr1SheWvc7L/GGTCquVzV3VrCbhxS/rUEM292H0
         p93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wg1Pltfpu5Izl1NFsHhM5RN0Y8llAXCSZAgh063DTEc=;
        fh=esLxoh2xtGO1pQUxv3HQbwvHqeLZahj2KIz0dkikixg=;
        b=F5Tk97y+uCnNeV6CRD8u+dsp9/Od09NB30SxD9Q0XFC22S0oDi67H9uGhGdlP8xfXS
         RKPK69ym2Ghwl61GMRFHGWjN3g5sjD8L2LRX9bX25DBCfa4dD/ejFjWWGYmzjYX8QV65
         GWlWQGrL1mX5kf5p+0czGVidFJ4WYwd+mYgkMdQiTOokLBoIs02ORC1ErRxyBepQ9Su1
         SDl2yvGP8pr5Vxs1OE0UpZ8/dgl03YksEcbsPFk1t8wvuhY/9Dh7neGlpsotuOgGCNM/
         RkH5+A3QqROipwOz/6m3cotBlrOdlsSS/XcNO9ZP6uZaIVyZR55PDhnQJtrbKiy0mmtI
         SkFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783509671; x=1784114471; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wg1Pltfpu5Izl1NFsHhM5RN0Y8llAXCSZAgh063DTEc=;
        b=Jzem5mnxmlaK77RGd4MuGUnS5rA5tQyQR28G2v0JNi4WczhUzJeReb2YiF7EaoQ1+x
         lYtQE6/Uifn8HXgJkyN5U7ZxPt3Kp5wUb7V2QI4O4rbZIG0D/6lGnE0QxwUwZbskItEs
         qy5XTaOh0h/byDgDf+T11cKY6Sp2W11tvNPRBOlcdFEG+rJH+AsCFsfzQwXYv5CWAWxp
         qd965ZZ5QFez0AhKaSQWVUTUIt5vU3+ILCqQOz0eT5CIlQVIC6CofanYna92g2DbSb7V
         ZS+vvNqSpf4TK14HKe9duba0PvDNJsG/Cj+tKkZMaDhH59Msg8Ee7XEAiwfyWGtN9DVR
         g+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509671; x=1784114471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wg1Pltfpu5Izl1NFsHhM5RN0Y8llAXCSZAgh063DTEc=;
        b=BoGztKxIyr14h/x64isLVHdEOvkVQ4YFZw7OMtvd2O9R/+aXq5nNUJPpblYYnIXwsM
         kcQfFeXigTaF4Z3LrzBNrR6Hr636uVw1nQlEWcCyaToHTGtUfmRb47RPrjJQgOYm0CAl
         vHFR8IOrsNEkW+gyIBiHRoQPjWTz2tx523p8UO3ttdqgtJNGWr0ktgWOYykw728/xUhI
         POtoRdzTa+BYmjOjBPwjFggA5kqluj3zvOIktVmP7FG9mOfOSo/j02WdMMwST9OHaezT
         d7jX5LHPxpVNWIbm1FzrPHw/+AYYagHM3CALDu1JqWM+jTjd4KDZrMwDkZeiBzksSyr8
         udqg==
X-Forwarded-Encrypted: i=1; AHgh+RrlxxNMym99zI2tbiPpvOOn6ArU6hncd+wsXMra4t0y6kqIbCZJimQAIRJBDsOoaNT+9Ns=@lists.linux.dev
X-Gm-Message-State: AOJu0YznB4EKg3f1HWAVHJY1wySO4nbsOS9mqd69kfSulFwTydGVbL/N
	KV/77I++egJ9/4yL/RXrpDbdCAiojzWA+fSeiT2dSt9zHzqJGzh4/QE+bvyhWOLdbijHMVAuf3L
	2utL4sURP19rNjKWbf/ejHE9JpfLudQg=
X-Gm-Gg: AfdE7cnxtsucSgLFpU+ohdMYDwzd2qDupUbOINFBGUIhysRuUp99HTh/fY2ci2g7/SK
	lne7m/t5mpuianPmGcKvb9LlFc2c0KTjvzEubcxO1eoiiUDlqZhKh40uF1sO4yYMMyJOAJ9EXBD
	rEmdOB75o8s5s5SExNFBTCEMs4jnCMRZLLrWtBvdo4Pv6yknKkDY7BwmVgyG7NJIT2Jc17pMvAp
	LrqDmJZ9JMuJOd5HhpAyaSWOGy72ItCLHyJDRE5Ws8PtmSNQJ3aaCzwB0Nrkp/5YDC3gprip2UP
	wz2BVWj8qquyRANBZLubyhCnvpi9afiaQa6kMdZDqgxwXYeX9duqRe7k7+kFvLUaNx6BqFdcg+a
	6YTGQAKFHaJ8lVWPwDH1rqxfJxBMjm/Kvxn07/OrkGCWIBEinE0mW1nKXpoJ9+IiMB991
X-Received: by 2002:a17:907:a286:b0:c12:a5fb:ff22 with SMTP id
 a640c23a62f3a-c15ce1e13b4mr91075966b.50.1783509671143; Wed, 08 Jul 2026
 04:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com> <ac8389353ee128d3841cf91c27ef84a8cfa3b5ca.1783507945.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <ac8389353ee128d3841cf91c27ef84a8cfa3b5ca.1783507945.git.u.kleine-koenig@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Jul 2026 14:20:34 +0300
X-Gm-Features: AVVi8CdHZRQ8JDdQAY9urGf77kybIGx_VhFVrRtDnRlB9kd2FPJpqh-iIUTt6R8
Message-ID: <CAHp75VenO8ZirZt1DPsrX4LVhFe4cBtbJ8QNN98BRqeuQDSs8g@mail.gmail.com>
Subject: Re: [PATCH v2 18/23] mfd: Unify style of acpi_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Andy Shevchenko <andy@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 2:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable H=
ub)
<u.kleine-koenig@baylibre.com> wrote:
>
> Update the various acpi_device_id arrays to conform to the most used and
> generally recommended coding style. That is:
>
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>
> Adapt the few offenders accordingly.

You combined different type of drivers into one patch. I don't care
much about this, but personally I would prefer PMICs to be in a
separate patch, and the rest perhaps per driver. In any case,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
it's up to Lee.

--=20
With Best Regards,
Andy Shevchenko
